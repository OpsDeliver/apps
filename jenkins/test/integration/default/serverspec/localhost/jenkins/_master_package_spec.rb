require 'serverspec'
include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

describe 'jenkins::_master_package' do
  context package('jenkins') do
    it { should be_installed }
  end

  context file('/etc/sysconfig/jenkins') do
    it {
      should be_file
      should be_mode 644
      should be_owned_by 'root'
    }
  end

  context service('jenkins') do
    it { should be_enabled }
  end

end

