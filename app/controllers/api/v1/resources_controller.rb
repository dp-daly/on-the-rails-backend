class Api::V1::ResourcesController < ApplicationController
  before_action :set_resource, only: %i[show update destroy]

  def index
    @resources = Resource.all

    render json: @resources
  end

  def show
    render json: @resource
  end

  def create
    @resource = Resource.new(resource_params)

    if @resource.save
      render json: @resource, status: :created, location: api_v1_resource_path(@resource)
    else
      render json: @resource.errors, status: :unprocessable_content
    end
  end

  def update
    if @resource.update(resource_params)
      render json: @resource
    else
      render json: @resource.errors, status: :unprocessable_content
    end
  end

  def destroy
    @resource.destroy!
  end

  private
    def set_resource
      @resource = Resource.find(params[:id])
    end

    def resource_params
      params.require(:resource).permit(:title, :description, :link)
    end
end
