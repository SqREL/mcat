require 'rails_helper'

describe CatsPrice::Transports do
  it 'should return nil if transport not found' do
    expect{described_class.transport("Something")}.to raise_exception(KeyError)
  end

  it 'should accept symbol and return transport class in case it exist' do
    expect(described_class.transport(:http)).to eq(CatsPrice::Transports::Http)
  end

  it 'should accept string and return transport class in case it exist' do
    expect(described_class.transport("http")).to eq(CatsPrice::Transports::Http)
  end
end
