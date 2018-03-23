# 3 lines of trying
# CLI input is website/domain
#

TARGET=$1

if [ ! -f ./$TARGET_base.txt ] ; then
  echo "MAKING BASELINE"
  dig $TARGET +short | sort > $TARGET_base.txt
else
  dig $TARGET +short | sort > $TARGET_new.txt
fi

DIFF=$(diff $TARGET_base.txt $TARGET_new.txt) 

if [ "$DIFF" != "" ] ; then
  echo "ALERT - SENDING MAIL"
  echo $DIFF | mail -r captain_notify@shaw.ca --append=From:"yerh_haxed_m8@lulz.panic"
fi
