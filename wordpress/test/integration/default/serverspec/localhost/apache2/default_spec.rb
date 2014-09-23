require 'serverspec'
include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

describe 'apache2::default' do

  if ['Debian', 'Ubuntu'].include?(os[:family])
    context package('apache2') do
      it { should be_installed }
    end
  elsif ['RedHat'].include?(os[:family])
    context package('httpd') do
      it { should be_installed }
    end
  end

  context file('/var/log/httpd') do
    it {
      should be_directory
      should be_mode 755
      should be_owned_by 'root'
    }
  end

  context package('perl') do
    it { should be_installed }
  end

  context file('/usr/local/bin/apache2_module_conf_generate.pl') do
    it {
      should be_file
      should be_mode 755
      should be_owned_by 'root'
    }
  end

  context file('/etc/httpd/sites-available') do
    it {
      should be_directory
      should be_mode 755
      should be_owned_by 'root'
    }
  end

  context file('/etc/httpd/sites-enabled') do
    it {
      should be_directory
      should be_mode 755
      should be_owned_by 'root'
    }
  end

  context file('/etc/httpd/mods-available') do
    it {
      should be_directory
      should be_mode 755
      should be_owned_by 'root'
    }
  end

  context file('/etc/httpd/mods-enabled') do
    it {
      should be_directory
      should be_mode 755
      should be_owned_by 'root'
    }
  end

  context file('/usr/sbin/a2ensite') do
    it {
      should be_file
      should be_mode 700
      should be_owned_by 'root'
    }
  end

  context file('/usr/sbin/a2dissite') do
    it {
      should be_file
      should be_mode 700
      should be_owned_by 'root'
    }
  end

  context file('/usr/sbin/a2enmod') do
    it {
      should be_file
      should be_mode 700
      should be_owned_by 'root'
    }
  end

  context file('/usr/sbin/a2dismod') do
    it {
      should be_file
      should be_mode 700
      should be_owned_by 'root'
    }
  end

  context file('/etc/httpd/ssl') do
    it {
      should be_directory
      should be_mode 755
      should be_owned_by 'root'
    }
  end

  context file('/etc/httpd/conf.d') do
    it {
      should be_directory
      should be_mode 755
      should be_owned_by 'root'
    }
  end

  context file('/var/cache/httpd') do
    it {
      should be_directory
      should be_mode 755
      should be_owned_by 'root'
    }
  end

  context file('/etc/sysconfig/httpd') do
    it {
      should be_file
      should be_mode 644
      should be_owned_by 'root'
    }
  end

  context file('/etc/httpd/conf/httpd.conf') do
    it {
      should be_file
      should be_mode 644
      should be_owned_by 'root'
    }
  end

  context file('/etc/httpd/conf.d/security.conf') do
    it {
      should be_file
      should be_mode 644
      should be_owned_by 'root'
    }
  end

  context file('/etc/httpd/conf.d/charset.conf') do
    it {
      should be_file
      should be_mode 644
      should be_owned_by 'root'
    }
  end

  context file('/etc/httpd/ports.conf') do
    it {
      should be_file
      should be_mode 644
      should be_owned_by 'root'
    }
  end

  context file('/etc/httpd/sites-available/default') do
    it {
      should be_file
      should be_mode 644
      should be_owned_by 'root'
    }
  end

  context service('httpd') do
    it { should be_enabled }
  end

end
