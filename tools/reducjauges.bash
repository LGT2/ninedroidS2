perl -i -pe 's/\"(-?[\d\ \.]+)?dip\"/"\"".($1*0.7)."dip\""/eg' $1 
perl -i -pe 's/\"(-?[\d\ \.]+)?sp\"/"\"".($1*0.7)."sp\""/eg' $1 
perl -i -pe 's/\"(-?[\d]+)?dip\"/"\"".($1).".0dip\""/eg'  $1
perl -i -pe 's/\"(-?[\d]+)?sp\"/"\"".($1).".0sp\""/eg'  $1
#perl -i -pe 's/wrap_content/fill_parent/eg' $1
perl -i -pe 's/\@dimen\/dashboard_height/"304.5dip"/eg' $1
perl -i -pe 's/\@dimen\/distance_img_time_top/"231.0dip"/eg' $1
perl -i -pe 's/\@dimen\/distance_tv_time_top/"245.0dip"/eg' $1
perl -i -pe 's/\@dimen\/distance_tv_time_value_top/"259.0dip"/eg' $1
perl -i -pe 's/\@dimen\/distance_img_km_top/"236.6dip"/eg' $1
perl -i -pe 's/\@dimen\/distance_tv_km_top/"245.0dip"/eg' $1
perl -i -pe 's/\@dimen\/distance_tv_km_value_top/"259.0dip"/eg' $1
perl -i -pe 's/\@dimen\/distance_img_temp_top/"169.4dip"/eg' $1
perl -i -pe 's/\@dimen\/distance_progress_temp_top/"147.0dip"/eg' $1
perl -i -pe 's/\@dimen\/distance_img_power_top/"172.9dip"/eg' $1
perl -i -pe 's/\@dimen\/distance_progress_power_top/"147.0dip"/eg' $1
perl -i -pe 's/\@dimen\/distance_tv_speed_top/"70.0dip"/eg' $1
perl -i -pe 's/\@dimen\/distance_tv_avgspeed_top/"24.5dip"/eg' $1
perl -i -pe 's/\@dimen\/distance_tv_search_top/"21.0dip"/eg' $1


