class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.boolean :correct, null: false
      t.string :option

      t.timestamps
    end
  end
end
