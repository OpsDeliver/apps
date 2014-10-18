require 'serverspec'

set :backend, :exec

describe 'jenkins::default' do
  context file('/var/lib/jenkins') do
    it {
      should be_directory
    }
  end

  context file('/var/log/jenkins') do
    it {
      should be_directory
    }
  end

end

describe port(8080) do
  it { should be_listening }
end