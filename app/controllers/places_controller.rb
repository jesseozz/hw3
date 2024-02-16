
class PlacesController < ApplicationController
skip_before_action :verify_authenticity_token 
  def index
    @places = Place.all
    @entries = Entry.all
    # render :template => "tacos/index"
  end

  def show
    # find a Place
    @place = Place.find_by({ "id" => params["id"] })
    # find Entries for the Company
    # render companies/show view with details about Company
  end

  def new
    @place = Place.new
  end

  def create
    # start with a new Place
    @place = Place.new

    # assign user-entered form data to Place's columns
    @place["name"] = params["name"]

    # save Place row
    @place.save

    # redirect user
    redirect_to "/places"
  end

end
