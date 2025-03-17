#!/bin/bash

ALIYUN_REGISTRY="registry.cn-hangzhou.aliyuncs.com"
NAMESPACE="lycodeing"
# 镜像仓库名称，默认为 jenkins
REPO_NAME="jenkins"
# 镜像标签，默认为当前时间戳
IMAGE_TAG=$(date +%Y%m%d%H%M%S)
# Dockerfile所在目录，默认是当前目录
DOCKERFILE_PATH="."



# 登录阿里云容器镜像服务
echo "正在登录阿里云容器镜像服务..."
docker login --username=lycodeing --password=liyan.99 ${ALIYUN_REGISTRY}

# 构建 Docker 镜像
IMAGE_FULL_NAME="${ALIYUN_REGISTRY}/${NAMESPACE}/${REPO_NAME}:${IMAGE_TAG}"
echo "开始构建 Docker 镜像 ${IMAGE_FULL_NAME}..."
docker build -t ${IMAGE_FULL_NAME} ${DOCKERFILE_PATH}

# 推送 Docker 镜像到阿里云容器镜像服务
echo "开始推送 Docker 镜像到阿里云容器镜像服务..."
docker push ${IMAGE_FULL_NAME}

# 检查推送是否成功
if [ $? -eq 0 ]; then
    echo "镜像推送成功！"
else
    echo "镜像推送失败，请检查错误日志。"
fi
