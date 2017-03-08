class AddLocaleToEntries < ActiveRecord::Migration[5.0]
  def change
    add_column :entries, :locale, :string, default: 'es'
  end
end
