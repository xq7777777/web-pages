<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>欢迎登录图书管理系统</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <link rel="shortcut icon" href="../favicon.ico">
  <link rel="stylesheet" href="./styles/common.css">
  <link rel="stylesheet" href="./styles/login1.css">
  <link rel="stylesheet" href="https://at.alicdn.com/t/font_2143783_iq6z4ey5vu.css">
</head>

<body>
  <!-- 登录头部 -->
  <div class="xtx-login-header">
    <!-- <h1 class="logo"></h1>
    <a class="home" href="./index.html">进入网站首页</a> -->
  </div>
  <!-- 登录内容 -->
  <div class="xtx-login-main">
    <div class="wrapper">
      <form action="" autocomplete="off">
        <div class="box">
          <div class="tab-nav">
            <a href="javascript:;" class="active" data-id="0">账户登录</a>
            <a href="javascript:;" data-id="1">手机验证码登录</a>
          </div>
          <div class="tab-pane">
            <div class="link">
              <!-- <a href="javascript:;">手机验证码登录</a> -->
            </div> 
            <div class="input">
              <!-- <span class="iconfont icon-zhanghao"></span> -->
              <input  type="text" placeholder="请输入用户名称/手机号码" name="username">
            </div>
            <div class="input">
              <!-- <span class="iconfont icon-suo"></span> -->
              <input  type="password" placeholder="请输入密码" name="password">
            </div>
            <br>
            <div class="select">
                <label>
                    <input type="radio" name="identity" value="A"> 管理员
                    <input type="radio" name="identity" value="B"> 老师
                    <input type="radio" name="identity" value="C"> 学生
                </label>
                
            </div>
            <div class="agree">
              <label for="my-checkbox">
                <input type="checkbox" value="1" id="my-checkbox" class="remember" name="agree">
                <span class="iconfont icon-xuanze"></span>
              </label>
              我已同意 <a href="javascript:;">《服务条款》</a href="javascript:;"> 
            </div>
            <div class="button clearfix">
              <button type="submit" class="dl">登 录</button>
              <!-- <a class="dl" href="./center.html">登 录</a> -->
              <a class="fl" >忘记密码？</a>
              <a class="fr" href="./register1.html">免费注册</a>
            </div>
          </div>
          <div class="tab-pane" style="display: none;">
            <div class="link">
            </div>
            <div class="input">
                <input  type="text" placeholder="请输入手机号码" name="username">
            </div>
            <div class="input">
               <input  type="text" placeholder="请输入验证码" name="code">
               <a class="code" href="javascript:;">发送验证码</a>
            </div>
            <br>
            <div class="select">
                <label>
                    <input type="radio" name="identity" value="A"> 管理员
                    <input type="radio" name="identity" value="B"> 老师
                    <input type="radio" name="identity" value="C"> 学生
                </label>
                
            </div>
            <div class="agree">
                <label for="my-checkbox">
                  <input type="checkbox" value="1" id="my-checkbox" class="remember" name="agree">
                  <span class="iconfont icon-xuanze"></span>
                </label>
                我已同意 <a href="javascript:;">《服务条款》</a href="javascript:;"> 
              </div>
              <div class="button clearfix">
                <button type="submit" class="dl">登 录</button>
                <a class="fl" >忘记密码？</a>
              <a class="fr" href="./register1.html">免费注册</a>
            </div>
          </div>

            <!-- <img class="code" src="./images/code.png" alt=""> -->
          </div>
        </div>
      </form>
    </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
  <script>
     (function () {
      // 1. 发送短信验证码模块
      const code = document.querySelector('.code')
      let flag = true  // 通过一个变量来控制   节流阀 
      //  1.1 点击事件
      code.addEventListener('click', function () {
        if (flag) {
          // 取反了，不能马上第二次点击
          flag = false
          let i = 60
          // 点击完毕之后立马触发
          code.innerHTML = `${i}秒后重新获取`
          // 开启定时器
          let timerId = setInterval(function () {
            i--
            code.innerHTML = `${i}秒后重新获取`
            if (i === 0) {
              // 清除定时器
              clearInterval(timerId)
              // 从新获取
              code.innerHTML = `重新获取`
              // 到时间了，可以开启 flag了
              flag = true
            }
          }, 1000)
        }
      })
    })();
    // 1. tab栏切换  事件委托
    const tab_nav = document.querySelector('.tab-nav')
    const pane = document.querySelectorAll('.tab-pane')
    // 1.1 事件监听
    tab_nav.addEventListener('click', function (e) {
      if (e.target.tagName === 'A') {
        // 取消上一个active
        tab_nav.querySelector('.active').classList.remove('active')
        // 当前元素添加active
        e.target.classList.add('active')

        // 先干掉所有人  for循环
        for (let i = 0; i < pane.length; i++) {
          pane[i].style.display = 'none'
        }
        // 让对应序号的 大pane 显示 
        pane[e.target.dataset.id].style.display = 'block'
      }
    })

    // 点击提交模块
    const form = document.querySelector('form')
    const agree = document.querySelector('[name=agree]')
    const username = document.querySelector('[name=username]')
    const radios = document.querySelectorAll('input[name="identity"]');
    let flag=false
// Check if any are checked
   
    form.addEventListener('submit', function (e) {
      e.preventDefault()
      // 判断是否勾选同意协议
    for (let i = 0; i < radios.length; i++) {
        if (radios[i].checked) {
            flag = true;
             break;
         }
    }
// Show alert if none are checked 
        if (!flag) {
             alert('请选择身份'); 
         }
    
       if (!agree.checked) {
         return alert('请勾选同意协议')
        }
//传输数据
      axios({
          url: '47.113.217.59:8888/api/user/login',
          method: 'POST',
          data:JSON.stringify( {
            userID:"2022302121352",
            password:"050103",
            identity:"A"
          })
       }).then(result => {
          console.log("成功")
          // alert(result.data.message)
      }).catch(error => {
          console.log("失败")
        //  alert(error.response.data.message)
      })
    // if(agree.checked&&flag&&result.data.message==="A"){
    //      // 跳转到首页
    //     location.href = './test.html'
    // }
     
    })
  </script>
</body>

</html>
