class CatsController < ApplicationController
  def index
    @cats = CatsPrice.collection
    @filtered_cats = @cats
                     .filter(filter_params)
                     .sort_by(&:price)
  end

  private

  def filter_params
    params.permit(:location, :breed).to_h
  end
end
