class Manuscript < ActiveRecord::Base

  belongs_to :main_lang, class_name: "Iso639Config::Lang"
  has_many :other_langs, include: :lang
  has_many :langs, through: :other_langs, class_name: "Iso639Config::Lang" 

  delegate :name, to: :main_lang, prefix: true
  delegate :bib_code, to: :main_lang, prefix: true

  def other_lang_names
    other_langs.map(&:lang_name)   
  end # def main_lang_code

  def other_lang_bib_codes
    other_langs.map(&:bib_code)
  end # def other_lang_bib_codes

end
