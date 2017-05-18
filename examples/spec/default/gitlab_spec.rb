require 'spec_helper'

describe package('gitlab-ci-multi-runner') do
  it { should be_installed }
end
