#!/bin/bash

# 设置与安装时相同的变量
INSTALL_DIR="$HOME/MuJoCoBin"
MUJOCO_VER="3.3.0"
BIN_PATH="$INSTALL_DIR/mujoco-${MUJOCO_VER}/bin"

echo ">>> 开始卸载 MuJoCo ${MUJOCO_VER}..."

# 1. 删除安装目录和文件
if [ -d "$INSTALL_DIR" ]; then
    echo ">>> 正在删除安装目录及其所有内容: $INSTALL_DIR"
    rm -rf "$INSTALL_DIR"
    echo ">>> 文件删除完成。"
else
    echo ">>> 未找到安装目录 $INSTALL_DIR，可能已经被删除。"
fi

# 2. 清理 ~/.bashrc 中的环境变量
echo ">>> 正在清理 ~/.bashrc 中的环境变量配置..."

# 检查是否存在相关配置
if grep -q "$BIN_PATH" ~/.bashrc || grep -q "# MuJoCo environment" ~/.bashrc; then
    # 备份原有的 bashrc 防止意外
    cp ~/.bashrc ~/.bashrc.bak
    echo ">>> 已备份原文件至 ~/.bashrc.bak"

    # 使用 sed 删除相关的注释行和环境变量行
    sed -i '/# MuJoCo environment/d' ~/.bashrc
    sed -i "\|export PATH=\"\$PATH:$BIN_PATH\"|d" ~/.bashrc
    
    echo ">>> 环境变量清理完成。"
else
    echo ">>> ~/.bashrc 中未发现 MuJoCo 的相关配置，无需清理。"
fi

echo ""
echo "========================================================="
echo "🗑️ MuJoCo ${MUJOCO_VER} 卸载清理完成！"
echo "========================================================="
echo "⚠️ 请手动执行以下命令以刷新当前终端，或者直接关闭并重新打开终端："
echo "    source ~/.bashrc"
echo "========================================================="
