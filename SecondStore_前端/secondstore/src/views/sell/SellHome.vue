<template>
    <div class="sellHome">
         <!-- 顶部导航 -->
        <div class="navigation">
        <ul>
            <li>
                <router-link :to="'/shop/shopId/'+sell.id">
                    <i class="el-icon-location-outline"></i>
                    <span>店铺首页</span>
                </router-link>
            </li>
            <li v-if="!sell">
                <span class="loginSpan"><router-link to="/login">你好，请登录  </router-link><router-link to="/sellRegister"><span>免费注册</span></router-link></span>
            </li>
            <li v-else>
                <span class="loginSpan">欢迎您，{{sell.name}},<a href="javascript:;" @click="exit">退出登录</a></span>
            </li>
            <li class="spacer"></li>
            <li><router-link to="/shop/order">我的订单</router-link></li>
            <li class="spacer"></li>
            <li><router-link to="/shop/info">我的信息</router-link></li>
        </ul>
    </div> 
    <router-view/>
    </div>
</template>
<script>
import { mapMutations, mapState } from 'vuex'
export default {
    name: "SellHome",
    computed:{
        ...mapState('user',{
            sell: 'sell'
        })
    },
    watch:{
        sell(val){
            if(val==null){
                this.$router.push("/login")
            }
        }
    },
     methods: {
        exit(){
            this.deleteSell();
            sessionStorage.removeItem("sell");
        },
        ...mapMutations('user',['deleteSell'])  //将this.deleteUser映射为this.$store.state.commit('user/deleteUser')
    }
}
</script>

<style scoped>
.sellHome{
    min-height: 100vh;
}
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