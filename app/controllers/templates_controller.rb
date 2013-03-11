class TemplatesController < ApplicationController

  def index
    @templates = Template.all
  end

  def show
    @template = Template.find(params[:id])
  end

  def new
    @template = Template.new
  end

  def edit
    @template = Template.find(params[:id])
  end

  def create
    @template = Template.new(params[:template])
    @template.created_by = current_user

    if @template.save
      redirect_to @template, notice: 'Template was successfully created.'
    else
      render :new
    end
  end

  def update
    @template = Template.find(params[:id])

    if @template.update_attributes(params[:template])
      redirect_to @template, notice: 'Template was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @template = Template.find(params[:id])
    @template.destroy

    redirect_to templates_url
  end
end
