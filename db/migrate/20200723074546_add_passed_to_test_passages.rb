class AddPassedToTestPassages < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, :passed, :boolean, default: false
    change_column_null :test_passages, :passed, false
  end
end
