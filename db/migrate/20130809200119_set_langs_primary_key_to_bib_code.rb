class SetLangsPrimaryKeyToBibCode < ActiveRecord::Migration
  def up
    execute "ALTER TABLE iso639_config_langs ADD PRIMARY KEY (bib_code);"
  end

  def down
    execute "ALTER TABLE iso639_config_langs ADD PRIMARY KEY (id);"
  end
end
