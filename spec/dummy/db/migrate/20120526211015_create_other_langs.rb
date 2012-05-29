class CreateOtherLangs < ActiveRecord::Migration
  def change
    create_table :other_langs do |t|
      t.integer :manuscript_id
      t.integer :lang_id

      t.timestamps
    end
    add_index :other_langs, :manuscript_id
    add_index :other_langs, :lang_id
  end
end
