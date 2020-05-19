class AddAnswersOptionNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:answer, :option, false)
  end
end
