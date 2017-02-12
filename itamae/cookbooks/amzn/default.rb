template '/etc/sysconfig/network' do
  not_if "test -e /etc/sysconfig/network"
end
