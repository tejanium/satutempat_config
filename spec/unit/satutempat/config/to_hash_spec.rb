require 'spec_helper'

describe Satutempat::Config do
  describe '#to_hash' do
    describe 'with multiple key' do
      before :each do
        Satutempat::Config.set 'en.email.title', 'This is value', 'This is description'
      end

      it 'return hash' do
        hash = {
          'en' => {
            'email' => {
              'title' => 'This is value'
            }
          }
        }

        Satutempat::Config.get('en.email.title').to_hash.should eq hash
      end
    end

  end
end
