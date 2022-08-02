class SupermarketsItemsController < ActionController::Base
  def index
    @supermarket = Supermarket.find(params[:id])
  end
end
