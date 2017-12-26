module CatsPrice
  class Item
    def initialize(attributes)
      @location = String(attributes.fetch(:location))
      @breed    = String(attributes.fetch(:breed))
      @image    = String(attributes.fetch(:image))
      @price    = Float(attributes.fetch(:price))
    end

    attr_reader :location, :breed, :price, :image

    def [](key)
      key = key.to_sym
      return unless %i[location breed price image].include?(key)

      send(key)
    end
  end
end
