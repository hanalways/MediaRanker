class WorksController < ApplicationController
  def index
    @works = Work.all
    @categories = ['album', 'book', 'movie']
  end

  def show
    @work = Work.find_by(id: params[:id])
  end

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
end
