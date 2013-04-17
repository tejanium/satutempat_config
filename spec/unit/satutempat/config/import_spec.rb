require 'spec_helper'

describe Satutempat::Config do
  describe '.import' do
    context 'one level create' do
      it 'create all keys and values' do
        lambda{
          Satutempat::Config.import 'spec/fixtures/one_level.yml'
        }.should change { Satutempat::Config.count }.from(0).to(3)
      end

      context 'datas' do
        before :each do
          Satutempat::Config.import 'spec/fixtures/one_level.yml'
        end

        it 'should have all keys' do
          Satutempat::Config.all.to_a.map(&:key).sort
                            .flatten.should eq ['one', 'two', 'three'].sort
        end

        it 'should have all values' do
          Satutempat::Config.all.to_a.map(&:value).sort
                            .flatten.should eq ['One', 'Two', 'Three'].sort
        end
      end
    end

    context 'one level update' do
      before :each do
        Satutempat::Config.import 'spec/fixtures/one_level.yml'
      end

      it 'create all keys and values' do
        lambda{
          Satutempat::Config.import 'spec/fixtures/one_level_updated.yml'
        }.should_not change { Satutempat::Config.count }.from(3).to(6)
      end

      context 'datas' do
        before :each do
          Satutempat::Config.import 'spec/fixtures/one_level_updated.yml'
        end

        it 'should have all keys' do
          Satutempat::Config.all.to_a.map(&:key).sort
                            .flatten.should eq ['one', 'two', 'three'].sort
        end

        it 'should have all values' do
          Satutempat::Config.all.to_a.map(&:value).sort
                            .flatten.should eq ['One updated', 'Two updated', 'Three updated'].sort
        end
      end
    end

    context 'two level' do
      it 'create all keys and values' do
        lambda{
          Satutempat::Config.import 'spec/fixtures/two_level.yml'
        }.should change { Satutempat::Config.count }.from(0).to(3)
      end

      context 'datas' do
        before :each do
          Satutempat::Config.import 'spec/fixtures/two_level.yml'
        end

        it 'should have all keys' do
          Satutempat::Config.all.to_a.map(&:key).sort
                            .flatten.should eq ['number.one', 'number.two', 'number.three'].sort
        end

        it 'should have all values' do
          Satutempat::Config.all.to_a.map(&:value).sort
                            .flatten.should eq ['One', 'Two', 'Three'].sort
        end
      end
    end

    context 'three level' do
      it 'create all keys and values' do
        lambda{
          Satutempat::Config.import 'spec/fixtures/three_level.yml'
        }.should change { Satutempat::Config.count }.from(0).to(3)
      end

      context 'datas' do
        before :each do
          Satutempat::Config.import 'spec/fixtures/three_level.yml'
        end

        it 'should have all keys' do
          Satutempat::Config.all.to_a.map(&:key).sort
                            .flatten.should eq ['en.number.one', 'en.number.two', 'en.number.three'].sort
        end

        it 'should have all values' do
          Satutempat::Config.all.to_a.map(&:value).sort
                            .flatten.should eq ['One', 'Two', 'Three'].sort
        end
      end
    end
  end
end
