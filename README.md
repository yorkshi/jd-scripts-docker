### 安装依赖
```sh
sudo apt install -y git docker docker.io docker-compose
```
### 下载
```sh
git close https://github.com/chinnkarahoi/jd-scripts-docker
cd jd-scripts-docker
```
## 获取cookie
访问 https://m.jd.com 手机号登录获取cookie中的pt_key, pt_pin填入项目目录下的./env/env1文件,  
详细的获取方法可以看
[浏览器获取京东cookie教程](https://github.com/lxk0301/scripts/blob/master/backUp/GetJdCookie.md)或者
[插件获取京东cookie教程](https://github.com/lxk0301/scripts/blob/master/backUp/GetJdCookie2.md)
### 启动
```sh
docker-compose up --force-recreate --detach jd1
```
### 测试正确性
签到测试
```sh
docker exec -t jd1 bash -c 'set -o allexport; source /all; source /env; cd /scripts; node jd_bean_sign.js'
```
或者手动运行所有脚本
```sh
docker exec -t jd1 bash -c 'set -o allexport; source /all; source /env; cd /scripts; ls jd_*.js | xargs -i node {}'
```
### 查看log
```sh
docker-compose logs -f jd1
```

### 更多配置
配置./env/all, 具体key的含义可以参考[Secrets全集合](https://github.com/lxk0301/scripts/blob/master/githubAction.md)

### 多账号
使用多容器的方式，好处：
1. 脚本并行
2. 每个账号可以有不同的配置，比如配置微信推送
#### 多账号配置
以上所有操作中的`1`替换成`2`, 然后重复之前所有操作。  
所有账号共享的key需要配置./env/all, 每个账号独立的key需要配置./env/env*，  
账号配置的key会覆盖共享的key，账号没有的key继承共享的key

