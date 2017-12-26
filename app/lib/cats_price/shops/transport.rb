module CatsPrice
  module Shops
    class Transport
      class << self
        def to_sym
          transport
        end

        def to_s
          transport.to_s
        end

        def transport
          raise NotImplementedError
        end
      end
    end
  end
end
