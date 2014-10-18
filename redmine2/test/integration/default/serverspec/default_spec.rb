require 'serverspec'

set :backend, :exec

describe user('redmine') do
  it { should exist }
end

describe 'redmine::default' do
  context file('/home/redmine') do
    it {
      should be_directory
    }
  end

  context file('/home/redmine/redmine/Rakefile') do
    it {
      should be_file
    }
  end

end

describe port(80) do
  it { should be_listening }
end