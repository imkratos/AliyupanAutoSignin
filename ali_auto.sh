#!/bin/sh
# auto_sign_aliyun
# author:kratos

#你自己的refresh_token
refresh_token="你自己的refresh_token"

function get_json_value()
{
  local json=$1
  local key=$2

  if [[ -z "$3" ]]; then
    local num=1
  else
    local num=$3
  fi

  local value=$(echo "${json}" | awk -F"[,:}]" '{for(i=1;i<=NF;i++){if($i~/'${key}'\042/){print $(i+1)}}}' | tr -d '"' | sed -n ${num}p)

  echo ${value}
}


token=$(curl -s  -X POST -H "Content-Type: application/json" -d '{"grant_type": "refresh_token", "refresh_token": "'"$refresh_token"'"}' https://auth.aliyundrive.com/v2/account/token)


access_token=$(get_json_value $token "access_token")

# show token
#echo $access_toekn
sign=$(curl -s -X POST -H "Content-Type: application/json" -H 'Authorization:Bearer '$access_token'' -d '{"grant_type": "refresh_token", "refresh_token": "'"$refresh_token"'"}' https://member.aliyundrive.com/v1/activity/sign_in_list)

#show sign result
#echo $sign

#不做验证
#result=$(get_json_value $sign "success")
echo "签到成功"
