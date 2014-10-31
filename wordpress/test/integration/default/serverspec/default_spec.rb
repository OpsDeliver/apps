require 'serverspec'

set :backend, :exec

describe 'wordpress::default' do
  context file('/var/www/wordpress') do
    it {
      should be_directory
    }
  end

  context file('/var/www/wordpress/wp-config.php') do
    it {
      should be_file
    }
  end

  if os[:family] == 'redhat'
    context file('/etc/httpd/sites-enabled/wordpress.conf') do
      it {
        should be_linked_to '../sites-available/wordpress.conf'
      }
    end
  end

  if os[:family] == 'ubuntu' || os[:family] == 'debian'
    context file('/etc/apache2/sites-enabled/wordpress.conf') do
      it {
        should be_linked_to '../sites-available/wordpress.conf'
      }
    end
  end

end

describe port(80) do
  it { should be_listening }
end