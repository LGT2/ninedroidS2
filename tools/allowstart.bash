perl -i -pe 's/\.line 103//eg' $1
perl -i -pe 's/invoke-virtual\/range \{v0 \.\. v5\}, Landroid\/location\/LocationManager;->requestLocationUpdates\(Ljava\/lang\/String;JFLandroid\/location\/LocationListener;\)V//eg'  $1

