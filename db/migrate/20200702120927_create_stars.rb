class CreateStars < ActiveRecord::Migration[6.0]
  def change
    create_table :stars do |t|
      t.belongs_to :person
      t.belongs_to :movie
      t.timestamps
    end
  end
end
