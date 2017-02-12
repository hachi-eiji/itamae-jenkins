require 'spec_helper'

describe package('nginx') do
  it { should be_installed }
end

describe service('nginx') do
  # nginxが立ち上がるまでに0.5秒ぐらいラグがある
  before do
    sleep 0.5
  end
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end
