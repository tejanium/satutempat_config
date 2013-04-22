require 'spec_helper'

describe Satutempat::Config do
  describe '.get_instance' do
    shared_examples_for 'object attribute test' do
      its(:value)       { should eq 'This is value' }
      its(:description) { should eq 'This is description' }
    end

    describe 'with single key' do
      before :each do
        Satutempat::Config.set :title, 'This is value', 'This is description'
      end

      it 'return object' do
        Satutempat::Config.get_instance(:title).should_not be_nil
      end

      context 'object attribute' do
        subject { Satutempat::Config.get_instance :title }
          it_behaves_like 'object attribute test'
      end
    end

    describe 'with multiple key' do
      before :each do
        Satutempat::Config.set 'email.title', 'This is value', 'This is description'
      end

      it 'return object' do
        Satutempat::Config.get_instance('email.title').should_not be_nil
      end

      context 'object attribute' do
        subject { Satutempat::Config.get_instance 'email.title' }
          it_behaves_like 'object attribute test'
      end
    end

  end
end
