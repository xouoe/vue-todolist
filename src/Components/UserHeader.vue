<template>
   <div class="todo-header">
      <div class="title">
        <h1>To do list</h1>
      </div>
      <input type="text" placeholder="請增加你的事項(按Enter)" v-model="input" @keyup.enter="Add"/> 
   </div>
</template>

<script>

export default {
    name:'UserHeader',
    data(){
      return{
        input:''
      }
    },
    methods:{
      Add(){
        if(this.input.trim()){
          const todotxt = {id:Math.random(),item:this.input,done:false}
          this.$bus.$emit('Addtodo',todotxt)
          this.input = ''
        }
        else{
          alert('不能輸入空值')
        }
        
      }
    }   
}
</script>

<style scoped>
body {
  background: #fff;
}

.btn {
  display: inline-block;
  padding: 4px 12px;
  margin-bottom: 0;
  font-size: 14px;
  line-height: 20px;
  text-align: center;
  vertical-align: middle;
  cursor: pointer;
  box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
  border-radius: 4px;
}

.btn-danger {
  color: #fff;
  background-color: #da4f49;
  border: 1px solid #bd362f;
}

.btn-danger:hover {
  color: #fff;
  background-color: #bd362f;
}

.btn:focus {
  outline: none;
}
.todo-header .title{
  text-align: center;
}
.todo-header input {
  width: 560px;
  height: 28px;
  font-size: 14px;
  border: 1px solid #ccc;
  border-radius: 4px;
  padding: 4px 7px;
}
.todo-header input:focus {
  outline: none;
  border-color: rgba(82, 168, 236, 0.8);
  box-shadow:0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(82, 168, 236, 0.6);
}

</style>