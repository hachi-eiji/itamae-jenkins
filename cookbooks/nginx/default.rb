# add nginx.repo
remote_file '/etc/yum.repos.d/nginx.repo'

# yum install
package 'nginx' do
  action :install
end

template "/etc/nginx/conf.d/jenkins.conf"

execute 'move default.conf' do
  command "mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.bk"
  only_if "test -e /etc/nginx/conf.d/default.conf"
end

service 'nginx' do
  action [:enable, :start]
end
