require 'serverspec'
include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

describe 'php::module_mysql' do
  context package('php-mysql') do
    it { should be_installed }
  end

end

