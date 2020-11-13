## jd-scripts-docker
docker启动京东薅羊毛工具，自动更新，支持每日签到，京东水果等任务自动操作。

### 安装依赖
git docker docker-compose
### 下载
```sh
git clone https://github.com/chinnkarahoi/jd-scripts-docker
cd jd-scripts-docker
```
### 获取cookie
访问 https://plogin.m.jd.com/login/login 手机号登录获取cookie中的pt_key, pt_pin填入项目目录下的./env/env1文件,  
(此方式cookie有效时长大概31天，其他登录方式比较短)。
更详细的获取方法可以看
[浏览器获取京东cookie教程](https://github.com/lxk0301/jd_scripts/blob/master/backUp/GetJdCookie.md)或者
[插件获取京东cookie教程](https://github.com/lxk0301/jd_scripts/blob/master/backUp/GetJdCookie2.md)
### 微信推送（可选）
cookie失效推送[server酱的微信通知](http://sc.ftqq.com/3.version)，获取到SCKEY后填到./env/all的PUSH_KEY。
### 启动
```sh
docker-compose up --build --force-recreate --detach jd1
```
### 测试正确性
签到测试
```sh
docker exec jd1 bash -c 'set -o allexport; source /all; source /env; source /jd-scripts-docker/resolve.sh; cd /scripts; node jd_bean_sign.js'
```
或者手动运行所有脚本
```sh
docker exec jd1 bash -c 'set -o allexport; source /all; source /env; source /jd-scripts-docker/resolve.sh; cd /scripts; ls jd_*.js | xargs -i node {}'
```
确认可以签到等操作后，即可每天定时执行脚本。

### 获取助力码
请确保运行了几个小时（最好一天）之后再运行此脚本获取助力码
```sh
bash get-code.sh
```

### 更多配置
比如微信推送，各种活动控制，需要配置./env/all文件, 具体参数的含义可以参考[Secrets全集合](https://github.com/lxk0301/jd_scripts/blob/master/githubAction.md)

### 多账号
使用多容器的方式，好处：
1. 脚本并行
2. 每个账号可以有不同的配置，比如配置微信推送
#### 配置
添加第二个账号：以上所有操作中的`1`替换成`2`, 然后重复之前所有操作。  
超过三个账号需要手动创建./env/env4，修改./docker-compose.yml文件
#### 配置文件说明
所有账号共享的参数需要配置./env/all, 每个账号独立参数需要配置./env/env*，  
每个账号配置的参数会覆盖共享参数，每个账号未配置参数的继承共享的参数

### 其他
- 查看log
```sh
docker-compose logs
```
- 停止
```sh
docker-compose down
```
