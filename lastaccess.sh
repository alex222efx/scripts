#/bin/bash
#
for F in $(ls)
#
do
# 
 [ ! -f $F ] && continue
#
 DT=$(stat $F | grep Access | tail -1 | cut -d " " -f2)
#
    echo " $F |  $(du -b $F | cut -f1)  bytes | accessed  $DT"
done

