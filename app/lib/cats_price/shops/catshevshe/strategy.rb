module CatsPrice
  module Shops
    module Catshevshe
      class Strategy < Shops::Strategy
        class << self
          def strategy
            :json
          end
        end
      end
    end
  end
end
