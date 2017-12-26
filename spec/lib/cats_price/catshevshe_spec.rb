require 'rails_helper'

describe "Catshevshe Shop test" do
  let(:transport) { CatsPrice::Transports::Http }
  let(:strategy)  { CatsPrice::Strategies::Json }
  let(:client)    { CatsPrice::Shops::Catshevshe::Shop.new(transport: transport, strategy: strategy) }

  it "should return data from api" do
    VCR.use_cassette 'catshevshe_and_catzetka_lists' do
      expect(client.data).to                       be_a(Array)
      expect(client.data.first).to                 be_a(Hash)
      expect(client.data.flat_map(&:keys).uniq).to eq([:location, :breed, :price, :image])
      expect(client.data.first).to                 eq({
        :location=>"Lviv",
        :breed=>"Abyssin",
        :price=>500,
        :image=>"https://olxua-ring02.akamaized.net/images_slandocomua/476948786_2_1000x700_abissenysh-chempion-fotografii.jpg"
      })
    end
  end
end
