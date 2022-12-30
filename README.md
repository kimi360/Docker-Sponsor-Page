# Donate
[![License](https://img.shields.io/github/license/kimi360/Docker-Donate)](https://github.com/kimi360/Docker-Donate/blob/main/LICENSE)
[![Build](https://img.shields.io/github/actions/workflow/status/kimi360/Docker-Donate/docker-build-publish.yml)](https://github.com/kimi360/Docker-Donate/actions/workflows/docker-build-publish.yml)
[![Darkhttpd](https://img.shields.io/github/v/release/emikulic/darkhttpd?label=darkhttpd)](https://github.com/emikulic/darkhttpd/releases)
[![Docker Size](https://img.shields.io/docker/image-size/kimi360/donate/latest?color=yellow)](https://hub.docker.com/r/kimi360/donate/tags)
[![Docker Pulls](https://img.shields.io/docker/pulls/kimi360/donate?color=orange)](https://hub.docker.com/r/kimi360/donate)

## 简介
🍌一款包含支付宝、微信捐赠按钮的镜像，可使用iframe嵌入。

## 说明
- 基于 [TinyJay/donate-page](https://github.com/TinyJay/donate-page) 进行修改。
- 使用翻转卡片样式，仅保留支付宝和微信二维码。
- 对CSS进行了修改和适配。
- 点击连接查看 [Dockerfile](https://github.com/kimi360/Docker-Donate/blob/main/Dockerfile)。

##  使用
###  二维码制作
- 截图支付宝、微信收款码。
- 上传 [草料二维码](https://cli.im/) 识别码内容。
- 重新生成二维码并美化。
- 下载二维码为 `png` 格式。

###  快速开始
    docker run -d \
        --name donate \
        --restart unless-stopped \
        -p 80:80 \
        -v ~/AliPayQR.png:/web/images/AliPayQR.png \
        -v ~/WeChatQR.png:/web/images/WeChatQR.png \
        kimi360/donate:latest

###  Docker-compose
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

###  iframe引用
> 使用 `iframe` 嵌入页面的代码，高度至少 `240px`，宽度至少 `310px`！

    <iframe src="https://guoyanjun.top/donate-page/sample1/index.html" style="overflow-x:hidden;overflow-y:hidden; border:0xp none #fff; min-height:240px; width:100%;"  frameborder="0" scrolling="no"></iframe>


##  效果
![AriaNg](https://raw.githubusercontent.com/kimi360/Docker-Donate/main/screenshots/donate.webp)

##  演示
- [演示站点](https://donate.kimi360.top/)

##  引用
- [TinyJay/donate-page](https://github.com/TinyJay/donate-page)
- [emikulic/darkhttpd](https://github.com/emikulic/darkhttpd)

##  协议
[MIT](https://github.com/kimi360/Docker-Donate/blob/main/LICENSE)

##  感谢您的支持
<table>
  <tr>
    <td><img src="https://github.com/kimi360/Docker-Donate/raw/main/web/images/AliPayQR.png"></img></td>
    <td><img src="https://github.com/kimi360/Docker-Donate/raw/main/web/images/WeChatQR.png"></img></td>
  </tr>
  <tr>
    <td align="center"><b>支付宝</b></td>
    <td align="center"><b>微信</b></td>
  </tr>
</table>
