require 'serverspec'

set :backend, :exec

describe 'wordpress::default' do
  context file('/var/www/wordpress') do
    it {
      should be_directory
      should be_mode 755
    }
  end

  context file('/var/www/wordpress/wp-config.php') do
    it {
      should be_file
      should be_mode 644
    }
  end

  if os[:family] == 'redhat'
    context file('/etc/httpd/sites-enable/wordpress.conf') do
      it {
        should be_file
        should be_mode 644
      }
    end
  end

  if os[:family] == 'ubuntu' || os[:family] == 'debian'
    context file('/etc/apache2/sites-enable/wordpress.conf') do
      it {
        should be_file
        should be_mode 644
      }
    end
  end

end

