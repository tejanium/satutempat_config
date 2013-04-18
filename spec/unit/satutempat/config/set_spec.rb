require 'spec_helper'

describe Satutempat::Config do
  describe '.set' do
    it 'set key and value' do
      lambda{
        Satutempat::Config.set :title, 'This is value', 'This is description'
      }.should change { Satutempat::Config.count }.from(0).to(1)
    end

    context 'datas' do
      before :each do
        Satutempat::Config.set :title, 'This is value', 'This is description'
      end

      subject { Satutempat::Config.first }
        its(:key)         { should eq 'title' }
        its(:value)       { should eq 'This is value' }
        its(:description) { should eq 'This is description' }
    end

    context 'update' do
      before :each do
        Satutempat::Config.set :title, 'This is value', 'This is description'
      end

      it 'does not create new record ' do
        lambda{
          Satutempat::Config.set :title, 'This is new value', 'This is new description'
        }.should_not change { Satutempat::Config.count }.from(1).to(2)
      end

      context 'datas' do
        before :each do
          Satutempat::Config.set :title, 'This is new value', 'This is new description'
        end

        subject { Satutempat::Config.first }
          its(:key)         { should eq 'title' }
          its(:value)       { should eq 'This is new value' }
          its(:description) { should eq 'This is new description' }
      end
    end

    context 'invalid' do
      ['title title', '12title'].each do |invalid_key|
        it "key is #{ invalid_key }" do
          lambda{
            Satutempat::Config.set(invalid_key, 'This is new value')
          }.should_not change { Satutempat::Config.count }
        end
      end

      it 'has no key' do
        lambda{
          Satutempat::Config.set(nil, 'This is new value')
        }.should_not change { Satutempat::Config.count }
      end

      it 'has no key' do
        lambda{
          Satutempat::Config.set(nil, 'This is new value')
        }.should_not change { Satutempat::Config.count }
      end
    end

  end
end
