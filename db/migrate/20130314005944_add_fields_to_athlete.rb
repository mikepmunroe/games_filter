class AddFieldsToAthlete < ActiveRecord::Migration
  def change
    add_column :athletes, :region, :string
    add_column :athletes, :team, :string
    add_column :athletes, :gender, :string
    add_column :athletes, :age, :int
    add_column :athletes, :height, :string
    add_column :athletes, :weight, :int
  end
end
