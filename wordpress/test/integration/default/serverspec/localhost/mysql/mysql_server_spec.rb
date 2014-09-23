require 'serverspec'
include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS


describe package('mysql-server') do
  it { should be_installed }
end

describe service('mysqld') do
  it { should be_enabled }
  it { should be_running }
end

describe port(3306) do
  it { should be_listening }
end

describe file('/etc/my.cnf') do
  it { should be_file }
  it { should be_owned_by 'mysql' }
  it { should be_grouped_into 'mysql' }
  it { should be_mode 600 }
end

describe file('/etc/mysql/conf.d') do
  it { should be_directory }
  it { should be_owned_by 'mysql' }
  it { should be_grouped_into 'mysql' }
  it { should be_mode 750 }
end

describe file('/var/lib/mysql') do
  it { should be_directory }
  it { should be_owned_by 'mysql' }
  it { should be_grouped_into 'mysql' }
end

describe file('/var/lib/mysql/mysql.sock') do
  it { should be_socket }
end

describe user('mysql') do
    it { should exist }
    it { should belong_to_group 'mysql' }
end
