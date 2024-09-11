cookie_value="$PTT_COOKIE"
echo "$cookie_value"

# 构建curl命令
curl_command="curl 'https://www.pttime.org/attendance.php' \
  -H 'authority: www.pttime.org' \
  -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' \
  -H 'accept-language: zh-CN,zh;q=0.9,en;q=0.8' \
  -H 'cookie: $cookie_value' \
  -H 'referer: https://www.pttime.org/forums.php' \
  -H 'sec-ch-ua: "Google Chrome";v="113", "Chromium";v="113", "Not-A.Brand";v="24"' \
  -H 'sec-ch-ua-mobile: ?1' \
  -H 'sec-ch-ua-platform: "Android"' \
  -H 'sec-fetch-dest: document' \
  -H 'sec-fetch-mode: navigate' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-user: ?1' \
  -H 'upgrade-insecure-requests: 1' \
  -H 'user-agent: Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Mobile Safari/537.36' \
  --compressed"

# 执行curl命令并打印返回的内容
echo "开始ptt签到"
response=$(eval "$curl_command")

# 检查返回内容中是否包含"签到成功"
if [[ $response == *"签到成功"* ]]; then
  echo "签到成功"
else
  echo "签到失败"
fi

echo "$response"
