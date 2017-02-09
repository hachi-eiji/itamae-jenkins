include_recipe '../java/default.rb'

# copy
execute 'get repos' do
  command 'wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo'
  not_if 'test -e /etc/yum.repos.d/jenkins.repo'
end

execute 'import rpm' do
  command 'rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key'
end

package 'jenkins' do
  action :install
end

service 'jenkins' do
  action [:enable, :start]
end
