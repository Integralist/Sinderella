require 'spec_helper'

describe Cinderella do
  let(:data) {{ :key => 'value' }}
  let(:till_midnight) { 60 * 60 }

  describe '.transforms(data, till_midnight)' do
    it 'returns a hash of the passed data' do
      pending
    end

    it 'stores original and transformed data' do
      pending
    end

    it 'restores the data to its original state after set time' do
      pending
    end
  end

  describe '.midnight(id)' do
    it 'restores the data to its original state' do
      pending
    end
  end
end
