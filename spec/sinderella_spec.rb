require 'spec_helper'

describe Sinderella do
  let(:data) {{ :key => 'value' }}
  let(:till_midnight) { 0 }

  def create_new_instance
    @id = subject.transforms(data, till_midnight) do |data|
      data.each do |key, value|
        data.tap { |d| d[key].upcase! }
      end
    end
  end

  describe '.transforms(data, till_midnight)' do
    it 'returns a md5 hash of the provided data' do
      create_new_instance
      expect(@id).to be_a String
      expect(@id).to eq '24e73d3a4f027ff81ed4f32c8a9b8713'
    end
  end

  describe '.get(id)' do
    context 'before midnight (before time expired)' do
      it 'returns the transformed data' do
        Sinderella.stub(:check)
        create_new_instance
        expect(subject.get(@id)).to eq({ :key => 'VALUE' })
      end
    end

    context 'past midnight (after time expired)' do
      it 'returns the original data' do
        create_new_instance
        expect(subject.get(@id)).to eq({ :key => 'value' })
      end
    end
  end

  describe '.midnight(id)' do
    context 'before midnight (before time expired)' do
      it 'restores the data to its original state' do
        Sinderella.stub(:check)
        create_new_instance
        subject.midnight(@id)
        expect(subject.get(@id)).to eq({ :key => 'value' })
      end
    end
  end
end
