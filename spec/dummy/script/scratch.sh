#!/bin/sh

cd `dirname $0`/..

rails g model other_lang manuscript_id:integer lang_id:integer
#rails g scaffold manuscript name:string main_lang:string
