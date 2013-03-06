class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.string :url
      t.string :name
      t.string :w1
      t.string :w2
      t.string :w3
      t.string :w4
      t.string :w5

      t.timestamps
    end
  end
end
