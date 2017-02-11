require 'spec_helper'

describe package('jenkins') do
  it { should be_installed }
end

describe service('jenkins') do
  it { should be_enabled }
  it { should be_running }
end

describe port(8080) do
  it { should be_listening }
end

describe process('java') do
  its(:user) { should eq 'jenkins' }
  its(:args) { should match /jenkins.war/ }
  its(:count) { should eq 1 }
end
