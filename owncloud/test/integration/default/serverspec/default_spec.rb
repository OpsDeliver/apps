require 'serverspec'

set :backend, :exec

describe 'owncloud::default' do

  if os[:family] == 'redhat'
    context file('/var/www/html/owncloud') do
      it {
        should be_directory
      }
    end

    context file('/var/www/html/owncloud/config/config.php') do
      it {
        should be_file
      }
    end

    context file('/etc/httpd/sites-enabled/owncloud.conf') do
      it {
        should be_linked_to '../sites-available/owncloud.conf'
      }
    end
  end

  if os[:family] == 'ubuntu' || os[:family] == 'debian'
    context file('/var/www/owncloud') do
      it {
        should be_directory
      }
    end

    context file('/var/www/owncloud/config/config.php') do
      it {
        should be_file
      }
    end
    
    context file('/etc/apache2/sites-enabled/owncloud.conf') do
      it {
        should be_linked_to '../sites-available/owncloud.conf'
      }
    end
  end

end
