var mysql = require('mysql');
var config = require('./defaultConfig');

var pool = mysql.createPool({
    host: config.database.HOST,
    user: config.database.USERNAME,
    password: config.database.PASSWORD,
    database: config.database.DATABASE
});

let allServices = {
    query: function (sql, values) {

        return new Promise((resolve, reject) => {
            pool.getConnection(function (err, connection) {
                if (err) {
                    reject(err)
                } else {
                    connection.query(sql, values, (err, rows) => {
                        if (err) {
                            reject(err)
                        } else {
                            resolve(rows)
                        }
                        connection.release()
                    })
                }
            })
        })

    },
    getAllSubject:function(){
        let _sql = `select SUBJECT_ID from PATIENTS`
        return allServices.query(_sql)
    },
    /*
    getHADM_ID: function (subjectID) {
        console.log(subjectID);
        let _sql = `select SUBJECT_ID,HADM_ID from ADMISSIONS where SUBJECT_ID=?;`
        return allServices.query(_sql,[subjectID])
    },
    */
    getPatientInfo: function (subjectID) {
        let _sql = `select SUBJECT_ID,GENDER,DOB from PATIENTS where SUBJECT_ID=?;`
        return allServices.query(_sql,[subjectID])
    },
    getAdmissions: function (subjectID) {
        let _sql = `select SUBJECT_ID,HADM_ID,ADMITTIME,DISCHTIME from ADMISSIONS where SUBJECT_ID=?;`
        return allServices.query(_sql,[subjectID])
    },
    getPrescriptions: function (subjectID) {
        let _sql = `select SUBJECT_ID,HADM_ID,STARTDATE,ENDDATE,DRUG,GSN,PROD_STRENGTH,DOSE_VAL_RX,DOSE_UNIT_RX from PRESCRIPTIONS where SUBJECT_ID=?;`
        return allServices.query(_sql,[subjectID])
    },
    getLabEvents: function ({subjectID, hadmID}){
        let _sql = `select * from LABEVENTS where SUBJECT_ID=?`
        if(typeof hadmID === 'number') _sql += ' and HADM_ID=?'
        return allServices.query(_sql,[subjectID,hadmID])
    },
    getChartEvents:function ({subjectID, hadmID}){
        let _sql = `select * from CHARTEVENTS inner join D_ITEMS on CHARTEVENTS.ITEM_ID = D_ITEMS.ITEMID where SUBJECT_ID=?`
        if(typeof hadmID === 'number') _sql += ' and HADM_ID=?'
        return allServices.query(_sql,[subjectID,hadmID]) 
    },
    getAlarmItem: function (){
        let _sql = `select * from D_ITEMS`
        return allServices.query(_sql,[]) 
    }
}

module.exports = allServices;