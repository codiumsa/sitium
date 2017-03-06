class Admin::EntriesController < ApplicationController
  before_action :authenticate_user!
  layout "admin"

  def index
    if params[:entry_type] == "articles"
      @entries = Entry.articles.default_sort.page(params[:page])
    elsif params[:entry_type] == "pages"
      @entries = Entry.page.default_sort.page(params[:page])
    end
  end

  def show
  end

  def new
    @entry = Entry.new(entry_type: params[:entry_type].singularize)
  end

  def create
  end

  def edit
    @entry = Entry.find(id: params[:id])
  end

  def update
    @entry = Entry.find(id: params[:id])
  end

  def destroy
    @entry = Entry.find(id: params[:id])
  end


  private
  def entry_params
  end
end
