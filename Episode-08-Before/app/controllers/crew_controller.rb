class CrewController < ApplicationController
  respond_to :json

  def index
    sleep 2
    @crew = Crew.limit 50
  end

  def show
    sleep 2
    @member = Crew.find params[:id]
  end

  def update
    sleep 2
    @member = Crew.find params[:id]
    if @member.update_attributes params
      render :show
    else
      respond_with @member
    end
  end

  def create
    sleep 2
    @member = Crew.new
    if @member.update_attributes params
      render :show
    else
      respond_with @member
    end
  end

  def destroy
    member = Crew.find params[:id]
    member.destroy()
    render json: {}
  end

end