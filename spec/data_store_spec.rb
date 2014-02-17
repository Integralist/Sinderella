require 'spec_helper'

describe DataStore do
  let(:instance)    { DataStore.instance }
  let(:original)    { 'bar' }
  let(:transformed) { 'BAR' }

  describe 'set(data)' do
    it 'stores original and transformed data' do
      instance.set({
        :id => 'foo',
        :original => original,
        :transformed => transformed
      })

      expect(instance.get('foo')[:original]).to eq(original)
      expect(instance.get('foo')[:transformed]).to eq(transformed)
    end
  end

  describe 'get(id)' do
    it 'returns data hash' do
      pending
    end
  end

  describe 'reset(id)' do
    it 'replaces the transformed data with original data' do
      pending
    end
  end
end
