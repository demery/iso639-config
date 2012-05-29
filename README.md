# Iso639Config

ISO-639 config is a Rail mountable engine that allows you to configure which of
the nearly 500 [ISO 639-2][] languages to display in your application as select
and check box options.

## Installing

### Dependencies

This engine uses Ruby 1.9 hash syntax. It was built on Rails version 3.1.4, but
should work with any Rails ~3.1 version.  It has not been tested with Rails
3.2.

It depends on [William Melody's][alphetum] [iso-639][] gem.

The configuration page uses the jQuery to handle Ajax requests.

### Build and install the gem

This code is not ready to publish to RubyGems.org, so for now, you'll need to
clone the repo, build the gem, install the gem, and add it to your `Gemfile`:

    $ git clone git@github.com:demery/iso639-config.git
    $ cd iso639-config
    $ gem build iso639_config.gemspec
    $ cd ~/path/to/your/app
    $ gem install ~/path/to/iso639_config-X.X.X.gem

Edit your `Gemfile`:

    gem 'iso639_config'

### Copy and run the migrations

From your app's root:

    $ rake iso639_config:install:migrations
    $ rake db:migrate

This will create the `iso639_config_langs` table.

### Add a route to mount the engine

In your `config/routes.rb` file:

    YourApp::Application.routes.draw do

      mount Iso639Config::Engine => "/iso639"
      # ...
    end

You should now be able to access the configuration page at:

     http://localhost:3000/iso639

Of course, change the host, port, and root path as appropriate for your
application's configuration.

## How to use it

Iso639Config::Lang provides two class methods for accessing lists of language
codes.  They are `all_langs` and `listed`.

`Iso639Config::Lang.all_langs` returns an array of Lang objects for each of the
ISO 639-2 languages with their names and codes.

`Iso639Config::Lang.listed` returns a list of all languages in the
`iso639_config_langs` table sorted by English name.

Each Iso639Config::Lang instance is backed by the appropriate `ISO_639`
object and has convenience methods for accessing the `ISO_639` properties:

* `alpha3_bibliographic`, with alias `alpha3`
* `alpha3_terminologic`
* `alpha2`, the two-character code
* `english_name`, with alias `name`
* `french_name`

The root action of the `Iso639Config` engine provides a single page for adding
languages to and removing them from the `iso639_config_langs` table.

The simplest way to use the engine is to add a `lang_id` column or similar to
your model and point it to Iso639Config::Lang.  The following class shows how
you could create a Manuscript object with one main language and multiple other
languages:


     class Manuscript < ActiveRecord::Base
       belongs_to :main_lang, class_name: "Iso639Config::Lang"
       has_many :other_langs, include: :lang
       has_many :langs, through: :other_langs, class_name: "Iso639Config::Lang" 
     
       delegate :name, to: :main_lang, prefix: true
       delegate :bib_code, to: :main_lang, prefix: true
     
       def other_lang_names
         other_langs.map(&:name)   
       end # def main_lang_code
     
       def other_lang_bib_codes
         other_langs.map(&:bib_code)
       end # def other_lang_bib_codes
     end # class Manuscript

     class OtherLang < ActiveRecord::Base
       belongs_to :manuscript
       belongs_to :lang, class_name: "Iso639Config::Lang"
     
       delegate :name, to: :lang
       delegate :bib_code, to: :lang
     end # class OtherLang

Now you can create a form that allows you to select the main and other
languages:

       <div class="field">
         <%= f.label :main_lang_id, "Main language" %><br />
         <%= f.select :main_lang_id, Iso639Config::Lang.listed.map { |l| 
             [ l.name, l.id ] }, { include_blank: true } %>
       </div>
       
       <div class="field">
         <%= hidden_field_tag "manuscript[lang_ids][]", nil %>
         <% Iso639Config::Lang.listed.each do |lang| -%>
           <%= check_box_tag "manuscript[lang_ids][]",  lang.id, 
              @manuscript.lang_ids.include?(lang.id), id: dom_id(lang) %>
           <%= label_tag dom_id(lang), lang.name %><br />
         <% end -%>
       </div>

## Known issues, TODO tasks

FIX: The current behavior of the configuration page is to **delete** records
that the user chooses to delist.  **This is bad** because applications that use
associations to the `iso639_config_langs` table will break when associated
langs are delisted and deleted from that table.  The Iso639Config::Lang class
has a boolean `display` attribute that should be set to false for delisting,
in place of deleting the record.  The change will require a change the
`LangsController#create` action to either create or "re-list" languages.  Also,
the method `Lang.listed` should be changed to return only those languages where
`display` is `true`.

FIX: Add internationalization.

FIX?: Should code `zxx` for 'No linguistic content; Not applicable' always be
listed by default?  The reason for doing this is that most users will not know
that this is an option and may have need to use it.  It's easier for users to
delist the value, than to add it when they don't know it exists.

## Why ISO 639 Config?

I write a lot of applications that use ISO 639-2 bibliographic codes for
identifying languages in manuscripts and other texts for [TEI][] manuscript
description.  For example,


     <!-- ... -->
     <textLang mainLang="ota">
       The primary language in this manuscript is Turkish, Ottoman (1500-1928).
     </textLang>
     <!-- ... -->

Typically a group of manuscripts will only involve a small number of the
several hundred languages available in the ISO 639-2 list.  Users need to be
able to configure application selection lists to show only the languages 
needed for the application.

This project is my first attempt at a Mountable Engine, and I'm sure does not 
do a lot of things well. I hope to improve it as time goes on.


[alphetum]: https://github.com/alphabetum "alphetum at github.com"
[iso-639]: http://rubygems.org/gems/iso-639 "ISO-639 gem at RubyGems.org"
[ISO 639-2]: http://www.loc.gov/standards/iso639-2/php/code_list.php "Library of Congress ISO 639-2 page"
[TEI]: http://www.tei-c.org/index.xml "Text Encoding Initiative"
