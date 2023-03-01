# AliyupanAutoSignin
阿里云盘shell 版自动签到，可以领取VIP

# 第一步：获取 refresh_token
1. 网页登录阿里云盘官网 https://www.aliyundrive.com/drive
2. 按F12，进入开发者工具模式，在顶上菜单栏点 Application ，然后在左边菜单找到 Local storage 下面的 https://www.aliyundrive.com 这个域名，点到这个域名会看到有一个 token 选项，再点 token ，就找到 refresh_token 了
<img width="1510" alt="image" src="https://user-images.githubusercontent.com/3302461/222120040-2ad6d895-a86e-4035-b420-74550efc27e1.png">

# 第二步：修改shell脚本中的 第一行 refresh_token 为你自己的 `refresh_token`

refresh_token="这里修改为你自己的token"

# 第三步：在 crontab 中添加你的任务
