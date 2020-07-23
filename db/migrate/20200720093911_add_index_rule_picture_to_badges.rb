class AddIndexRulePictureToBadges < ActiveRecord::Migration[6.0]
  def change
    add_index :badges, [:rule, :parameter], unique: true
  end
end
