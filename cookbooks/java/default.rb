package 'java-1.8.0-openjdk-devel' do
  action :install
  only_if "which java"
end
