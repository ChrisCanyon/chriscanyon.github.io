class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :nickname
      t.json :beers, array: true, default: []
      t.integer :distance, default: 4
      t.timestamps
    end
  end
end
