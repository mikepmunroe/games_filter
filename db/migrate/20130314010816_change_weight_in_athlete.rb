class ChangeWeightInAthlete < ActiveRecord::Migration
  def up
    change_column :athletes, :weight, :string
  end

  def down
    change_column :athletes, :weight, :int
  end
end
