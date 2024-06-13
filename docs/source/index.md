### 开机远程登陆和挂载nfs：

```shell
sshpass -p orangepi ssh orangepi@orangepi.local
#sudo apt install nfs-common
sudo mount -t nfs -o nolock 192.168.0.100:/home/luowei/workspace/nfs ~/nfs
orangepi
```

### 连接wifi:

```shell
nmcli device wifi connect "xxx" password "xxx"
nmcli device wifi connect "xiaomiwifi" password "12345678"

如果同时连接了有线和无线，如何让无线优先上网：
将wlan0的metric改小，要比route命令下看到的有线的metric要小
sudo vim /etc/network/interfaces:
auto wlan0
iface wlan0 inet dhcp
    metric 50

重启网络：
sudo systemctl restart networking
```

### 配置nfs和Avahi服务:



### ubuntu20.04安装ROS：

```shell
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

sudo apt update
#安装ros完整版，等待数分钟完成
sudo apt install ros-noetic-desktop-full

echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
```

### 配置多机通信：

开发板上修改~/.bashrc：

```shell
vim ~/.bashrc

HOST_IP=$(hostname -I | awk '{print $1}')
export ROS_IP=$HOST_IP
export ROS_HOSTNAME=$HOST_IP
export ROS_MASTER_URI=http://$HOST_IP:11311

:wq
source ~/.bashrc

注意电脑上的ROS_IP和ROS_HOSTNAME是和机器人同一个WIFI局域网的本机地址，ROS_MASTER_URI是机器人WIFI地址
```

### 安装常用的ROS包：

```shell
#安装导航规划相关的包
sudo apt install -y ros-noetic-teleop-twist-keyboard
sudo apt install -y ros-noetic-move-base-msgs
sudo apt install -y ros-noetic-move-base
sudo apt install -y ros-noetic-map-server
sudo apt install -y ros-noetic-base-local-planner
sudo apt install -y ros-noetic-dwa-local-planner
sudo apt install -y ros-noetic-teb-local-planner
sudo apt install -y ros-noetic-global-planner

sudo apt install -y ros-noetic-gmapping
sudo apt install -y ros-noetic-amcl

#以上ros包可一次性安装：
sudo apt install -y ros-noetic-teleop-twist-keyboard ros-noetic-move-base-msgs ros-noetic-move-base ros-noetic-map-server ros-noetic-base-local-planner ros-noetic-dwa-local-planner ros-noetic-teb-local-planner ros-noetic-global-planner ros-noetic-gmapping ros-noetic-amcl

#安装EAI YDLidar库
cd ~/nfs/newbot/newbot_ws
cd src/ydlidar/YDLidar-SDK
mkdir build
cd build
cmake ..
make -j
sudo make install

#配置spi使能
sudo orangepi-config
#配置流程：System => Hardware => 开启spi3 uart2 uart9 => Save,Back,Reboot
#在弹出的界面中打开spi和串口选项,具体参考官方用户手册，然后重启
```

### 安装常用的python包：

```shell
sudo apt install -y python3-pip
pip config set global.index-url https://pypi.mirrors.ustc.edu.cn/simple

pip install -U pip

sudo apt-get install -y python3-websocket python3-pyaudio libsox-fmt-mp3 libatlas-base-dev espeak sox

pip install opencv-python

pip install pulsectl
pip install baidu-aip
pip install edge_tts
pip install pyttsx3
pip install pyzbar

pip install gpio
pip install python-periphery
pip install pyserial

pip install sherpa_onnx

#这两个命令查看默认设备，前面有星号的代表默认：
pacmd list-sinks | grep -e 'index:' -e 'name:'
pacmd list-sources | grep -e 'index:' -e 'name:'
#如果列表里根本没有USB设备，可以尝试重新安装pulseaudio，可能重装两遍才行
sudo apt remove pulseaudio
sudo apt install pulseaudio
sudo apt remove pulseaudio
sudo apt install pulseaudio
#设置默认扬声器：
pacmd set-default-sink n
#设置默认麦克风为usb设备：
pacmd set-default-source n
#把这里的n替换成实际的值:
pacmd set-default-sink 1
pacmd set-default-source 1

#设置USB麦克风的捕获强度，注意：这个会影响采集的录音的幅度，必须设置到100%！！！
amixer -c 2 sset Mic 100%

#设置音量
pactl set-sink-volume 1 100%
```

### 常见问题及解决方法：

```shell
#扬声器在数据传输或者运行程序时杂音很大
#解决方法：加粗电源线，并且注意功放电路的地线要用耳机出来的地线

#报错：
play test.mp3
#play WARN alsa: can't encode 0-bit Unknown or not applicable
#play FAIL formats: no handler for file extension `mp3'
#解决方法：
export AUDIODRIVER=alsa

#报错：
play test.mp3
#play FAIL formats: no handler for file extension `mp3'
#解决方法：
sudo apt-get install libsox-fmt-mp3


#解决开启AP之后nmcli dev中wlan0显示unmanaged
#编写脚本wifi.sh：
echo "orangepi" | sudo -S create_ap --fix-unmanaged #这句作用相当于关闭AP
sleep 5 #等待进入station模式
nmcli device wifi connect "ChinaNet-461" password "ziroom461" #连接家庭WIFI
reboot && echo orangepi | sudo -S watchdog_test 1 #重启以让ROS IP生效
#后台运行脚本：
bash wifi.sh &

echo "orangepi" | sudo -S create_ap --fix-unmanaged && sleep 3 && nmcli device wifi connect "ChinaNet-461" password "ziroom461" && reboot && echo orangepi | sudo -S watchdog_test 1 &

#ssh连接如果加上了-X选项可用于qv4l2可视化查看图像，但注意录音功能和调节音量功能会失效
#问题：Connection failure: Connection refused
#pa_context_connect() failed: Connection refused
#解决：ssh不要加-X


#问题:libcblas.so.3: cannot open shared object file: No such file or directory
#解决：
sudo apt-get install libatlas-base-dev

#问题调用pyttsx3报错：
#OSError: libespeak.so.1: cannot open shared object file: No such file or directory
#解决：
sudo apt-get install espeak
```

