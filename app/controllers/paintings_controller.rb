# frozen_string_literal: true

class PaintingsController < ApplicationController
  before_action :set_painting, only: %i[show edit update destroy]

  def index
    @paintings = Painting.all
  end
end
