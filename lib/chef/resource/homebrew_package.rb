#
# Author:: Joshua Timberman (<joshua@chef.io>)
# Author:: Graeme Mathieson (<mathie@woss.name>)
#
# Copyright:: Copyright (c) Chef Software Inc.
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

require_relative "../provider/package"
require_relative "package"
require_relative "../dist"

class Chef
  class Resource
    class HomebrewPackage < Chef::Resource::Package
      unified_mode true

      provides :homebrew_package
      provides :package, os: "darwin"

      description "Use the **homebrew_package** resource to manage packages for the macOS platform. Note: Starting with #{Chef::Dist::PRODUCT} 16 the homebrew resource now accepts an array of packages for isntalling multiple packages at once."
      introduced "12.0"
      examples <<~DOC
      **Install a package**:

      ```ruby
      homebrew_package 'git'
      ```

      **Install multiple packages at once**:

      ```ruby
      homebrew_package %w(git fish ruby)
      ```

      **Specify the Homebrew user with a UUID**

      ```ruby
      homebrew_package 'git' do
        homebrew_user 1001
      end
      ```

      **Specify the Homebrew user with a string**:

      ```ruby
      homebrew_package 'vim' do
        homebrew_user 'user1'
      end
      ```
      DOC

      property :homebrew_user, [ String, Integer ],
        description: "The name or uid of the Homebrew owner to be used by #{Chef::Dist::PRODUCT} when executing a command."

    end
  end
end
