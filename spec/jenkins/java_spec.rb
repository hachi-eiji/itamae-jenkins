require 'spec_helper'

describe package('java-1.8.0-openjdk-devel') do
  it { should be_installed }
end
