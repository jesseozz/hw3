class PlacesController < ApplicationController
  
  def index
    @places = Place.all
    # render :template => "tacos/index"
  end

  def show
    # find a Place
    @place = Place.find_by({ "id" => params["id"] })
    # find Contacts for the Company
    # render companies/show view with details about Company
  end

  def new
    # render view with new Company form
  end

  def create
    # start with a new Company
    @place = Place.new

    # assign user-entered form data to Company's columns
    @place["name"] = params["name"]

    # save Company row
    @place.save

    # redirect user
    redirect_to "/places"
  end

end
