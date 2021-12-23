const router = require('koa-router')()
const userService = require('../controllers/service');


// router.prefix('/users')
//获取所有用户(GET请求)
router.get('/', async (ctx, next) => {
  ctx.body = await userService.getAllSubject();
  // ctx.body = await userService.findAllUser();
})

/*
router.get('/HADMID', async (ctx, next) => {
  // arr.push(ctx.request.body['name']);
  // arr.push(ctx.request.body['pass']);
  // arr.push(ctx.request.body['auth']);
  const {subjectID} = ctx.query;
  console.log(ctx.query);
  const res = await userService.getHADM_ID(parseInt(subjectID));
  console.log(res);
  ctx.body = res;
})

// 增加用户(POST请求)
router.post('/HADMID', async (ctx, next) => {
  // arr.push(ctx.request.body['name']);
  // arr.push(ctx.request.body['pass']);
  // arr.push(ctx.request.body['auth']);
  const {subjectID} = ctx.request.body;
  const res = await userService.getHADM_ID(subjectID);
  console.log(res);
  ctx.body = res;
})
*/

function format(query) {
  for(const key in query){
    if(query.hasOwnProperty(key) && query[key]){
      query[key] = parseInt(query[key])
    }
  }
  return query;
}
// 病人基本信息
router.get('/patient-info', async (ctx, next) => {
  const {subjectID} = ctx.query;
  console.log(ctx.query);
  const res = await userService.getPatientInfo(parseInt(subjectID));
  console.log(res);
  ctx.body = res;
})

// 病人每次住院信息
router.get('/admissions', async (ctx, next) => {
  const {subjectID} = ctx.query;
  console.log(ctx.query);
  const res = await userService.getAdmissions(parseInt(subjectID));
  console.log(res);
  ctx.body = res;
})

// 病人用药信息
router.get('/prescriptions', async (ctx, next) => {
  const {subjectID} = ctx.query;
  console.log(ctx.query);
  const res = await userService.getPrescriptions(parseInt(subjectID));
  console.log(res);
  ctx.body = res;
})

// 病人化验信息
router.get('/labEvents', async (ctx,next) =>{
  const {subjectID ,hadmID} = ctx.query;
  const res = await userService.getLabEvents(format({subjectID,hadmID}));
  ctx.body = res;
})

// 病人chartEvents
router.get('/chartEvents', async (ctx,next) =>{
  const {subjectID ,hadmID} = ctx.query;
  const res = await userService.getChartEvents(format({subjectID,hadmID}));
  ctx.body = res;
})

// alarm d_item
router.get('/alarmItem', async (ctx,next) =>{
  const res = await userService.getAlarmItem();
  const map = {};
  for(const it of res){
    if(it.CATEGORY && !map[it.CATEGORY]){
      map[it.CATEGORY] = 1
    }
  }
  ctx.body = map;
})

module.exports = router
