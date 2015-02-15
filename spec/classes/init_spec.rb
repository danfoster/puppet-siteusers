require 'spec_helper'
describe 'siteusers' do

  context 'with defaults for all parameters' do
    it { should contain_class('siteusers') }
  end
end
