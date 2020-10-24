## jd-scripts-docker
[京东薅羊毛工具](https://github.com/lxk0301/scripts)的docker用法  
自动根据github action更新定时任务，无需手动配置更新  

### 安装依赖
git docker docker-compose
### 下载
```sh
git clone https://github.com/chinnkarahoi/jd-scripts-docker
cd jd-scripts-docker
```
## 获取cookie
访问 https://plogin.m.jd.com/login/login 手机号登录获取cookie中的pt_key, pt_pin填入项目目录下的./env/env1文件,  
详细的获取方法可以看
[浏览器获取京东cookie教程](https://github.com/lxk0301/scripts/blob/master/backUp/GetJdCookie.md)或者
[插件获取京东cookie教程](https://github.com/lxk0301/scripts/blob/master/backUp/GetJdCookie2.md)
### 启动
```sh
docker-compose up --build --force-recreate --detach jd1
```
### 测试正确性
签到测试
```sh
docker exec jd1 bash -c 'set -o allexport; source /all; source /env; cd /scripts; node jd_bean_sign.js'
```
或者手动运行所有脚本
```sh
docker exec jd1 bash -c 'set -o allexport; source /all; source /env; cd /scripts; ls jd_*.js | xargs -i node {}'
```

### 更多配置
比如微信推送，各种活动控制，需要配置./env/all文件, 具体参数的含义可以参考[Secrets全集合](https://github.com/lxk0301/scripts/blob/master/githubAction.md)

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
