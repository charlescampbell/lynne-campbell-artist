# frozen_string_literal: true

class PaintingsController < ApplicationController
  before_action :set_painting, only: %i[show destroy mark_sold]

  layout 'backend', only: %i[new]

  def index
    @paintings = Painting.all
  end

  def contact; end

  def new
    @paintings = Painting.all.order('created_at DESC')
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

  def destroy
    @painting.destroy

    respond_to do |format|
      format.html do
        redirect_to upload_path, notice: 'Removed!'
      end
    end
  end

  def mark_sold
    @painting.sold = true
    @painting.save
    redirect_to upload_path, alert: 'Sold!'
  end

  private

  def set_painting
    @painting = Painting.find(params[:id])
  end

  def painting_params
    params.require(:painting).permit(:name, :price, :description, :image)
  end
end
