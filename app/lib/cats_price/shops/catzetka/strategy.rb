module CatsPrice
  module Shops
    module Catzetka
      class Strategy < Shops::Strategy
        class << self
          def strategy
            :xml
          end
        end
      end
    end
  end
end
