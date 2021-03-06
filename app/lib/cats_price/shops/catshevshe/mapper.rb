module CatsPrice
  module Shops
    module Catshevshe
      class Mapper < Shops::Mapper
        def to_h
          {
            location: data[:location],
            breed:    data[:name],
            price:    data[:price],
            image:    data[:image]
          }
        end
      end
    end
  end
end
