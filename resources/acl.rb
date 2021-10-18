default_action :create

# @!property url
# @return [String]
property :url, kind_of: String, default: 'http://localhost:8500'

# @!property auth_token
# @return [String]
property :auth_token, kind_of: String, required: true

# @!property id
# @return [String]
property :id, kind_of: String, name_attribute: true

# @!property acl_name
# @return [String]
property :acl_name, kind_of: String, default: ''

# @!property type
# @return [String]
property :type, equal_to: %w(client management), default: 'client'

# @!property rules
# @return [String]
property :rules, kind_of: String, default: ''

# @!property ssl
# @return [Hash]
property :ssl, kind_of: Hash, default: {}

action :create do
  configure_diplomat
  unless up_to_date?
    converge_by 'creating ACL' do
      Diplomat::Acl.create(to_acl)
    end
  end
end

action :delete do
  configure_diplomat
  unless Diplomat::Acl.info(new_resource.id).empty?
    converge_by 'destroying ACL' do
      Diplomat::Acl.destroy(new_resource.id)
    end
  end
end

action_class do
  def to_acl
    { 'ID' => new_resource.id, 'Type' => new_resource.type, 'Name' => new_resource.acl_name, 'Rules' => new_resource.rules }
  end

  def configure_diplomat
    begin
      require 'diplomat'
    rescue LoadError => e
      raise 'The diplomat gem is required; ' \
        "include recipe[consul-criteo::diplomat] to install, details: #{e}"
    end
    Diplomat.configure do |config|
      config.url = new_resource.url
      config.acl_token = new_resource.auth_token
      config.options = { ssl: new_resource.ssl, request: { timeout: 10 } }
    end
  end

  def up_to_date?
    retry_block(max_tries: 3, sleep: 0.5) do
      require 'diplomat/version'
      old_acl = if Diplomat::VERSION > '2.1.0'
                  Diplomat::Acl.info(to_acl['ID'], {}, nil, :return)
                else
                  Diplomat::Acl.info(to_acl['ID'], nil, :return)
                end
      return false if old_acl.nil? || old_acl.empty?
      old_acl.first.select! { |k, _v| %w(ID Type Name Rules).include?(k) }
      old_acl.first == to_acl
    end
  end

  def retry_block(opts = {}, &_block)
    opts = {
      max_tries: 3, # Number of tries
      sleep:     0, # Seconds to sleep between tries
    }.merge(opts)

    try_count = 1

    begin
      yield try_count
    rescue Diplomat::UnknownStatus
      try_count += 1

      # If we've maxed out our attempts, raise the exception to the calling code
      raise if try_count > opts[:max_tries]

      # Sleep before the next retry if the option was given
      sleep opts[:sleep]

      retry
    end
  end
end
