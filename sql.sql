use MIMIC3;
DROP TABLE IF EXISTS `ADMISSIONS`;
CREATE TABLE `ADMISSIONS` (
    `ROW_ID` int(255) DEFAULT NULL,
    `SUBJECT_ID` int(255) DEFAULT NULL,
    `HADM_ID` int(255) DEFAULT NULL,
    `ADMITTIME` DATETIME DEFAULT NULL,
    `DISCHTIME` DATETIME DEFAULT NULL,
    `DEATHTIME` DATETIME DEFAULT NULL,
    `ADMISSION_TYPE` varchar(255) DEFAULT NULL,
    `ADMISSION_LOCATION` varchar(255) DEFAULT NULL,
    `DISCHARGE_LOCATION` varchar(255) DEFAULT NULL,
    `INSURANCE` varchar(255) DEFAULT NULL,
    `LANGUAGE` varchar(255) DEFAULT NULL,
    `RELIGION` varchar(255) DEFAULT NULL,
    `MARITAL_STATUS` varchar(255) DEFAULT NULL,
    `ETHNICITY` varchar(255) DEFAULT NULL,
    `EDREGTIME` DATETIME DEFAULT NULL,
    `EDOUTTIME` DATETIME DEFAULT NULL,
    `DIAGNOSIS` text DEFAULT NULL,
    `HOSPITAL_EXPIRE_FLAG` int(255) DEFAULT NULL,
    `HAS_CHARTEVENTS_DATA` int(255) DEFAULT NULL,
    INDEX `ADMISSION` (`SUBJECT_ID`,`HADM_ID`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `CHARTEVENTS`;
CREATE TABLE `CHARTEVENTS` (
    `ROW_ID` int(255) DEFAULT NULL,
    `SUBJECT_ID` int(255) DEFAULT NULL,
    `HADM_ID` int(255) DEFAULT NULL,
    `ICUSTAY_ID` int(255) DEFAULT NULL,
    `ITEM_ID` int(255) DEFAULT NULL,
    `CHARTTIME` DATETIME DEFAULT NULL,
    `STORETIME` DATETIME DEFAULT NULL,
    `CGID` int(255) DEFAULT NULL,
    `VALUE` varchar(255) DEFAULT NULL,
    `VALUENUM` int(255) DEFAULT NULL,
    `VALUEUOM` varchar(255) DEFAULT NULL,
    `WARNING` int(255) DEFAULT NULL,
    `ERROR` int(255) DEFAULT NULL,
    `RESULTSTATUS` varchar(255) DEFAULT NULL,
    `STOPPED` varchar(255) DEFAULT NULL,
    INDEX `CHART` (`SUBJECT_ID`,`HADM_ID`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `D_ICD_DIAGNOSES`;
CREATE TABLE `D_ICD_DIAGNOSES` (
    `ROW_ID` int(255) DEFAULT NULL,
    `ICD9_CODE` varchar(255) DEFAULT NULL,
    `SHORT_TITLE` varchar(255) DEFAULT NULL,
    `LONG_TITLE` varchar(255) DEFAULT NULL,
    INDEX `ICD9_CODE` (`ICD9_CODE`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `D_ICD_PROCEDURES`;
CREATE TABLE `D_ICD_PROCEDURES` (
    `ROW_ID` int(255) DEFAULT NULL,
    `ICD9_CODE` varchar(255) DEFAULT NULL,
    `SHORT_TITLE` varchar(255) DEFAULT NULL,
    `LONG_TITLE` varchar(255) DEFAULT NULL,
    INDEX `ICD9_CODE` (`ICD9_CODE`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `D_ITEMS`;
CREATE TABLE `D_ITEMS` (
    `ROW_ID` int(255) DEFAULT NULL,
    `ITEMID` int(255) DEFAULT NULL,
    `LABEL` varchar(255) DEFAULT NULL,
    `ABBREVIATION` varchar(255) DEFAULT NULL,
    `DBSOURCE` varchar(255) DEFAULT NULL,
    `LINKSTO` varchar(255) DEFAULT NULL,
    `CATEGORY` varchar(255) DEFAULT NULL,
    `UNITNAME` varchar(255) DEFAULT NULL,
    `PARAM_TYPE` varchar(255) DEFAULT NULL,
    `CONCEPTID` int(255) DEFAULT NULL,
    INDEX `ITEMID` (`ITEMID`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `D_LABITEMS`;
CREATE TABLE `D_LABITEMS` (
    `ROW_ID` int(255) DEFAULT NULL,
    `ITEMID` int(255) DEFAULT NULL,
    `LABEL` varchar(255) DEFAULT NULL,
    `FLUID` varchar(255) DEFAULT NULL,
    `CATEGORY` varchar(255) DEFAULT NULL,
    `LOINC_CODE` varchar(255) DEFAULT NULL,
    INDEX `ITEMID` (`ITEMID`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `DIAGNOSES_ICD`;
CREATE TABLE `DIAGNOSES_ICD` (
    `ROW_ID` int(255) DEFAULT NULL,
    `SUBJECT_ID` int(255) DEFAULT NULL,
    `HADM_ID` int(255) DEFAULT NULL,
    `SEQ_NUM` int(255) DEFAULT NULL,
    `ICD9_CODE` varchar(255) DEFAULT NULL,
    INDEX `DIAGNOSES_ICD` (`SUBJECT_ID`, `HADM_ID`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `LABEVENTS`;
CREATE TABLE `LABEVENTS` (
    `ROW_ID` int(255) DEFAULT NULL,
    `SUBJECT_ID` int(255) DEFAULT NULL,
    `HADM_ID` int(255) DEFAULT NULL,
    `ITEMID` int(255) DEFAULT NULL,
    `CHARTTIME` DATETIME DEFAULT NULL,
    `VALUE` varchar(200) DEFAULT NULL,
    `VALUENUM`	float DEFAULT NULL,
    `VALUEUOM` varchar(20) DEFAULT NULL,
    `FLAG` varchar(20) DEFAULT NULL,
    INDEX `LABEVENT` (`SUBJECT_ID`, `HADM_ID`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `PROCEDURES_ICD`;
CREATE TABLE `PROCEDURES_ICD` (
    `ROW_ID` int(255) NOT NULL,
    `SUBJECT_ID` int(255) NOT NULL,
    `HADM_ID` int(255) NOT NULL,
    `SEQ_NUM` int(255) DEFAULT NULL,
    `ICD9_CODE`	VARCHAR(10) DEFAULT NULL,
    INDEX `SUBJECT_ID` (`SUBJECT_ID` , `HADM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `PRESCRIPTIONS`;
CREATE TABLE `PRESCRIPTIONS` (
    `ROW_ID` int(255) DEFAULT NULL,
    `SUBJECT_ID` int(255) DEFAULT NULL,
    `HADM_ID` int(255) DEFAULT NULL,
    `ICUSTAY_ID` int(255) DEFAULT NULL,
    `STARTDATE`	DATETIME DEFAULT NULL,
    `ENDDATE`	DATETIME DEFAULT NULL,
    `DRUG_TYPE`	VARCHAR(100) DEFAULT NULL,
    `DRUG`	VARCHAR(100) DEFAULT NULL,
    `DRUG_NAME_POE`	VARCHAR(100) DEFAULT NULL,
    `DRUG_NAME_GENERIC`	VARCHAR(100) DEFAULT NULL,
    `FORMULARY_DRUG_CD`	VARCHAR(120) DEFAULT NULL,
    `GSN`	VARCHAR(200) DEFAULT NULL,
    `NDC`	VARCHAR(120) DEFAULT NULL,
    `PROD_STRENGTH`	VARCHAR(120) DEFAULT NULL,
    `DOSE_VAL_RX`	VARCHAR(120) DEFAULT NULL,
    `DOSE_UNIT_RX`	VARCHAR(120) DEFAULT NULL,
    `FORM_VAL_DISP`	VARCHAR(120) DEFAULT NULL,
    `FORM_UNIT_DISP`	VARCHAR(120) DEFAULT NULL,
    `ROUTE`	VARCHAR(120) DEFAULT NULL,
    INDEX `SUBJECT_ID` (`SUBJECT_ID` , `HADM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `PATIENTS`;
CREATE TABLE `PATIENTS` (
    `ROW_ID` int(255) DEFAULT NULL,
    `SUBJECT_ID` int(255) DEFAULT NULL,
    `GENDER` VARCHAR(5) DEFAULT NULL,
    `DOB` DATETIME DEFAULT NULL,
    `DOD` DATETIME DEFAULT NULL,
    `DOD_HOSP` DATETIME DEFAULT NULL,
    `DOD_SSN` DATETIME DEFAULT NULL,
    `EXPIRE_FLAG` VARCHAR(5) DEFAULT NULL,
    INDEX `SUBJECT_ID` (`SUBJECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `NOTEEVENTS`;
CREATE TABLE `NOTEEVENTS` (
    `ROW_ID` int(255) DEFAULT NULL,
    `SUBJECT_ID` int(255) DEFAULT NULL,
    `HADM_ID` int(255) DEFAULT NULL,
    `CHARTDATE`	DATETIME DEFAULT NULL,
    `CHARTTIME`	DATETIME DEFAULT NULL,
    `STORETIME`	DATETIME DEFAULT NULL,
    `CATEGORY` VARCHAR(50) DEFAULT NULL,
    `DESCRIPTION` VARCHAR(300) DEFAULT NULL,
    `CGID` int(255) DEFAULT NULL,
    `ISERROR` CHAR(1) DEFAULT NULL,
    `TEXT` TEXT DEFAULT NULL,
    INDEX `SUBJECT_ID` (`SUBJECT_ID` , `HADM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `MICROBIOLOGYEVENTS`;
CREATE TABLE `MICROBIOLOGYEVENTS` (
    `ROW_ID` int(255) DEFAULT NULL,
    `SUBJECT_ID` int(255) DEFAULT NULL,
    `HADM_ID` int(255) DEFAULT NULL,
    `CHARTDATE`	DATETIME DEFAULT NULL,
    `CHARTTIME`	DATETIME DEFAULT NULL,
    `SPEC_ITEMID` int(255) DEFAULT NULL,
    `SPEC_TYPE_DESC` VARCHAR(100) DEFAULT NULL,
    `ORG_ITEMID` int(255) DEFAULT NULL,
    `ORG_NAME` VARCHAR(100) DEFAULT NULL,
    `ISOLATE_NUM` SMALLINT(255) DEFAULT NULL,
    `AB_ITEMID` int(255) DEFAULT NULL,
    `AB_NAME` VARCHAR(30) DEFAULT NULL,
    `DILUTION_TEXT` VARCHAR(10) DEFAULT NULL,
    `DILUTION_COMPARISON` VARCHAR(20) DEFAULT NULL,
    `DILUTION_VALUE` DOUBLE DEFAULT NULL,
    `INTERPRETATION` VARCHAR(5) DEFAULT NULL,
    INDEX `SUBJECT_ID` (`SUBJECT_ID` , `HADM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

load data local infile '/home/bz/Ybw/MIMIC3/mimic-iii-clinical-database-1.4/CHARTEVENTS/part18'
into table CHARTEVENTS  
fields terminated by "," optionally
enclosed by '"' escaped by '"'  lines terminated by "\n";


mysql -uroot --local-infile -p

