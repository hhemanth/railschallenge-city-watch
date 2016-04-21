class EmergenciesController < ApplicationController
  def new
  end

  def index
    @emergencies = Emergency.all
    respond_to do |format|
    format.html # index.html.erb
    format.json  { render :file => "emergencies/index.json.erb", :content_type => 'application/json' }
  end

  end

  def create
  end
end
