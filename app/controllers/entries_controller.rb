class EntriesController < ApplicationController
  skip_before_action :verify_authenticity_token 
  def index
    @entry = Entry.all
    # render :template => "tacos/index"
  end

  def show
    # find a Place
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

    # assign user-entered form data to Place's columns
    @entry["title"] = params["title"]
    

    # save Place row
    @entry.save

    # redirect user
    redirect_to "/entries"
  end

end

end
