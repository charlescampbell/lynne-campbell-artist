# frozen_string_literal: true

class DescriptionsController < ApplicationController
  before_action :set_description, only: %i[edit update destroy]

  layout 'backend'

  def new
    @description = Description.new
  end

  def edit; end

  def update
    respond_to do |format|
      if @description.update(description_params)
        format.html do
          redirect_to upload_path,
                      notice: 'Description was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @description }
      else
        format.html { render :edit }
        format.json do
          render json: @description.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @description.destroy
    respond_to do |format|
      format.html do
        redirect_to upload_path,
                    notice: 'Description was successfully removed.'
      end
      format.json { head :no_content }
    end
  end

  private

  def set_description
    @description = Description.find(params[:id])
  end

  def description_params
    params.require(:description).permit(:description)
  end
end
