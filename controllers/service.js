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
   getHADM_ID: function (subjectID) {
       console.log(subjectID);
        let _sql = `select SUBJECT_ID,HADM_ID from ADMISSIONS where SUBJECT_ID=?;`
        return allServices.query(_sql,[subjectID])
    },
   getAllSubject:function(){
    let _sql = `select SUBJECT_ID from PATIENTS`
    return allServices.query(_sql)
   }
    
}

module.exports = allServices;