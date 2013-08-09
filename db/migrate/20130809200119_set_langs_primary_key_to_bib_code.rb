class SetLangsPrimaryKeyToBibCode < ActiveRecord::Migration
  def up
    execute "ALTER TABLE iso639_config_langs DROP CONSTRAINT iso639_config_langs_pkey;"
    change_column :iso639_config_langs, :id, :integer, null: true
    execute "ALTER TABLE iso639_config_langs ADD PRIMARY KEY (bib_code);"
  end

  def down
    execute "ALTER TABLE iso639_config_langs DROP CONSTRAINT iso639_config_langs_pkey;"
    execute "ALTER TABLE iso639_config_langs ADD PRIMARY KEY (id);"
  end
end
