require 'spec_helper'
describe 'chincorp-dev' do

  context 'with defaults for all parameters' do
    it { should contain_class('chincorp-dev') }
  end
end
