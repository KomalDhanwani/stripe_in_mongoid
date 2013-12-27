class PlansController < ApplicationController
  before_filter :authenticate_user!  
  def index
    @plans = Plan.order_by(:price => "asc").to_a
  end
end
