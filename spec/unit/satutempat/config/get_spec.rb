require 'spec_helper'

describe Satutempat::Config do
  describe '.get' do
    describe 'with single key' do
      before :each do
        Satutempat::Config.set :title, 'This is value', 'This is description'
      end

      it 'return string' do
        Satutempat::Config.get(:title).should eq 'This is value'
      end
    end

    describe 'with multiple key' do
      before :each do
        Satutempat::Config.set 'email.title', 'This is value', 'This is description'
      end

      it 'return string' do
        Satutempat::Config.get('email.title').should eq 'This is value'
      end
    end

  end
end
