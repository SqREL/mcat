module CatsPrice
  class Collection
    include Enumerable

    def initialize
      @items = []
    end

    def add(items)
      @items = @items.concat(Array(items))
    end

    def each(&block)
      @items.each(&block)
    end
  end
end
