require 'rails_helper'

describe CatsPrice::Item do
  let(:valid_attributes) { { location: "Lviv", breed: "Persian", image: "http://g.com/cat.png", price: 20 } }

  [:location, :breed, :price, :image].each do |attribute|
    it "should return data for .#{attribute}" do
      expect(described_class.new(valid_attributes).send(attribute)).to eq(valid_attributes[attribute])
    end

    it "should return data for .[#{attribute}]" do
      expect(described_class.new(valid_attributes)[attribute]).to eq(valid_attributes[attribute])
    end
  end

  [:location, :breed, :image].each do |attribute|
    it "should convert #{attribute} to string" do
      attributes = valid_attributes.merge(attribute => 34)
      expect(described_class.new(attributes)[attribute]).to eq("34")
    end
  end

  it "should convert price to float" do
    attributes = valid_attributes.merge(price: 34)
    expect(described_class.new(attributes)[:price]).to eq(34.0)
  end

  it "should return nil if wrong attribute" do
    expect(described_class.new(valid_attributes)[:tail_of_a_cat_in_cm]).to be_nil
  end
end
