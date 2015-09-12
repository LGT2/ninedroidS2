#!/bin/bash
perl -i -pe 's/\"(-?[\d\ \.]+)?dip\"/"\"".($1*0.8)."dip\""/eg' $1 
perl -i -pe 's/\"(-?[\d\ \.]+)?sp\"/"\"".($1*0.8)."sp\""/eg' $1 
perl -i -pe 's/\"(-?[\d]+)?dip\"/"\"".($1).".0dip\""/eg'  $1
perl -i -pe 's/\"(-?[\d]+)?sp\"/"\"".($1).".0sp\""/eg'  $1

grep '<dimen' res/values/dimens.xml | perl -pe 's/\ *<dimen\ name=\"([^\"]+)\">([0-9\-\.]+)dip<\/dimen>/"export ".($1)."=".($2*0.8)."dip"/eg' | perl -pe 's/\=([0-9\-]+)dip/"\=".($1).".0dip"/eg' | xargs -l > /tmp/vars
source /tmp/vars
perl -i -pe 's/\@dimen\/([^\"]+)/(exists $ENV{$1}?$ENV{$1}:"missing variable $1")/eg' $1 




