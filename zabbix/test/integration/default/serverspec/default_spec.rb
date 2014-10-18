require 'serverspec'

set :backend, :exec

describe 'zabbix::default' do
  context file('/etc/zabbix') do
    it {
      should be_directory
    }
  end

  context file('/opt/zabbix') do
    it {
      should be_directory
    }
  end

  context file('/var/log/zabbix') do
    it {
      should be_directory
    }
  end

end

describe port(80) do
  it { should be_listening }
end