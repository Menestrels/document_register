class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.string :name,      null: false
      t.text :description
      t.integer :user_id,   null: false

      t.timestamps
    end
  end
end
