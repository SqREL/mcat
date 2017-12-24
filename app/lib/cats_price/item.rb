module CatsPrice
  class Item
    def initialize(attributes)
      @location = String(attributes.fetch("location"))
      @name = String(attributes.fetch("name"))
      @price = Float(attributes.fetch("price"))
      @image = String(attributes.fetch("image"))
    end

    attr_reader :location, :name, :price, :image
  end
end
