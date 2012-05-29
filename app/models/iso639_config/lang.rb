require 'iso-639'


module Iso639Config
  class Lang < ActiveRecord::Base
    attr_accessible :bib_code, :display, :script_direction

    attr_reader :iso_639

    delegate :alpha3, to: :iso_639, allow_nil: true
    delegate :alpha3_terminologic, to: :iso_639, allow_nil: true
    delegate :alpha3_bibliographic, to: :iso_639, allow_nil: true
    delegate :alpha2, to: :iso_639, allow_nil: true
    delegate :english_name, to: :iso_639, allow_nil: true
    delegate :french_name, to: :iso_639, allow_nil: true
    alias_method :name, :english_name

    validates_presence_of :bib_code
    validates_uniqueness_of :bib_code

    #----------------------------------------
    # class methods
    #----------------------------------------
    def self.listed
      Lang.all.sort_by { |l| l.name }
    end # def self.listed

    def self.all_langs
      langs = Lang.all
      ISO_639::ISO_639_2.map { |codes| 
        if (lang = langs.detect { |l| codes.alpha3 == l.bib_code })
          lang
        else
          Lang.new(bib_code: codes.alpha3)
        end
      } 
    end # def self.all_langs

    #----------------------------------------
    # instance methods
    #----------------------------------------
    def iso_639
      ISO_639.find(bib_code) 
    end # def iso_639

 end # class Lang
end # module Iso639Config
