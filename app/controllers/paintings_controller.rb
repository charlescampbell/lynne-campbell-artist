# frozen_string_literal: true

class PaintingsController < ApplicationController
  before_action :set_painting, only: %i[edit show update destroy mark_sold]

  layout 'backend', only: %i[edit new]

  def index
    @paintings = Painting.all.order('created_at DESC')
  end

  def contact; end

  def show; end

  def edit; end

  def new
    @paintings = Painting.all.order('created_at DESC')
    @descriptions = Description.all.order('created_at DESC')
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
          redirect_to upload_path, alert: 'Something has gone wrong!'
        end
      end
    end
  end

  def add_description
    @description = Description.new(description_params)

    respond_to do |format|
      if @description.save
        format.html do
          redirect_to upload_path,
                      notice: 'Description was successfully created.'
        end
        format.json { render :show, status: :created, location: @description }
      else
        format.html { render :new }
        format.json do
          render json: @description.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @painting.update(painting_params)
        format.html do
          redirect_to edit_painting_path(@painting), notice: 'Updated!'
        end
      else
        format.html do
          redirect_to edit_painting_path(@painting),
                      alert: 'Something has gone wrong!'
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
    params.require(:painting).permit(:name, :price, :description, :image, :size)
  end

  def description_params
    params.permit(:description)
  end
end
