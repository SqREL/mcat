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

    def locations
      @locations ||= @items
                     .map(&:location)
                     .uniq
    end

    def breeds
      @breeds ||= @items
                  .map(&:breed)
                  .uniq
    end

    def filter(params = {})
      params = params.delete_if { |_k, v| v.blank? }
      return @items if params.empty?

      @items.select do |item|
        params.map { |k, v| item[k] == v }.all?
      end
    end
  end
end
