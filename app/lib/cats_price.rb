module CatsPrice
  def self.collection
    Shops.list.each_with_object(Collection.new) do |namespace, collection|
      begin
        shop = shop_with(namespace)
        items = shop.data.map { |item| Item.new(item) }
        collection.add items
      rescue CatsPrice::Error => e
        Rails.logger.warn "Shop #{shop} returned error #{e}"
      end
    end
  end

  def self.shop_with(namespace)
    namespace::Shop.new(
      strategy: Strategies.strategy(namespace::Strategy),
      transport: Transports.transport(namespace::Transport)
    )
  end
end
