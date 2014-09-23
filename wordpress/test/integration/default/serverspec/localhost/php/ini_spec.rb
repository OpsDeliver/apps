require 'serverspec'
include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

describe 'php::ini' do
  context file('/etc/php.ini') do
    it {
      should be_file
      should be_mode 644
      should be_owned_by 'root'
    }
  end

end

