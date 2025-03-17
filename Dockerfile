# 使用官方的 OpenJDK 17 镜像作为基础镜像
FROM registry.cn-hangzhou.aliyuncs.com/lycodeing/maven-jdk17-arm64:v20241110

# 设置工作目录
WORKDIR /app

# copy target 目录下的 jar 文件到工作目录
COPY target/jenkins-demo-0.0.1.jar /app/app.jar


# 暴露应用程序运行所需的端口（根据实际情况修改）
EXPOSE 8080

# 运行打包后的 JAR 文件
ENTRYPOINT ["java", "-jar", "/app/app.jar"]