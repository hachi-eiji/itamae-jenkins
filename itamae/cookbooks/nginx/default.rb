# add nginx.repo
remote_file '/etc/yum.repos.d/nginx.repo'

# yum install
package 'nginx' do
  action :install
  options "--disablerepo=amzn-main"
end

template "/etc/nginx/conf.d/jenkins.conf"

service 'nginx' do
  action [:enable, :start]
end
