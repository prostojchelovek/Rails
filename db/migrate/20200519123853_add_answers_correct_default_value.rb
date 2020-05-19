class AddAnswersCorrectDefaultValue < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:answer, :correct, false)
  end
end
