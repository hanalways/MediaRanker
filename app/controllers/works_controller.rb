class WorksController < ApplicationController
  # update with update and delete
  before_action :find_work, only: [:show, :edit]

  def index
    @works = Work.all
    @categories = ['album', 'book', 'movie']
  end

  # Show and Edit are entirely the find_works helper

  def new
    @work = Work.new
  end

  def create
    puts "Creating new media..."

    @work = Work.new(work_params)
    
    successful = @work.save
    if successful
      flash[:status] = :success
      flash[:message] = "Successfully saved media with ID #{@work.id}"
      redirect_to works_path
    else
      flash.now[:status] = :error
      flash.now[:message] = "Could not save media"
      render :new, status: :bad_request
    end
  end

  private
  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end

  def find_work 
    @work = Work.find_by(id: params[:id])
    unless @work
      head :not_found
    end
  end
end
