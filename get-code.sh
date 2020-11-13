CMD="docker-compose"
code1=
code2=
code3=
code4=
srv=${srv:-jd1}
line="$(docker logs $srv | grep -A1 '互助码' | grep -v '^--$' | sed -r "s/[[:cntrl:]]\[[0-9]{1,3}m//g" | sed 'N;s/\n/ /' | sort -u )"
code1=$(echo "$line" | grep "东东农场" | grep -Eo '[a-zA-Z0-9_=+/]{15,}')
code2=$(echo "$line" | grep "东东萌宠" | grep -Eo '[a-zA-Z0-9_=+/]{15,}')
code3=$(echo "$line" | grep "种豆得豆" | grep -Eo '[a-zA-Z0-9_=+/]{15,}')
code4=$(echo "$line" | grep "京小超" | grep -Eo '[a-zA-Z0-9_=+/]{15,}')
echo FRUITSHARECODES=$code1
echo PETSHARECODES=$code2
echo PLANT_BEAN_SHARECODES=$code3
echo SUPERMARKET_SHARECODES=$code4
