require 'rails_helper'

describe CatsPrice do
  it 'returns a collection' do
    VCR.use_cassette 'catshevshe_and_catzetka_lists' do
      expect(described_class.collection).to be_a(CatsPrice::Collection)
    end
  end

  it 'returns a collection with items' do
    VCR.use_cassette 'catshevshe_and_catzetka_lists' do
      collection = described_class.collection
      expect(
        collection.map { |item| item.is_a?(CatsPrice::Item) }.all?
      ).to be true
    end
  end

  it 'doesnt fail if one of shops cannot be parsed' do
    allow_any_instance_of(CatsPrice::Shops::Catzetka::Shop)
      .to receive(:url).and_return('https://google.com')
    VCR.use_cassette 'catzetka_wrong_url' do
      expect(
        described_class.collection.count
      ).to eq 11
    end
  end

  it 'doesnt fail if one of shops returns 403' do
    allow_any_instance_of(CatsPrice::Shops::Catzetka::Shop)
      .to receive(:url)
      .and_return('https://nh7b1g9g23.execute-api.us-west-2.amazonaws.com/dev/cats/xmlsdf')

    VCR.use_cassette 'catzetka_error' do
      expect(
        described_class.collection.count
      ).to eq 11
    end
  end

  it 'doesnt fail if one of shops cannot be parsed' do
    allow_any_instance_of(CatsPrice::Shops::Catshevshe::Shop)
      .to receive(:url)
      .and_return('https://google.com')

    VCR.use_cassette 'catshevshe_wrong_url' do
      expect(
        described_class.collection.count
      ).to eq 10
    end
  end

  it 'doesnt fail if one of shops returns 403' do
    allow_any_instance_of(CatsPrice::Shops::Catshevshe::Shop)
      .to receive(:url)
      .and_return('https://nh7b1g9g23.execute-api.us-west-2.amazonaws.com/dev/cats/jsonnodf')

    VCR.use_cassette 'catshevshe_error' do
      expect(
        described_class.collection.count
      ).to eq 10
    end
  end
end
