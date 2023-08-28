# 基础镜像选择
FROM --platform=linux/amd64 pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime

# 设置工作目录
WORKDIR /app

# 切换至国内的软件源
COPY .devcontainer/sources/sources.list /etc/apt/
COPY .devcontainer/sources/.condarc /etc/conda/
COPY .devcontainer/sources/pip.conf /etc/

# 复制项目文件到工作目录
COPY requirements.txt .

# 安装依赖包
RUN apt-get -y update && apt-get install -y --no-install-recommends git-lfs
RUN pip install --no-cache-dir -r requirements.txt

# 暴露端口（根据你的 Web 服务监听的端口进行修改）
EXPOSE 7860

# 运行命令（根据你的 Web 服务启动命令进行修改）
CMD ["python", "app.py"]
