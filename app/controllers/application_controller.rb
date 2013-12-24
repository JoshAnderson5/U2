class ApplicationController < ActionController::Base
  protect_from_forgery
end

#helper_method :current_user

#before_filter :authenticate_admin!

private

def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
   redirect_to @user, :flash => {:success => "Welcome to the Sample App!"}
end

def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

def after_sign_in_path_for(user_path)
    "http://www.google.com"
  end

