class CreateExaminations < ActiveRecord::Migration[6.0]
  def change
    create_table :examinations do |t|

      t.timestamps
    end
  end
end
