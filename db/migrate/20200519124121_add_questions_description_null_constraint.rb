class AddQuestionsDescriptionNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:questions, :description, false)
  end
end
