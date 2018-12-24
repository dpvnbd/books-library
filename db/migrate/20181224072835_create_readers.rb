class CreateReaders < ActiveRecord::Migration[5.2]
  def change
    create_table :readers do |t|
      t.string :first_name
      t.string :second_name
      t.string :patronymic
      t.date :born_on
      t.text :home_address
      t.text :work_address
      t.string :phone
      t.string :passport

      t.timestamps
    end
  end
end
