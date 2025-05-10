<template>
    <div class="category">
        <ul>
            <li v-for="category in categories" :key="category.id">
                <router-link :to="'/kind/'+category.id">{{category.name}}</router-link>
            </li>
        </ul>
    </div>
</template>

<script>
export default {
    name: 'HeaderCategory',
    data(){
        return{
            categories: []
        }
    },
    // 在created生命周期钩子中向服务端请求所有分类数据
    created(){  
        this.axios.get('/kind')
        .then(response => {
            if(response.status === 200){
                this.categories = response.data.data;
            }
        })
        .catch(error => alert(error));
    }
}
</script>

<style scoped>
.category {
    float: left;
    width: 380px;
    height: 24px;
    font-size: 15px;
    overflow: hidden;
    margin-top: 0px;
    margin-bottom: 6px;
}
.category a{
    text-decoration: none;
    padding: 0 8px;
    color: #3498db;
    font-weight: bold;
    transition: color 0.2s, text-decoration 0.2s;
}
.category a:hover {
    color: #217dbb;
    text-decoration: underline;
}
li{
    float: left;
    list-style: none;
}
a{
    text-decoration: none;
}
</style> 