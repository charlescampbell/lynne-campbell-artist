class AddSizeToPaintings < ActiveRecord::Migration[6.0]
  def change
    add_column :paintings, :size, :string
  end
end
