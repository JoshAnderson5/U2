class ListingController < ApplicationController
  before_filter :authenticate_user!
  helper_method :sort_column, :sort_direction

 
  def index
    @listings = Listing.order(sort_column + " " + sort_direction)
  end

  # view = show page
  def show
  	 @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(params[:listing])
    if @listing.save
    #redirect_to :action => 'index'
      redirect_to @listing
    flash[:notice] = 'Listing was successfully created.' if @listing.save
    else
      render :action => "new"
      flash[:notice] = 'Listing creation was unsuccessful.'
    end
  end

  def edit
  	 @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update_attributes(params[:listing])
      flash[:notice] = 'Listing was successfully updated.'
      redirect_to :action => 'view', :id => @listing
    else
      render :action => 'edit'
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy

    respond_to do |format|
      format.html { redirect_to listing_url }
      format.json { head :no_content }
    end
  end

  def pdf
  end

  private 

  def sort_column
    params[:sort] || "item_name"
  end

  def sort_direction
    params[:direction] || "asc" 
  end
end
