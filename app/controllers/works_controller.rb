class WorksController < ApplicationController
  def index
    @works = Work.all
    @categories = ['album', 'book', 'movie']
    @spotlight = @works.sample
  end

  def show
    @work = Work.find_by(id: params[:id])
  end


end
