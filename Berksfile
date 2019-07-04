source 'https://supermarket.chef.io'

metadata

cookbook 'seven_zip', '=3.0.0'

group :integration do
  cookbook 'selinux'
  cookbook 'consul_spec', path: 'test/fixtures/cookbooks/consul_spec'
end
