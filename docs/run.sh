#!/bin/bash

# 创建主目录
mkdir -p ros_robot_user_manual

# 进入主目录
cd ros_robot_user_manual

# 创建主 index.rst 文件
cat <<EOL > index.rst
机器人使用说明书
================

欢迎使用我们的机器人！本说明书将帮助您快速上手并充分利用机器人的功能。

目录
----

.. toctree::
   :maxdepth: 2
   :caption: 目录

   安装与配置 <installation>
   快速入门 <quickstart>
   操作指南 <operation>
   常见问题 <faq>
   技术支持 <support>

安装与配置
-----------

在这一部分，我们将介绍如何安装和配置您的机器人，包括必要的软件和硬件要求。

.. toctree::
   :maxdepth: 1

   安装步骤 <installation/steps>
   系统要求 <installation/requirements>
   配置文件 <installation/configuration>

快速入门
-------

通过这部分内容，您可以快速了解机器人基本功能，并进行一些简单的任务操作。

.. toctree::
   :maxdepth: 1

   启动机器人 <quickstart/startup>
   基本命令 <quickstart/commands>
   初始任务 <quickstart/tasks>

操作指南
--------

详细的操作指南，涵盖了机器人的高级功能和各种操作模式。

.. toctree::
   :maxdepth: 1

   移动控制 <operation/movement>
   感知系统 <operation/sensing>
   通信接口 <operation/communication>

常见问题
--------

在这里，我们列出了一些常见问题及其解决办法，以帮助您排除可能遇到的问题。

.. toctree::
   :maxdepth: 1

   故障排除 <faq/troubleshooting>
   软件问题 <faq/software_issues>
   硬件问题 <faq/hardware_issues>

技术支持
--------

如果您需要额外的帮助，或者有任何疑问，请联系我们的技术支持团队。

.. toctree::
   :maxdepth: 1

   联系方式 <support/contact>
   在线资源 <support/online_resources>

附录
----

本部分包含了附加的信息和参考资料，例如术语表、开发者文档等。

.. toctree::
   :maxdepth: 1

   术语表 <appendix/glossary>
   开发者文档 <appendix/developer_docs>

EOL

# 创建子目录和 .rst 文件
declare -A dirs_files=(
    ["installation"]="steps requirements configuration"
    ["quickstart"]="startup commands tasks"
    ["operation"]="movement sensing communication"
    ["faq"]="troubleshooting software_issues hardware_issues"
    ["support"]="contact online_resources"
    ["appendix"]="glossary developer_docs"
)

for dir in "${!dirs_files[@]}"; do
    mkdir -p "$dir"
    for file in ${dirs_files[$dir]}; do
        touch "$dir/$file.rst"
        echo "$file" > "$dir/$file.rst"
    done
done

echo "所有目录和文件已创建成功。"

# 打印目录结构以确认
tree .

