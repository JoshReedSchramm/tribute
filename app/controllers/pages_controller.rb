class PagesController < ApplicationController
  before_filter :get_templates, :only => [:new, :edit, :create, :update]

  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
    @body_class = @page.template.class_name unless @page.template.nil?
  end

  def new
    @page = Page.new
  end

  def edit
    @page = Page.find(params[:id])
  end

  def create
    @page = Page.new(params[:page])
    @page.owner = current_user

    if @page.save
      redirect_to @page, notice: 'Page was successfully created.'
    else
      render :new
    end
  end

  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(params[:page])
      redirect_to @page, notice: 'Page was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    redirect_to pages_url
  end

  private
  def get_templates
    @templates = Template.all
  end
end
