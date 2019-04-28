#### Geoip Update

一句话更新命令geoip数据库

```bash
docker run -it -v 替换为本地目录位置:/usr/local/share/GeoIP --user $(id -u):$(id -g) --rm cz5424/geoipupdate
```
