class CreateReceivedAwards < ActiveRecord::Migration[6.0]
  def change
    create_table :received_awards do |t|
      t.references :badge, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
