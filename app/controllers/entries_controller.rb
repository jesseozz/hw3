class EntriesController < ApplicationController
  skip_before_action :verify_authenticity_token 
  def index
    @entries = Entry.all
    # render :template => "tacos/index"
  end

  def show
    # find an entry
    @entry = Entry.find_by({ "id" => params["id"] })
    
    # find Entries for the Place
    # render companies/show view with details about Place
  end

  def new
    @entry = Entry.new
    @place = Place.find_by({ "id" => params["place_id"]})
  end

  def create
    # start with a new Entry
    @entry = Entry.new

    # assign place identifier to Entry's column
    @entry["place_id"] = params["place_id"]

    # assign user-entered form data to Entry's columns
    @entry["title"] = params["title"]
    @entry["posted_on"] = params["posted_on"]
    @entry["description"] = params["description"]

    # save Place row
    @entry.save

    # redirect user
    redirect_to "/places/#{@entry["place_id"]}"
  end

end
