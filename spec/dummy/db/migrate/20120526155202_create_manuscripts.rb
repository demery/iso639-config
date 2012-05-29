class CreateManuscripts < ActiveRecord::Migration
  def change
    create_table :manuscripts do |t|
      t.string :name
      t.string :main_lang_id

      t.timestamps
    end

    add_index :manuscripts, :main_lang_id
  end
end
