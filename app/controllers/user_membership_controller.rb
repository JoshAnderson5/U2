class UserMembershipController < ApplicationController
  include Wicked::Wizard
  steps :welcome, :services, :accessgranted, :getstarted
  
  def show
    @user = current_user
    render_wizard
  end

  def update
    @user = current_user
    @user.attributes = params[:user]
    render_wizard @user
  end

  def create
  @user_membership = User_membership.new(params[:user_membership])
  if @user_membership.save_with_payment
    redirect_to @user_membership, :notice => "Thank you for &crarr; 
      subscribing!"
  else
    render :new
  end
end

  def accessgranted
     @user_membership = user_membership.new(params[:user])
  end

  def getstarted
  end

  def services
  end

  def welcome
  end
  
private

  def redirect_to_finish_wizard
    redirect_to root_url, notice: "Thank you for signing up."
  end
end
