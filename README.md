### docker command
```bash
$ docker-compose build
# 建立 image Dockerfile 有更動時需要下此指令

$ docker-compose up
# 建立並啟動 containers

$ docker-compose exec app bash
# 進入 app container bash
```

### rails 指令
```bash
$ rails s -p 3000 -b '0.0.0.0'
# 啟動 rails server

$ rails restart
重啟 rails server
```