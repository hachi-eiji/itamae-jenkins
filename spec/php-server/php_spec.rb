# 必要なパッケージが入っているか？
require 'spec_helper'

describe package('php-devel') do
  it { should be_installed.with_version('7.0') }
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
  describe package(pkg) do
    it { should be_installed }
  end
end

describe service('php-fpm') do
  # 立ち上がるまでに0.5秒ぐらいラグがある
  before do
    sleep 0.5
  end
  it { should be_enabled }
  it { should be_running }
end
