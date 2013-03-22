class AddQualifiedToAthlete < ActiveRecord::Migration
  def change
    add_column :athletes, :qualified, :boolean
  end
end
