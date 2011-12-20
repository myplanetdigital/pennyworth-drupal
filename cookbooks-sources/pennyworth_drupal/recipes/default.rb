#
# Cookbook Name:: pennyworth_drupal
# Recipe:: default
#
# Author:: Patrick Connolly <patrick@myplanetdigital.com>
#
# Copyright 2011, Myplanet Digital, Inc.
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

bash "Generating known_hosts from github fingerprints" do
  user node['jenkins']['server']['user']
  group node['jenkins']['server']['group']
  code <<-EOH
  ssh-keyscan -t rsa -H github.com > #{node['jenkins']['server']['home']}/.ssh/known_hosts
  EOH
end
