class WorksController < ApplicationController
  def index
    @works = Work.all
    @spotlight = @works.sample
  end
end
