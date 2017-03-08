class CreateEntryTranslations < ActiveRecord::Migration[5.0]
  def change
    create_table :entry_translations do |t|
      t.string :locale, default: 'es'
      t.string :title, null: false
      t.string :slug, null: false
      t.string :description
      t.string :content

      t.timestamps
    end

    add_index :entry_translations, :slug
  end
end
