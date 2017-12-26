module CatsPrice
  module Shops
    module_function

    def list
      [
        CatsPrice::Shops::Catshevshe, # Deshevshe for cats
        CatsPrice::Shops::Catzetka    # Rozetka for cats
      ]
    end
  end
end
