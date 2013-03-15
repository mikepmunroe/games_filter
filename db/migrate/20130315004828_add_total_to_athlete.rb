class AddTotalToAthlete < ActiveRecord::Migration
  def change
    add_column :athletes, :total, :int
  end
end
