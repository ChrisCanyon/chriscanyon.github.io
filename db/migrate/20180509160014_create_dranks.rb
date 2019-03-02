class CreateDranks < ActiveRecord::Migration[5.2]
  def change
    create_table :dranks do |t|
      t.string :drinker
      t.string :beer
      t.timestamps
    end
  end
end
