#
# Copyright 2015 Rohit Amarnath <rohit.amarnath@full360.com>
# Copyright 2015 Full 360 Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

if node['platform'] == 'windows'
  Chef::Recipe.send(:include, Chocolatey::Helpers)

  node.default['consul']['install_dir']    = "#{chocolatey_install}\\lib\\consul.#{node['consul']['version']}"
  node.default['consul']['etc_config_dir'] = "#{chocolatey_install}\\lib\\consul.#{node['consul']['version']}\\tools"

  include_recipe 'chocolatey::default'

  chocolatey 'consul' do
    version node['consul']['version']
    source node['consul']['choco_source']
  end
end
