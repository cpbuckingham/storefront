class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_cart!

  def new
    gon.client_token = generate_client_token
  end

  private
  def generate_client_token
  Braintree::ClientToken.generate
  end

  def check_cart!
    if current_user.get_cart_movies.blank?
      redirect_to root_url, alert: "Please add some items to your cart before processing your transaction!"
    end
  end

end
