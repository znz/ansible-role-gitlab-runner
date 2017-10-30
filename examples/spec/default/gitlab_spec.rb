require 'spec_helper'

describe package('gitlab-runner') do
  it { should be_installed }
end
