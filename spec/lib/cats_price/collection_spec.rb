require 'rails_helper'

describe CatsPrice::Collection do
  let(:item_1) { double "Item", location: "Lviv", breed: "cheshire" }
  let(:item_2) { double "Item", location: "Kyiv", breed: "Ragdoll" }
  let(:item_3) { double "Item", location: "Lviv", breed: "Lviv special breed" }

  it "should be possible to add element" do
    collection = described_class.new
    collection.add("Something")
    expect(collection.to_a).to eq(["Something"])
  end

  it "should be possible to add array of elements" do
    collection = described_class.new
    collection.add(["Something", "Other"])
    expect(collection.to_a).to eq(["Something", "Other"])
  end

  it "should return uniq locations" do
    collection = described_class.new
    collection.add [item_1, item_2, item_1, item_1, item_2]
    expect(collection.locations).to eq(["Lviv", "Kyiv"])
  end

  it "should return uniq breeds" do
    collection = described_class.new
    collection.add [item_1, item_2, item_1, item_1, item_2]
    expect(collection.breeds).to eq(["cheshire", "Ragdoll"])
  end

  it "filters collection" do
    expect(item_1).to receive(:[]).with(:location).and_return("Lviv")
    expect(item_2).to receive(:[]).with(:location).and_return("Kyiv")
    expect(item_3).to receive(:[]).with(:location).and_return("Lviv")

    collection = described_class.new
    collection.add [item_1, item_2, item_3]
    expect(collection.filter(location: "Lviv", breed: "  ")).to eq([item_1, item_3])
  end
end
