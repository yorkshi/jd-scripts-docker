#!/bin/bash
[ -z "$FruitShareCodes" ] && {
  FRUITSHARECODES="$FruitShareCodes"
}
[ -z "$PetShareCodes" ] && {
  PETSHARECODES="$PETSHARECODES"
}
[ -z "$SuperMarketShareCodes" ] && {
  SUPERMARKET_SHARECODES="$SuperMarketShareCodes"
}
[ "$FRUITSHARECODES" == "" ] && {
FRUITSHARECODES=cb4246716771424bbcf95ddc538f045b@b6937910fb504ebd9af4addce592c30d@a44478b71c5c4c5697012df21a52415d@f811d0cd0b014e2bbc1074dfc7d76730
}
[ "$PETSHARECODES" == "" ] && {
PETSHARECODES=MTE1NDQ5MzYwMDAwMDAwMzcwMDk1ODM=@MTE1NDAxNzcwMDAwMDAwMzcwNDc2ODc=@MTE1NDQ5OTUwMDAwMDAwMzcwNTY5MTU=@MTE1NDUyMjEwMDAwMDAwMzcwNjQ5MTM=
}
[ "$PLANT_BEAN_SHARECODES" == "" ] && {
PLANT_BEAN_SHARECODES=mlrdw3aw26j3xvmulpdlkkt32g35trpagxwrbca@cshk5bfjifz74parg3cxagi54zgmsndzbl24qgq@rtsljotwy2w34w3z747iokyengkawlutzbbwy3q@7oivz2mjbmnx5jrk3p2gxuwdvrorc62cj47lsra
}
[ "$SUPERMARKET_SHARECODES" == "" ] && {
SUPERMARKET_SHARECODES=eU9Yae3mYKkkp23QyCEWgg@eU9YOo7gOJxgsgyQgSdL@eU9YDZ_2I518sBuxnjt0@eU9YN732JrpGiBWjnyFP
}
FruitShareCodes=$FRUITSHARECODES
jdJoyRewardNotify=$JD_JOY_REWARD_NOTIFY
jdSuperMarketRewardNotify=$MARKET_REWARD_NOTIFY
joyRunFlag=$JOY_RUN_FLAG
jdSuperMarketUpgrade=$SUPERMARKET_UPGRADE
jdBusinessCircleJump=$BUSINESS_CIRCLE_JUMP
jdSuperMarketLottery=$SUPERMARKET_LOTTERY
jdFruitBeanCard=$FRUIT_BEAN_CARD
