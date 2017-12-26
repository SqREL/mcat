require 'rails_helper'

describe 'Catzetka Shop test' do
  let(:transport) { CatsPrice::Transports::Http }
  let(:strategy)  { CatsPrice::Strategies::Xml }
  let(:client) do
    CatsPrice::Shops::Catzetka::Shop.new(
      transport: transport,
      strategy: strategy
    )
  end

  describe 'returns data from api' do
    let(:data) do
      VCR.use_cassette 'catshevshe_and_catzetka_lists' do
        client.data
      end
    end

    it 'represented with an array' do
      expect(data).to be_a(Array)
    end

    it 'contains hashesy' do
      expect(data.first).to be_a(Hash)
    end

    it 'always have required set of params' do
      expect(data.flat_map(&:keys).uniq).to eq(%i[location breed price image])
    end

    it 'has correct data' do
      expect(data.first).to eq(
        location: 'Odessa',
        breed: 'American Curl',
        price: '650',
        image: 'https://olxua-ring07.akamaized.net/images_slandocomua/113528769_3_1000x700_amerikanskie-kerly-koshki-s-chelovecheskim-litsom-koshka-kompanon-koti_rev022.jpg'
      )
    end

  end
end
