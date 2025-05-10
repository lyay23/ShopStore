<template>
  <div class="register">
    <div class="register-logo">
      <img src="@/assets/logo.png" alt="logo" />
    </div>
    <el-form :model="form" status-icon :rules="rules" ref="form" label-width="100px" class="demo-form">
       <el-form-item label="用户名" prop="name">
        <el-input type="text" v-model="form.name" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="密码" prop="password">
        <el-input type="password" v-model="form.password" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="确认密码" prop="checkPass">
        <el-input type="password" v-model="form.checkPass" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="电话" prop="phone">
        <el-input type="tel" v-model="form.phone" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="邮箱" prop="email">
        <el-input type="email" v-model="form.email" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="城市" prop="city">
        <el-input type="text" v-model="form.city" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="性别" prop="sex">
        <el-radio-group v-model="form.sex">
          <el-radio label="0">男</el-radio>
          <el-radio label="1">女</el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item label="银行卡号" prop="card">
        <el-input type="tel" v-model="form.card" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="验证码" prop="imageValid">
        <el-input type="text" v-model="form.imageValid"></el-input>
        <canvas ref="canvas" id="canvas" width="120" height="40" @click="updateCanvas()"></canvas>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="register('form')">提交</el-button>
        <el-button @click="resetForm('form')">重置</el-button>
      </el-form-item>
    </el-form>
    <div class="toMerchantRegister"><router-link to="/sellRegister">&gt;商家注册</router-link></div>
  </div>
</template>

<script>
export default {
  name: "UserRegister",
  data() {
     var validatePass = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入密码'));
        } else {
          if (this.form.checkPass !== '') {
            this.$refs.form.validateField('checkPass');
          }
          callback();
        }
      };
      var validatePass2 = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请再次输入密码'));
        } else if (value !== this.form.password) {
          callback(new Error('两次输入密码不一致!'));
        } else {
          callback();
        }
      };
      var validatePass3 = (rule, value, callback) => {
        if(value === ''){
          callback(new Error('验证码不能为空'));
        }else if(value !== this.num){
          this.updateCanvas();
          callback(new Error('验证码输入有误'));
        }else{
          callback();
        }
      }
    return {
      form:{
        name: null,
        password: null,
        checkPass: null,
        phone: null,
        email: null,
        city: null,
        sex: null,
        card: null,
        imageValid: null  //用户输入的验证码
      },  
      num: "", //图片中的随机验证码
      rules: {
        name: [
          {required: true, message: '请输入用户名', trigger: 'blur'}
        ],
        password: [
          { validator: validatePass, trigger: 'blur' }
        ],
        checkPass: [
          { validator: validatePass2, trigger: 'blur' }
        ],
        phone: [
          {required:true, message:"请输入电话", trigger: 'blur'},
          {min:11,max:11, message:"电话号码格式不正确", trigger: 'blur'}
        ],
        imageValid: [
          {validator: validatePass3, trigger: 'blur'}
        ],
        email:[{required:true, message:"请输入邮箱地址", trigger: 'blur'}],
        city:[{required:true, message:"请输入城市地址", trigger: 'blur'}],
        card: [
          {required:true, message:"请输入银行卡号", trigger: 'blur'},
          {min:16,max:16, message:"银行卡号格式不正确", trigger: 'blur'}
        ],
      }
    };
  },

  methods: {
    //重置表单
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },

    //提交注册
    register(formName) {
      this.$refs[formName].validate((valid) => {   //表单验证
        if (!valid) {
           return;
        }
        else{
          this.axios.post("/user/register", this.form)
          .then(response => {
            if(response.data.code === 0){
              this.$message({
                message:"注册成功！",
                type:"success"
              });
              this.resetForm('form');
              this.$router.replace("/login");
            }else{
              this.resetForm('form');
              this.$message("该用户名已被注册！");
            }
          })
          .catch(error => {
            alert(error.message)
          })
        }
      });
    },

    
    // 随机颜色函数
    getColor() {
        var r = Math.floor(Math.random() * 256);
        var g = Math.floor(Math.random() * 256);
        var b = Math.floor(Math.random() * 256);
        return "rgb(" + r + "," + g + "," + b + ")";
    },
    draw() {
        var context = this.$refs.canvas.getContext("2d");//舞台，getContext() 方法可返回一个对象，该对象提供了用于在画布上绘图的方法和属性。
        context.strokeRect(0, 0, 120, 40);//绘制矩形（无填充）
        var aCode = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"];
        // 绘制字母
        var arr = [] //定义一个数组用来接收产生的随机数
        for (var i = 0; i < 4; i++) {
            let x = 20 + i * 20;//每个字母之间间隔20
            let y = 20 + 10 * Math.random();//y轴方向位置为20-30随机
            var index = Math.floor(Math.random() * aCode.length);//随机索引值
            var txt = aCode[index];
            context.font = "bold 20px 微软雅黑";//设置或返回文本内容的当前字体属性
            context.fillStyle=this.getColor;//设置或返回用于填充绘画的颜色、渐变或模式，随机
            context.translate(x,y);//重新映射画布上的 (0,0) 位置，字母不可以旋转移动，所以移动容器
            var deg=90*Math.random()*Math.PI/180;//0-90度随机旋转
            context.rotate(deg);//  旋转当前绘图
            context.fillText(txt, 0, 0);//在画布上绘制"被填充的"文本
            context.rotate(-deg);//将画布旋转回初始状态
            context.translate(-x,-y);//将画布移动回初始状态
            arr[i] = txt //接收产生的随机数
        }
        this.num = arr[0] + arr[1] + arr[2] + arr[3] //将产生的验证码放入num
        // 绘制干扰线条
        for (let i = 0; i < 8; i++) {
            context.beginPath();//起始一条路径，或重置当前路径
            context.moveTo(Math.random() * 120, Math.random() * 40);//把路径移动到画布中的随机点，不创建线条
            context.lineTo(Math.random() * 120, Math.random() * 40);//添加一个新点，然后在画布中创建从该点到最后指定点的线条
            context.strokeStyle=this.getColor();//随机线条颜色
            context.stroke();//  绘制已定义的路径
        }
        // 绘制干扰点，和上述步骤一样，此处用长度为1的线代替点
        for (let i = 0; i < 20; i++) {
            context.beginPath();
            let x = Math.random() * 120;
            let y = Math.random() * 40;
            context.moveTo(x, y);
            context.lineTo(x + 1, y + 1);
            context.strokeStyle=this.getColor();
            context.stroke();
        }
    }, 
    //更新验证码
    updateCanvas(){
      var context = this.$refs.canvas.getContext("2d");
       context.clearRect(0, 0, 120, 40);//在给定的矩形内清除指定的像素
       this.draw();
       console.log(this.num);
    }
  },
  mounted(){
    this.draw()
  }
};
</script>

<style>
.register {
  margin: 0 auto;
  padding: 2em 0;
  width: 500px;
  background-color: #f9f9f9;
  border-radius: 8px; 
  box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

.register-logo {
  text-align: center;
  margin-bottom: 20px;
}

.register-logo img {
  height: 48px;
  width: auto;
}

.el-form {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.el-form-item {
  width: 90%;
  max-width: 400px;
}

.el-input__inner, .el-radio-group, .el-input {
  width: 100% !important;
  box-sizing: border-box;
}

.el-form-item__content {
  display: flex;
  align-items: center;
}

.imageVaild{
  position:relative;
}

canvas{
  position: absolute;
  top: 0;
  right: 0;
}
.toMerchantRegister {
  position: relative;
  text-align: right;
  margin-top: 10px;
}
.toMerchantRegister a {
  display: inline-block;
  padding: 6px 18px;
  background: linear-gradient(90deg, #f9d423 0%, #ff4e50 100%);
  color: #fff !important;
  border-radius: 20px;
  font-weight: bold;
  font-size: 15px;
  text-decoration: none;
  box-shadow: 0 2px 8px rgba(255,78,80,0.08);
  transition: background 0.3s, color 0.3s;
}
.toMerchantRegister a:hover {
  background: linear-gradient(90deg, #ff4e50 0%, #f9d423 100%);
  color: #fff;
}
.el-form-item .el-button, .el-form-item button, .el-form-item input[type="submit"] {
  min-width: 100px;
  padding: 10px 28px;
  border-radius: 22px;
  font-size: 16px;
  font-weight: bold;
  background: linear-gradient(90deg, #f9d423 0%, #ff4e50 100%);
  color: #fff;
  border: none;
  box-shadow: 0 2px 8px rgba(255,78,80,0.08);
  transition: background 0.3s, color 0.3s, box-shadow 0.3s;
  margin-right: 16px;
}
.el-form-item .el-button:hover, .el-form-item button:hover, .el-form-item input[type="submit"]:hover {
  background: linear-gradient(90deg, #ff4e50 0%, #f9d423 100%);
  color: #fff;
  box-shadow: 0 4px 16px rgba(255,78,80,0.18);
}
.el-form-item .el-button[type="button"] {
  background: #fff;
  color: #ff4e50;
  border: 1px solid #ff4e50;
  box-shadow: none;
}
.el-form-item .el-button[type="button"]:hover {
  background: #ff4e50;
  color: #fff;
}
</style>