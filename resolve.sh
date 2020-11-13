#!/bin/bash
[ -n "$FruitShareCodes" ] && {
  FRUITSHARECODES="$FruitShareCodes"
}
[ -n "$PetShareCodes" ] && {
  PETSHARECODES="$PetShareCodes"
}
[ -n "$SuperMarketShareCodes" ] && {
  SUPERMARKET_SHARECODES="$SuperMarketShareCodes"
}
[ "$FRUITSHARECODES" == "" ] && {
FRUITSHARECODES=cb4246716771424bbcf95ddc538f045b@f811d0cd0b014e2bbc1074dfc7d76730@d351da2f90254f2ebb128ff13e001fe3@0c9f7a386947425caee4594e9e35f428
}
[ "$PETSHARECODES" == "" ] && {
PETSHARECODES=MTE1NDQ5MzYwMDAwMDAwMzcwMDk1ODM=@MTE1NDUyMjEwMDAwMDAwMzcwNjQ5MTM=@MTE1NDAxNzcwMDAwMDAwMzg0ODMxODU=@MTE1NDQ5OTIwMDAwMDAwMzg0ODMxNzU=
}
[ "$PLANT_BEAN_SHARECODES" == "" ] && {
PLANT_BEAN_SHARECODES=mlrdw3aw26j3xvmulpdlkkt32g35trpagxwrbca@7oivz2mjbmnx5jrk3p2gxuwdvrorc62cj47lsra@fvva6zeiwfyqq4mtmpvb77rv3e@srgepymzhziz5iowkqvo2u6nna
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
