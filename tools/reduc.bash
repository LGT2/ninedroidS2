perl -i -pe 's/\"(-?[\d\ \.]+)?dip\"/"\"".($1*1)."dip\""/eg' $1 
perl -i -pe 's/>(-?[\d\ \.]+)?dip\"/">".($1*1)."dip\""/eg' $1 
perl -i -pe 's/\"(-?[\d]+)?dip\"/"\"".($1).".0dip\""/eg'  $1
perl -i -pe 's/>(-?[\d]+)?dip\"/">".($1).".0dip\""/eg'  $1

