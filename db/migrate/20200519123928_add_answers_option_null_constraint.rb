class AddAnswersOptionNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:answers, :option, false)
  end
end
