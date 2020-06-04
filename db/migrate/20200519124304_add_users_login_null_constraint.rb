class AddUsersLoginNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :login, false
  end
end
