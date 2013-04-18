require 'spec_helper'

describe Satutempat::Config do
  describe '#to_hash' do
    describe 'with multiple key' do
      before :each do
        Satutempat::Config.import 'spec/fixtures/three_level.yml'
      end

      it 'return hash' do
        Satutempat::Config.to_hash.should eq YAML.load_file 'spec/fixtures/three_level.yml'
      end
    end

  end
end
