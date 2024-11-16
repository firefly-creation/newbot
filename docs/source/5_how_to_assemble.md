# 一、接口线序

## 1.40Pin接口

| 引脚定义      | 接线定义                               | 引脚定义  | 接线定义                  |
| ------------- | -------------------------------------- | --------- | ------------------------- |
| 3.3V          |                                        | 5V        |                           |
| SDA.2         |                                        | **5V**    | 5V 红色（香橙派电源）     |
| SCL.2         |                                        | **GND**   | GND 黑色（香橙派地线）    |
| PWM15         |                                        | **TXD.2** | RX1红色（香橙派串口发送） |
| GND           |                                        | **RXD.2** | TX1黑色（香橙派串口接收） |
| GPIO3_C6      |                                        | GPIO3_C7  |                           |
| **GPIO4_A0**  | D/C 黑色（液晶屏命令/数据切换）        | GND       |                           |
| **TXD.7**     | RES 红色（液晶屏复位）                 | RXD.7     |                           |
| **3.3V**      | VCC 白色（液晶屏电源）                 | GPIO4_A1  |                           |
| **SPI3_MOSI** | MOSI 金黄色（液晶屏数据）              | GND       |                           |
| **SPI3_MISO** | NC 不接                                | TXD.9     |                           |
| **SPI3_CLK**  | CLK 绿色（液晶屏时钟）                 | SPI3_CS0  |                           |
| **GND**       | GND 蓝色（液晶屏地线）                 | SPI3_CS1  |                           |
| SDA.3         |                                        | SCL.3     |                           |
| **RXD.9**     | RX 黑色（雷达数据）                    | GND       |                           |
| **GPIO3_D4**  | CTL 绿色（雷达控制，M1C1雷达此线无效） | PWM11     |                           |
| GPIO3_D7      |                                        | GND       |                           |
| GPIO3_D0      |                                        | GPIO3_D5  |                           |
| GPIO3_D3      |                                        | GPIO3_D2  |                           |
| GND           |                                        | GPIO3_D1  |                           |



## 2.控制板接口

![pcb](imgs/pcb.png)

如上图，左侧的SP、HP、MC分别代表扬声器、耳机、离线语音芯片的麦克风接口；

右侧的5V GND RX1 TX1是香橙派的供电和串口通信接口；

下侧的接口1：5V RX0 TX0 GND，离线语音的烧录接口，点击烧录按钮之后，再接入5V或者重启5V开始烧录（烧录时5V可不接，由电池提供）；

下侧的接口2：- 5V，雷达电源，这里的负极不是直接和GND连通的，需要通过STM32的PB4引脚控制MOS管接通或者断开；

下侧的接口3：G VB，电池输入，连接电池板上的接口；

下侧的接口4：3V3 IO CLK GND，STM32的烧录接口，可以直接烧录，不用断电重启（烧录时3.3V可不接，由电池提供）。



## 3.激光雷达接口

如果电机朝下，从左到右依次是红线、黑线、金黄线、绿线

| 引脚定义 | 功能描述                                                     |
| -------- | ------------------------------------------------------------ |
| 5V       | 红线，5V电源                                                 |
| TX       | 黑线，雷达串口数据线                                         |
| GND      | 金黄线，地线                                                 |
| CTL      | 绿线，雷达转速控制，电压或PWM越高转速越快（对于M1C1雷达来说此线无效或是RX） |



# 二、下壳组装

以下为v1.0外壳组装步骤，v1.1的屏幕和摄像头固定方式略有不同，根据v1.1实际情况组装

1.先给下壳安装**螺母**（下壳12颗螺母，12颗螺丝）

![c2e3d0d0-0d50-4984-8bc1-d24b5ff58f5d_thumb](assemble_imgs/clip_image002.jpg)

2.准备好电机轮子（2套**电机**+**轮子**+**ZH1.5 6P线**）

![d3afee0f-5e15-4376-b43b-38a8ff2ca790_thumb](assemble_imgs/clip_image004.jpg)

3.将电机轮子安装在底盘上，加上**电机固定件**，拧紧**螺丝**

![7680481f-0b57-4a97-a6d0-ae6f36a189bc_thumb](assemble_imgs/clip_image006.jpg)

4.安装**万向轮**，用万向轮自带的螺丝拧紧

![d161d063-7038-47f0-852d-c4e0a6a63fc8_thumb](assemble_imgs/clip_image008.jpg)

5.在**底盘驱动板**背面焊接缺失的**XR2981电源芯片**（加热台焊接）

![0003fa8f-3c01-4e65-93f3-9a6d86f13696_thumb](assemble_imgs/clip_image010.jpg)

6.背面焊接**开关**和**指示灯**（烙铁焊接）

![c9ce6b94-e362-426a-9f62-5255a5954e69_thumb](assemble_imgs/clip_image012.jpg)

7.正面依次焊接**CI-03T离线语音芯片**，3个**1.25mm 2P插座**，2个**1.5mm 6P插座**，2个**XH254 2P插座**，1个**XH254 4P插座**（烙铁焊接）

![dd8aaa3b-be25-4845-9c33-7d71e5113778_thumb](assemble_imgs/clip_image014.jpg)

8.背面安装两个**弹簧探针**，用套筒拧紧**防松螺母**

![894ff8b2-2e7a-48a6-8728-2c3015d84ee4_thumb](assemble_imgs/clip_image016.jpg)

9.将底盘驱动板安装在底盘上，并且接好电机线

![1561aef6-98d4-41e9-9f4c-331783bc3d12_thumb](assemble_imgs/clip_image018.jpg)

10.将**喇叭**的胶布撕下，粘贴在底盘前部

![e5672a14-8d08-41fc-8517-029b84f6befc_thumb](assemble_imgs/clip_image020.jpg)

11.将**电池座盒**和**XH254插座**焊接到**电池板**上（加热台和烙铁焊接）

![4dfe636f-63b3-4f63-bc60-44317d6f1908_thumb](assemble_imgs/clip_image022.jpg)

12.将**电池**安装在电池座里

![e38ffedb-f86a-4050-a4ed-26c48ab31535_thumb](assemble_imgs/clip_image024.jpg)

13.将电池板固定在底盘上，用螺丝拧紧

![41688c8a-5765-428c-aff9-212bcb3159ba_thumb](assemble_imgs/clip_image026.jpg)

14.先将**32GB EMMC**安装在**香橙派**上，将**散热片**粘贴到CPU上，用四颗**5mm长度自攻螺丝**固定开发板，用两颗**10mm长度自攻螺丝**固定**风扇**，并连接风扇接线

![c4051d3c-4a9e-4c92-801a-70b1212666c9_thumb](assemble_imgs/clip_image028.jpg)

14.根据如下线序制作**耳机线**，先剪掉左声道的接头，只焊接右声道（红线）和地线（黑线），然后安装好**耳机头外壳**

![9806cc9e-e82f-4126-9515-273ef7527172_thumb](assemble_imgs/clip_image030.jpg)

15.将耳机头插在开发板上，注意从左侧缝隙顺出喇叭线，耳机线分别连接到SP，HP接口上，用三颗螺丝固定好开发板

![3386aea6-7624-4826-8898-84ce79c944cd_thumb](assemble_imgs/clip_image032.jpg)

16.连接好**咪头麦克风**，**USB麦克风模块**，开发板**电源线**，**电池连接线**

![5275bb22-3706-4618-921e-05e670ef9639_thumb](assemble_imgs/clip_image034.jpg)

至此，下壳组装完成



# 三、上壳组装

1.在上壳安装好12颗螺母（要用12颗螺丝）

![edf9a6a4-a4e3-486e-8306-976e6d0b0d04_thumb](assemble_imgs/clip_image036.jpg)

2.在**屏幕**上焊接**屏幕接线**，并且在FPC上粘贴黑色胶布防止漏光

![9dba9215-586b-48de-8956-37f865fef82f_thumb](assemble_imgs/clip_image040.jpg)

3.安装屏幕

![9d874941-266c-418c-b7da-a14e7d10d16c_thumb](assemble_imgs/clip_image042.jpg)

4.在**USB连接板**上焊接**USB接口**和**1mm插座**（加热台+烙铁焊接）

![9cb6e7cb-848d-4baf-8bfe-2607e4441b4d_thumb](assemble_imgs/clip_image044.jpg)

5.将**广角镜头**替换到**USB模组**上，并且光线传感器的两个引脚短接（烙铁焊接）

![c18904f8-2b16-4d58-ad8b-bfc6c987c364_thumb](assemble_imgs/clip_image046.jpg)

6.用**10cm长度线**将USB连接板和相机模组连接好，安装在上壳上，注意这里用10cm长度线应该就足够

![b1b327ae-bcf3-4023-9fb2-65e56c4fb46f_thumb](assemble_imgs/clip_image048.jpg)

7.用4颗螺丝固定好屏幕支架（注意用小螺丝刀）

![d8e5347f-0d25-4ee7-ae7e-3a0cd3aebf05_thumb](assemble_imgs/clip_image050.jpg)

8.制作如下线序的**雷达转接线**

![17c7c516-a2e9-47e1-ac83-f45aef7c4071_thumb](assemble_imgs/clip_image052.jpg)

9.将转接线安装在**雷达**上

![11f7d60e-5287-487d-a0ea-8b70caa72177_thumb](assemble_imgs/clip_image054.jpg)

10.将雷达安装在上壳上，加上**3个垫片**，用3个螺丝固定

![34ec9463-0e9c-4be2-be6e-faceb39eb65a_thumb](assemble_imgs/clip_image056.jpg)

11.将USB线，雷达电源线，雷达信号线，屏幕线连接到底盘上

![c5ad7e62-353b-409a-ac73-e005d435a2ee_thumb](assemble_imgs/clip_image058.jpg)

12.整理好接线，扣上外壳，注意内部线不要在左侧漏出影响美观，扣不住不要使劲压，防止外壳变形，扣好后用底部5颗螺丝固定

![e5921161-a49c-4221-ae1e-4a796c9cf565_thumb](assemble_imgs/clip_image060.jpg)

至此，全部组装完成



# 四、烧录工具

**STM32烧录器**、**USB串口模块**、**小螺丝刀**、**4根杜邦线装**

![clip_image061](assemble_imgs/clip_image061.jpg)

