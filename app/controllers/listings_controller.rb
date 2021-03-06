class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def mylisting
    @listing = Listing.where(user_id: current_user.id)
  end

  def new
    @listing = Listing.new
    @tagging = Tagging.new
    @all_taggings =["Smoker", "Asshole", "Gamer", "Asian"]
  end

  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      redirect_to listing_path(@listing)
    else
      render 'new'
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])

    if @listing.update(listing_params)
      redirect_to listing_path
    else
      render 'edit'
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy

    redirect_to mylisting_path
  end

  private
  def listing_params
    params.require(:listing).permit(:title, :price, :all_tags, :max_guests, all_tags_array: [])
  end
end
