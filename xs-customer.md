### 一、修改说明

#### package.json

- 去掉将`husky`设置为`husky.bak`；
- `scripts`里加入`"build:site": "vant-cli build-site",`；

#### vant.config.js

- 设置`publicPath`

#### 其他修改

- 修改.gitignore文件

### 二、构建

#### 1、构建发布版
待研究

#### 2、构建帮助文档
```
cnpm run build:site
```
