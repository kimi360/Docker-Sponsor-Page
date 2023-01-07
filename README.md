# Donate
[![icon][icon.license]][License]
[![icon][icon.build]][Action]
[![icon][icon.darkhttpd]][darkhttpd.release]
[![icon][icon.docker.size]][Docker.tags]
[![icon][icon.docker.pull]][Docker.page]

## 简介
🍌一款包含支付宝、微信捐赠按钮的镜像，可使用iframe嵌入。

## 说明
- 基于 [Kaiyuan/sponsor-page][sponsor-page] [TinyJay/donate-page][donate-page] 进行修改。
- 仅保留支付宝和微信二维码。
- 对CSS进行了修改和适配。
- `tag:style1` - 翻转卡片。
- `tag:style2` - 打赏咖啡。
- 点击连接查看 [Dockerfile] 。

##  使用
###  二维码制作
- 截图支付宝、微信收款码。
- 上传 [草料二维码][cli] 识别码内容。
- 重新生成二维码并美化。
- 下载二维码为 `png` 格式。

###  快速开始

```shell
docker run -d \
    --name donate \
    --restart unless-stopped \
    -p 80:80 \
    -v ~/AliPayQR.png:/web/images/AliPayQR.png \
    -v ~/WeChatQR.png:/web/images/WeChatQR.png \
    kimi360/donate
```

###  Docker-compose

```yaml
version: '3'
services:
  donate:
    image: kimi360/donate
    container_name: donate
    restart: unless-stopped
    ports:
      - 80:80
    volumes:
      - ~/AliPayQR.png:/web/images/AliPayQR.png
      - ~/WeChatQR.png:/web/images/WeChatQR.png
```

###  iframe引用
> 使用 `iframe` 嵌入页面的代码，高度至少 `240px`，宽度至少 `310px`！

```html
<iframe src="https://donate.kimi360.top/index.html" style="overflow-x:hidden;overflow-y:hidden; border:0xp none #fff; min-height:240px; width:100%;"  frameborder="0" scrolling="no"></iframe>
```

##  效果
### 翻转卡片
![screenshots][screenshots.donate]

### 打赏咖啡
![screenshots][screenshots.sponsor]


##  演示
- [演示站点 - 翻转卡片][Demo.style1]
- [演示站点 - 打赏咖啡][Demo.style2]

##  引用
- [Kaiyuan/sponsor-page][sponsor-page]
- [TinyJay/donate-page][donate-page]
- [emikulic/darkhttpd][darkhttpd]

##  协议
- [MIT][License]

[icon.license]:        https://img.shields.io/github/license/kimi360/Docker-Donate
[icon.build]:          https://img.shields.io/github/actions/workflow/status/kimi360/Docker-Donate/docker-build-publish.yml
[icon.darkhttpd]:      https://img.shields.io/github/v/release/emikulic/darkhttpd?label=darkhttpd
[icon.docker.size]:    https://img.shields.io/docker/image-size/kimi360/donate/latest?color=yellow
[icon.docker.pull]:    https://img.shields.io/docker/pulls/kimi360/donate?color=orange

[sponsor-page]:        https://github.com/Kaiyuan/sponsor-page.git
[donate-page]:         https://github.com/TinyJay/donate-page
[darkhttpd]:           https://github.com/emikulic/darkhttpd
[darkhttpd.release]:   https://github.com/emikulic/darkhttpd/releases
[cli]:                 https://cli.im/

[Action]:              https://github.com/kimi360/Docker-Donate/actions/workflows/docker-build-publish.yml
[Dockerfile]:          https://github.com/kimi360/Docker-Donate/blob/main/Dockerfile
[License]:             https://github.com/kimi360/Docker-Donate/blob/main/LICENSE
[Demo.style1]:         https://donate.kimi360.top/style1
[Demo.style2]:         https://donate.kimi360.top/style2
[Docker.page]:         https://hub.docker.com/r/kimi360/donate
[Docker.tags]:         https://hub.docker.com/r/kimi360/donate/tags
[screenshots.donate]:  https://raw.githubusercontent.com/kimi360/Docker-Donate/main/screenshots/donate.webp
[screenshots.sponsor]: https://raw.githubusercontent.com/kimi360/Docker-Donate/main/screenshots/sponsor.webp