class AddAffiliateToAthletes < ActiveRecord::Migration
  def change
    add_column :athletes, :affiliate, :string
  end
end
