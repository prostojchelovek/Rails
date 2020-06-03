class AddReferencesToTables < ActiveRecord::Migration[6.0]
  def change
    add_reference(:answers, :question, foreign_key: true)
    add_reference(:tests, :user, foreign_key: true)
    add_reference(:tests, :category, foreign_key: true)
    add_reference(:questions, :test, foreign_key: true)
    add_reference(:examinations, :user, foreign_key: true)
    add_reference(:examinations, :test, foreign_key: true)
    add_foreign_key(:tests, :users, column: :author_id)
  end
end
