class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
  before_filter :initialize_carts

  def is_admin?
    current_user.present? && current_user.admin?
  end

  def ensure_admin
    return unauthorized! unless current_user.present? && current_user.admin?# &&
  end
 # def set_current_user 
  #  Authorization.current_user = current_user
 # end


  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  helper_method :current_user

  def current_cart
    @current_cart ||= Cart.find(session[:cart_id]) if session[:cart_id]
  end
  helper_method :current_cart

    def initialize_carts
      begin
        if session[:cart_id]
          @cart = Cart.find(session[:cart_id])
        else
          @cart = Cart.create
          session[:cart_id] = @cart.id
        end
      rescue
        @cart = Cart.create
        session[:cart_id] = @cart.id
      end
  end


end
