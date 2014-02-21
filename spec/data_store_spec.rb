require 'spec_helper'

describe DataStore do
  let(:instance)    { DataStore.instance }
  let(:original)    { 'bar' }
  let(:transformed) { 'BAR' }

  before(:each) do
    instance.set({
      :id => 'foo',
      :original => original,
      :transformed => transformed
    })
  end

  describe 'set(data)' do
    it 'stores original and transformed data' do
      expect(instance.get('foo')[:original]).to eq(original)
      expect(instance.get('foo')[:transformed]).to eq(transformed)
    end
  end

  describe 'get(id)' do
    it 'returns data object' do
      expect(instance.get('foo')).to be_a Hash
      expect(instance.get('foo').key?(:original)).to be true
      expect(instance.get('foo').key?(:transformed)).to be true
    end
  end

  describe 'reset(id)' do
    it 'replaces the transformed data with original data' do
      instance.reset('foo')
      foo = instance.get('foo')
      expect(foo[:original]).to eq(foo[:transformed])
    end
  end
end
