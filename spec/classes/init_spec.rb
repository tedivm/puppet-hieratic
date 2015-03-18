require 'spec_helper'
describe 'hieratic' do

  context 'with defaults for all parameters' do
    it { should contain_class('hieratic') }
  end
end
