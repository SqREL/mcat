require 'rails_helper'

describe CatsPrice::Collection do
  let(:item_1) { double 'Item', location: 'Lviv', breed: 'cheshire' }
  let(:item_2) { double 'Item', location: 'Kyiv', breed: 'Ragdoll' }
  let(:item_3) { double 'Item', location: 'Lviv', breed: 'Lviv special breed' }

  it 'is possible to add element' do
    collection = described_class.new
    collection.add('Something')
    expect(collection.to_a).to eq(['Something'])
  end

  it 'is possible to add array of elements' do
    collection = described_class.new
    collection.add(%w[Something Other])
    expect(collection.to_a).to eq(%w[Something Other])
  end

  it 'returns uniq locations' do
    collection = described_class.new
    collection.add [item_1, item_2, item_1, item_1, item_2]
    expect(collection.locations).to eq(%w[Lviv Kyiv])
  end

  it 'returns uniq breeds' do
    collection = described_class.new
    collection.add [item_1, item_2, item_1, item_1, item_2]
    expect(collection.breeds).to eq(%w[cheshire Ragdoll])
  end

  describe 'filters' do
    before do
      allow(item_1).to receive(:[]).with(:location).and_return('Lviv')
      allow(item_2).to receive(:[]).with(:location).and_return('Kyiv')
      allow(item_3).to receive(:[]).with(:location).and_return('Lviv')
    end

    it 'filters collection' do
      collection = described_class.new
      collection.add [item_1, item_2, item_3]

      expect(collection.filter(location: 'Lviv', breed: '  '))
        .to eq([item_1, item_3])
    end
  end
end
