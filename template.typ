#set text(size: 12pt,font:("simsun"))

#align(center)[
  #v(6em)
  #[#set text(size: 30pt)
  物理实验预习报告]
  
  #v(7em)
  #[#set text(size: 17pt)
  实验名称： #underline(" " * 25)
  
  指导教师： #underline(" " * 25)
  ]

  #v(5em)
  #[#set text(size: 15pt)
  班级： #underline(" " * 30)
  
  姓名： #underline(" " * 30)
  
  学号： #underline(" " * 30)

  #v(3em)
  实验日期： #underline(" " * 5)年 #underline(" " * 2) 月 #underline(" " * 2) 日 #h(1em)星期 #underline(" " * 2) 上/下午
  
  #v(3em)
  浙江大学物理实验教学中心
  ]
]

#v(2em)

#pagebreak()

#[#set text(font:("simhei"))
= 一、预习报告
]
$space$（注：将已经写好的“物理实验预习报告”内容拷贝过来）

== 1. 实验综述

$space$（自述实验现象、实验原理和实验方法，不超过300字，5分）

#v(1em)
#table(
  columns: (auto, auto),
  align: left,
  stroke: none,
  [实验原理：],
  [直流双臂电桥是一种高精度测量低阻的仪器，主要用于测量导体材料电阻、分流电阻、低值线圈等。普通的两端法测量会受到导线接触电阻的影响，而采用四端接入法，附加电阻相对待测电阻的位置会被“转移”，从而不会改变待测电阻的阻值。],
)

#grid(
  columns: (auto,auto),
  image("./images/experiment1.png",width: 8cm),
  image("./images/experiment2.png", width: 8cm)
)

#table(
  columns: (auto, auto),
  align: left,
  stroke: none,
  [实验现象：],
  [在实验过程中，当电桥达到平衡时，电流计指针指向零，此时可通过电桥的比率臂及标准电阻计算待测电阻值。实验中还涉及温度对电阻率的影响，利用温度控制装置观察金属电阻随温度变化的关系。],
) 


== 2. 实验重点
（简述本实验的学习重点，不超过100字，3分）

#[
  #set enum(numbering: "(1)")
  + 双臂电桥测量低电阻的原理与使用方法。
  + 单臂电桥和双臂电桥的关系和区别。
  + 双臂电桥测量低电阻时能够消除或大大减小附加电阻对测量结果的影响的原因。
]

#v(2em)

== 3. 实验难点
（简述本实验的实现难点，不超过100字，2分）

......
#v(8em)

#pagebreak()

#[#set text(font:("simhei"))
= 二、原始数据
]
（将有老师签名的“自备数据记录草稿纸”的扫描或手机拍摄图粘贴在下方，20分）

#v(1em)
#image("./images/datas.png", width: 100%)
#pagebreak()

#[#set text(font:("simhei"))
= 三、结果与分析
]

== 1.数据处理与结果
$space$（列出数据表格、选择数据处理方法、给定测量或计算结果，30分）

#[#set align(center)
#table(
  columns: (auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,auto),
  align: center,
  [次数],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],
  [升温 $t \/ ℃$],[13.2],[17.6],[22.5],[27.7],[32.7],[37.7],[42.9],[47.9],[52.8],[57.9],
  [电阻 $R \/ 10^(-4)Omega$],[46.2],[46.9],[47.8],[48.7],[49.6],[50.5],[51.4],[52.3],[53.2],[54.1]
)
]

#image("./images/电阻温度拟合.png")


== 2．误差分析
$space$（运用测量误差、相对误差、不确定度等分析实验结果，20分）

(这里是随便写的公式)
#v(1em)

$ f(x)=sum_(k=1)^n product_(j!=k) (x-x_j)/(x_k-x_j)f(x_k) $

$ I_1 R_1+I_2 R_2=I_3 R_3+I_4 R_x => R_x=(I_1 R_1+I_2 R_2-I_3 R_3)/I_4 $

== 3.实验探讨
$space$（对实验内容、现象和过程的小结，不超过100字，10分）

#pagebreak()

#[#set text(font:("simhei"))
= 四、思考题
]

#v(35em)

#[#set text(font:("fangsong"))
注意事项：

+ 用#[#set text(font: "Times New Roman")
WORD]或#[#set text(font: "Times New Roman")
WPS]格式上传“实验报告”，文件名：学生姓名+学号+实验名称+周次。
+ “实验报告”必须递交在“学在浙大”的本课程的对应实验项目的“作业”模块内。
+ “实验报告”成绩必须在“浙江大学物理实验教学中心网站”-“选课系统”内查询。
+ 教学评价必须在“浙江大学物理实验教学中心网站”-“选课系统”内进行，学生必须进行教学评价，才能看到实验报告成绩，教学评价必须在本次实验结束后3天内进行。
+ “普通物理学实验Ⅰ”和“物理学实验Ⅰ”都用本实验报告。

#v(2em)

#[
  #set align(center)
  浙江大学物理实验教学中心制
]
]
