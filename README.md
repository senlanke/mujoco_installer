# MuJoCo3.3 一键安装、卸载脚本

本项目提供了一个用于在 Linux 系统上快速下载、解压并配置 MuJoCo (3.3.0) 物理引擎的一键安装脚本。


## 安装指南

在任何一台全新的 Linux 机器（或云端服务器）上，无需预先下载文件，只需打开终端并运行以下单行命令，即可全自动完成 MuJoCo 的部署与环境变量配置：

```bash
bash -c "$(curl -fsSL [https://raw.githubusercontent.com/senlanke/mujoco_installer/main/install_mujoco.sh](https://raw.githubusercontent.com/senlanke/mujoco_installer/main/install_mujoco.sh))"
```
验证安装
```bash
source ~/.bashrc
simulate ~/MuJoCoBin/mujoco-3.3.0/model/humanoid/humanoid.xml
```
