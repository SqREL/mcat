require 'rails_helper'

describe CatsPrice::Strategies do
  it 'returns nil if strategy not found' do
    expect { described_class.strategy('Something') }.to raise_exception(KeyError)
  end

  it 'accepts symbol and return strategy class in case it exist' do
    expect(described_class.strategy(:json)).to eq(CatsPrice::Strategies::Json)
  end

  it 'accepts string and return strategy class in case it exist' do
    expect(described_class.strategy('xml')).to eq(CatsPrice::Strategies::Xml)
  end
end
