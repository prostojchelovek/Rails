class AddReferencesToTables < ActiveRecord::Migration[6.0]
  def change
    add_reference :answers, :question, foreign_key: true
    add_reference :tests, :category, foreign_key: true           #В add_reference значение null установлено в true по умолчанию
    add_reference :questions, :test, foreign_key: true
    add_reference :examinations, :user, foreign_key: true
    add_reference :examinations, :test, foreign_key: true
    add_reference :tests, :author, foreign_key: {to_table: :users}
  end
end
