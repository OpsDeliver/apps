require 'serverspec'
include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

describe 'jenkins::java' do
  context package('java-1.7.0-openjdk') do
    it { should be_installed }
  end

end

