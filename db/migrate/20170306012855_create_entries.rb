class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.string :description
      t.text :content
      t.string :status, default: 'draft'
      t.string :entry_type, default: 'page'
      t.integer :user_id
      t.datetime :published_at

      t.timestamps
    end

    add_foreign_key :entries, :users
    add_index :entries, :slug
    add_index :entries, :status
    add_index :entries, :entry_type
  end
end
