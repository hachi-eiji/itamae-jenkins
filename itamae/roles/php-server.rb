include_recipe '../cookbooks/amzn'
include_recipe '../cookbooks/nginx'

package 'epel-release'

execute "yum install -y http://rpms.famillecollet.com/enterprise/remi-release-6.rpm" do
  not_if "rpm -qa | grep 'remi-release'"
end

%w(
  automake
  libmcrypt
  libxslt
  libXpm
  t1lib
  libtool-ltdl
  libtool-ltdl-devel
).each do |pkg|
  package pkg
end

%w(
  php-devel
  php-common
  php-cli
  php-mbstring
  php-mcrypt
  php-mysqlnd
  php-opcache
  php-pdo
  php-pear
  php-process
  php-soap
  php-xml
  php-pecl-apcu
  php-fpm
  php-pecl-pthreads
  php-pecl-zip
).each do |pkg|
  package pkg do
    options "--disablerepo=amzn-main --enablerepo=remi-php70"
  end
end

service 'php-fpm' do
  action [:enable, :start]
end
