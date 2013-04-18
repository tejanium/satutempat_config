require 'spec_helper'

describe Satutempat::Config do
  describe '.export' do
    context 'three level' do
      DUMPSTER = 'spec/dump.yml'

      before :each do
        Satutempat::Config.import 'spec/fixtures/three_level.yml'
      end

      it 'export all data to yml' do
        Satutempat::Config.export DUMPSTER

        YAML.load_file(DUMPSTER).should eq YAML.load_file('spec/fixtures/three_level.yml')

        File.delete DUMPSTER
      end
    end
  end
end
