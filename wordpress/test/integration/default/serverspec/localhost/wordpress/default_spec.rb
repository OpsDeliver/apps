require 'serverspec'
include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

describe 'wordpress::default' do
  context file('/var/www/wordpress') do
    it {
      should be_directory
      should be_mode 755
      should be_owned_by 'root'
    }
  end

  context file('/var/www/wordpress/wp-config.php') do
    it {
      should be_file
      should be_mode 644
      should be_owned_by 'root'
    }
  end

  context file('/etc/httpd/sites-available/wordpress.conf') do
    it {
      should be_file
      should be_mode 644
      should be_owned_by 'root'
    }
  end

end

