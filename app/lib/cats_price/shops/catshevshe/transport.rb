module CatsPrice
  module Shops
    module Catshevshe
      class Transport < Shops::Transport
        class << self
          def transport
            :http
          end
        end
      end
    end
  end
end
