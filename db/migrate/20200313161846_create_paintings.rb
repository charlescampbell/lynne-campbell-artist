# frozen_string_literal: true

class CreatePaintings < ActiveRecord::Migration[6.0]
  def change
    create_table :paintings, &:timestamps
  end
end
