# frozen_string_literal: true

class CreatePaintings < ActiveRecord::Migration[6.0]
  def change
    create_table :paintings do |t|
      t.string :name
      t.decimal :price
      t.string :description

      t.timestamps
    end
  end
end
