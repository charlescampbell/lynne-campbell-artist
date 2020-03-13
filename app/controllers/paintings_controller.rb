# frozen_string_literal: true

class PaintingsController < ApplicationController
  before_action :set_painting, only: %i[show edit update destroy]

  layout 'backend', only: %i[new]

  def index
    @paintings = Painting.all
  end

  def new
    @paintings = Painting.all
    @painting = Painting.new
  end

  def create
    @painting = Painting.new(painting_params)

    respond_to do |format|
      if @painting.save
        format.html do
          redirect_to upload_path, notice: 'Uploaded!'
        end
      else
        format.html do
          redirect_to upload_path, alert: 'Shit... something went wrong'
        end
      end
    end
  end

  private

  def set_painting
    @painting = Painting.find(params[:id])
  end

  def painting_params
    params.require(:painting).permit(:name, :price, :description, :image)
  end
end
