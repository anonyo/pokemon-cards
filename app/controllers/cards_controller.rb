class CardsController < ApplicationController
  def index
    @q = ::Card.ransack(params[:q])
    @cards = @q.result(distinct: true)
  end

  def create
    ::Cards::Import.new.process
    redirect_to root_path
  end

  def destroy
    ::Card.destroy_all
    redirect_to root_path
  end
end
