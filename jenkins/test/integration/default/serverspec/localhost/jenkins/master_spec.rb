require 'serverspec'
include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

describe 'jenkins::master' do
  context user('jenkins') do
    it {
      should exist
      should have_home_directory '/var/lib/jenkins'
    }
  end

  context group('jenkins') do
    it { should exist }
    it { should have_gid 501 }
  end

  context file('/var/lib/jenkins') do
    it {
      should be_directory
      should be_mode 755
      should be_owned_by 'jenkins'
    }
  end

  context file('/var/log/jenkins') do
    it {
      should be_directory
      should be_mode 750
      should be_owned_by 'jenkins'
    }
  end

end

