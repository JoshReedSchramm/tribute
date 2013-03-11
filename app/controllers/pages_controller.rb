class PagesController < ApplicationController
  before_filter :get_templates, :only => [:new, :edit, :create, :update]
  before_filter :get_page, :only => [:edit, :update, :destroy, :show]
  before_filter :require_owner, :only => [:edit, :update, :destroy]

  def index
    @pages = Page.all
  end

  def show
    @body_class = @page.template.class_name unless @page.template.nil?
  end

  def new
    @page = Page.new
  end

  def edit
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
    if @page.update_attributes(params[:page])
      redirect_to @page, notice: 'Page was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @page.destroy

    redirect_to pages_url
  end

  private
    def get_templates
      @templates = Template.all
    end

    def get_page
      @page = Page.find(params[:id])
    end

    def require_owner
      unless @page.allows_editor?(current_user)
        redirect_to pages_path, alert: t('errors.bad_editor') and return false
      end
    end
end
