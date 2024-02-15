class EntriesController < ApplicationController
  skip_before_action :verify_authenticity_token 
  def index
    @entries = Entry.all
    # render :template => "tacos/index"
  end

  def show
    # find an entry
    @entry = Entry.find_by({ "id" => params["id"] })
    # find Entries for the Company
    # render companies/show view with details about Company
  end

  def new
    @entry = Entry.new
  end

  def create
    # start with a new Place
    @entry = Entry.new

    # assign user-entered form data to Entry's columns
    @entry["place_id"] = Place.find_by({ "id" => params["place"] })
    @entry["title"] = params["title"]
    @entry["posted_on"] = params["posted_on"]
    @entry["description"] = params["description"]

    # save Place row
    @entry.save

    # redirect user
    redirect_to "/entries"
  end

end
