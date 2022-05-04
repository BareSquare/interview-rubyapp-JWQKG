class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.belongs_to :movie
      t.decimal :score, precision: 10, scale: 2
      t.timestamps
    end
  end
end
