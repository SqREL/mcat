module CatsPrice

  module_function

  def self.get
    collection = Collection.new

    Shops.list.each do |shop|
      shop = shop.new
      data = shop.data
      data = Strategies.strategy(shop.strategy).new.parse(data)
      collection.add data.map { |item| Item.new(item) }
    end

    collection
  end
end
