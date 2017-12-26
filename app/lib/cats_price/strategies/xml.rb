module CatsPrice
  module Strategies
    module Xml
      module_function
      def parse(data)
        parser = Nori.new(:convert_tags_to => lambda { |tag| tag.snakecase.to_sym }, :strip_namespaces => true)
        parser.parse(data)
      end
    end
  end
end
