class OtherLang < ActiveRecord::Base
  belongs_to :manuscript
  belongs_to :lang, class_name: "Iso639Config::Lang"

  delegate :name, to: :lang, prefix: true
  delegate :bib_code, to: :lang
end
