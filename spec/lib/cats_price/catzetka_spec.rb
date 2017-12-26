require 'rails_helper'

describe "Catzetka Shop test" do
  let(:transport) { CatsPrice::Transports::Http }
  let(:strategy)  { CatsPrice::Strategies::Xml }
  let(:client)    { CatsPrice::Shops::Catzetka::Shop.new(transport: transport, strategy: strategy) }

  it "should return data from api" do
    VCR.use_cassette 'catshevshe_and_catzetka_lists' do
      expect(client.data).to                       be_a(Array)
      expect(client.data.first).to                 be_a(Hash)
      expect(client.data.flat_map(&:keys).uniq).to eq([:location, :breed, :price, :image])
      expect(client.data.first).to                 eq({
        :location=>"Odessa",
        :breed=>"American Curl",
        :price=>"650",
        :image=>"https://olxua-ring07.akamaized.net/images_slandocomua/113528769_3_1000x700_amerikanskie-kerly-koshki-s-chelovecheskim-litsom-koshka-kompanon-koti_rev022.jpg"
      })
    end
  end
end
