<template>
    <!-- 顶部导航 -->
    <div class="navigation">
        <ul style="list-style:none">
            <li style="float: left">
                <a>
                    <i class="el-icon-location-outline"></i>
                    <span>武汉</span>
                </a>
            </li>
            <li v-if="!user">
                <span class="loginSpan"><router-link to="/login">你好，请登录  </router-link><router-link to="/register"><span>免费注册</span></router-link></span>
            </li>
            <li v-else>
                <span class="loginSpan">欢迎您，{{user.name}},<a href="javascript:;" @click="exit">退出登录</a></span>
            </li>
            <li class="spacer"></li>
            <li><router-link to="/order">我的订单</router-link></li>
            <li class="spacer"></li>
            <li><router-link to="/account">我的钱包</router-link></li>
        </ul>
    </div>
</template>

<script>
import { mapMutations, mapState } from 'vuex'
export default {
    name: 'Navigation',
    computed: {
        //user模块带有命名空间
        ...mapState('user',{
            //将this.user映射为this.$store.state.user.user  因为定义变量名称相同，可简写成 ['user']
            user: 'user'
        }),
    },
    methods: {
        exit(){
            this.deleteUser();
            sessionStorage.removeItem("user");
        },
        ...mapMutations('user',['deleteUser'])  //将this.deleteUser映射为this.$store.state.commit('user/deleteUser')
    }
}
</script>


<style scoped>
.navigation{    
    position: relative;
    background-color: #2c3e50;
    padding: 0 10%;
    height: 48px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.08);
    display: flex;
    align-items: center;
}
.navigation ul {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100%;
    margin: 0;
    padding: 0;
}
li {
    margin: 0 24px;
    display: flex;
    align-items: center;
    height: 48px;
}
li > a, .loginSpan {
    font-size: 15px;
    color: #ecf0f1;
    text-decoration: none;
    display: flex;
    align-items: center;
    height: 48px;
    transition: color 0.3s;
    cursor: pointer;
}
.loginSpan > a, .loginSpan > span {
    color: #ecf0f1;
    margin: 0 4px;
    text-decoration: none;
    transition: color 0.3s;
}
.loginSpan > a:hover, .loginSpan > span:hover, li > a:hover {
    color: #3498db;
}
li.spacer {
    width: 1px;
    height: 24px;
    background-color: #34495e;
    margin: 0 12px;
    align-self: center;
}
.link-regist{
    color: #e74c3c;
}
</style> 