const router = require('koa-router')()
const userService = require('../controllers/service');


// router.prefix('/users')
//获取所有用户(GET请求)
router.get('/', async (ctx, next) => {
  ctx.body = await userService.getAllSubject();
  // ctx.body = await userService.findAllUser();
})

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

module.exports = router
