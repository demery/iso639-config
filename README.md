# Iso639Config

## Installing

For now, you'll need to clone the repo and build the gem file.

## Requirements

This engine uses Ruby 1.9 hash syntax. It was built on Rails version 3.1.4, but
should work with any Rails ~3.1 version.  It has not been tested with Rails
3.2.

It depends on the [iso-639][] gem.


## Why ISO 639 Config?

I write a lot of applications that use ISO 639.2 bibliographic codes for
identifying languages in manuscripts and other texts for [TEI][] manuscript
description.  For example,


     <!-- ... -->
     <textLang mainLang="ota">
       The primary language in this manuscript is Turkish, Ottoman (1500-1928).
     </textLang>
     <!-- ... -->

Typically a group of manuscripts will only involve a small number of the
several hundred languages available in the ISO 639.2 list.  Users need to be
able to configure application selection lists to show only the languages 
needed for the application.




This project is my first attempt at a Mountable Engine, and I'm sure does not 
do a lot of things well. I hope to improve it as time goes on.


[TEI]: http://www.tei-c.org/index.xml "Text Encoding Initiative"
[iso-639]: http://rubygems.org/gems/iso-639 "ISO-639 gem at RubyGems.org"
