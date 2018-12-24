class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.date :published_on
      t.string :publisher
      t.datetime :decommissioned_at
      t.text :decommissioned_reason
      t.integer :number_of_pages

      t.timestamps
    end
  end
end
