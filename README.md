# 快速开始
## 1.安装Node环境
[下载地址](https://nodejs.org/zh-cn/)
## 2.检查安装是否成功
    npm -v
显示node的版本信息即可
## 3.进入项目目录

## 4.安装依赖(安装一次即可)
    npm install
## 5.运行项目
    npm run start
## 6.使用接口  
注意，必须在校园网环境下才可使用！  
以获取某个用户的所有labEvents为例：  
接口：http://localhost:3000/labEvents 

| 参数 | 含义 | 必填 |
| ------ | ------ | ------ |
| subjectID | 病人的ID | 是 |
| hadmID | 此病人的住院ID | 否 |

在浏览器中访问  
http://localhost:3000/labEvents?subjectID=222&hadmID=103002  
获取222号病人的第103002次（所用病人混合编号，不是从0开始）住院信息的labEvents

## 接口列表

### /patient-info
获取病人的基本信息
| 参数 | 含义 | 必填 |
| ------ | ------ | ------ |
| subjectID | 病人的ID | 是 |
  
### /admissions
病人的就诊信息
| 参数 | 含义 | 必填 |
| ------ | ------ | ------ |
| subjectID | 病人的ID | 是 |

### /admissions
病人的就诊信息
| 参数 | 含义 | 必填 |
| ------ | ------ | ------ |
| subjectID | 病人的ID | 是 |

### /prescriptions
病人用药信息
| 参数 | 含义 | 必填 |
| ------ | ------ | ------ |
| subjectID | 病人的ID | 是 |

### /labEvents
病人的化验信息
| 参数 | 含义 | 必填 |
| ------ | ------ | ------ |
| subjectID | 病人的ID | 是 |
| hadmID | 此病人的住院ID | 否 |

### /chartEvents
病人的chart event信息
| 参数 | 含义 | 必填 |
| ------ | ------ | ------ |
| subjectID | 病人的ID | 是 |
| hadmID | 此病人的住院ID | 否 |