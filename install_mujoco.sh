#!/bin/bash

# 设置相关变量
INSTALL_DIR="$HOME/MuJoCoBin"
MUJOCO_VER="3.3.0"
FILE_NAME="mujoco-${MUJOCO_VER}-linux-x86_64.tar.gz"

# 默认官方下载链接（需要梯子）
DOWNLOAD_URL="https://github.com/google-deepmind/mujoco/releases/download/${MUJOCO_VER}/${FILE_NAME}"
# 如果在国内服务器上没有梯子，可以将上一行注释掉，取消下面这行的注释使用镜像加速：
# DOWNLOAD_URL="https://ghproxy.cn/https://github.com/google-deepmind/mujoco/releases/download/${MUJOCO_VER}/${FILE_NAME}"

echo ">>> 开始配置 MuJoCo 环境..."

# 1. 创建并进入目录
echo ">>> 创建安装目录: $INSTALL_DIR"
mkdir -p "$INSTALL_DIR"
cd "$INSTALL_DIR" || { echo "进入目录失败"; exit 1; }

# 2. 下载并解压
if [ ! -f "$FILE_NAME" ]; then
    echo ">>> 正在下载 MuJoCo ${MUJOCO_VER}..."
    wget -c "$DOWNLOAD_URL"
else
    echo ">>> 安装包已存在，跳过下载。"
fi

echo ">>> 正在解压..."
tar -xzf "$FILE_NAME"

# [新增功能] 3. 解压完成后删除安装包
echo ">>> 正在清理下载的压缩包以释放空间..."
rm -f "$FILE_NAME"

# 4. 自动配置环境变量
BIN_PATH="$INSTALL_DIR/mujoco-${MUJOCO_VER}/bin"

# 检查环境变量是否已经添加，防止重复添加
if ! grep -q "$BIN_PATH" ~/.bashrc; then
    echo ">>> 正在将路径加入 ~/.bashrc 环境变量..."
    echo "" >> ~/.bashrc
    echo "# MuJoCo environment" >> ~/.bashrc
    echo "export PATH=\"\$PATH:$BIN_PATH\"" >> ~/.bashrc
else
    echo ">>> 环境变量已存在，跳过添加。"
fi

echo ""
echo "========================================================="
echo "MuJoCo ${MUJOCO_VER} 安装与配置完成！(已清理安装压缩包)"
echo "========================================================="
echo "请手动执行以下命令以刷新环境变量："
echo "    source ~/.bashrc"
echo ""
echo "之后你可以运行以下命令来测试模拟器："
echo "    simulate $INSTALL_DIR/mujoco-${MUJOCO_VER}/model/humanoid/humanoid.xml"
echo "========================================================="
