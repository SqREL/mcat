class RequestsController < ApplicationController
  def create
    redirect_to result_request_path(cat_type: params[:cats_type], location: params[:user_location])
  end

  def result
    cats = CatsPrice.get
    @cats_list = cats.select { |list| list.location == params[:location] && list.name ==  params[:cat_type]}
  end

end
