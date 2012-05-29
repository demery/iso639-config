class CreateIso639ConfigLangs < ActiveRecord::Migration
  def change
    create_table :iso639_config_langs do |t|
      t.string :bib_code, null: false
      t.boolean :display
      t.string :script_direction

      t.timestamps
    end

    add_index :iso639_config_langs, :bib_code
    add_index :iso639_config_langs, :display
  end
end
