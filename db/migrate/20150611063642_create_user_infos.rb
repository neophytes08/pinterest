class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.string :fname
      t.string :lname
      t.date :bday
      t.string :address

      t.timestamps null: false
    end
  end
end
