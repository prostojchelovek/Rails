class CreateExaminations < ActiveRecord::Migration[6.0]
  def change
    create_table :examinations do |t|

      t.timestamps
    end

    add_reference(:examinations, :user, foreign_key: true)
    add_reference(:examinations, :test, foreign_key: true)
  end
end
