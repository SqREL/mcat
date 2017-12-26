module CatsPrice
  module Transports
    module_function

    def transport(key)
      {
        http: Transports::Http
      }.fetch(key.to_sym)
    end
  end
end
