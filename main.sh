# M=$[5 + $RANDOM % 3]
# echo $M
for Y in {2012..2012}
do
  mkdir $Y
  cd $Y
  for M in {02..04}
    do
      # if [ M != $[5 + $RANDOM % 3] ]; then
      # M=$[7 + $RANDOM % 3]
      mkdir $M
      cd $M
      for D in {03..18}
      # if [ D != $[1 + $RANDOM % ] ]; then
      do
        D=$[1 + $RANDOM % 30]
        mkdir $D
        cd $D
        for i in {09..17}
        do
        i=$[1 + $RANDOM % 12]
          echo "$i on $M/$D/$Y" > commit.md
          export GIT_COMMITTER_DATE="$Y-$M-$D 12:$i:00"
          export GIT_AUTHOR_DATE="$Y-$M-$D 12:$i:00"
          git add commit.md -f
          git commit --date="$Y-$M-$D 12:0$i:00" -m "$i on $M $D $Y"
        done
        cd ../
      done
      cd ../
      # fi
    done
  cd ../
done
git push -u origin main
git rm -rf 20**
# git rm -rf 19**
git commit -am "feat: completing brush effect"
git push -u origin main