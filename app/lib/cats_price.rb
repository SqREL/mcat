module CatsPrice

  module_function

  def self.collection
    Shops.list.each_with_object(Collection.new) do |namespace, collection|
      shop = namespace::Shop.new({
        strategy: Strategies.strategy(namespace::Strategy),
        transport: Transports.transport(namespace::Transport)
      })
      collection.add shop.data.map { |item| Item.new(item) }
    end
  end
end
