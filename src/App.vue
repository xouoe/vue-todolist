<template>
 <div id="app">
      <div class="todo-container">
        <div class="todo-wrap">
         <UserHeader />
         <UserList :todos="todos"/>
         <UserFooter :todos="todos"/>
        </div>
      </div>
</div>
</template>

<script>
import UserHeader from './Components/UserHeader'
import UserFooter from './Components/UserFooter'
import UserList from './Components/UserList'
export default {
    data(){
      return{
        todos:JSON.parse(localStorage.getItem('todos')) || []
      }
    },
    methods:{
      Addtodo(e){    
          this.todos.push(e)
      },
      Deletetodo(id){
          this.todos = this.todos.filter((todo)=>{
              return todo.id != id
          })
      },
      Edittodo(id,item){
        this.todos.forEach((todo)=>{
          if(todo.id == id) todo.item = item
        })
      },
      Checktodo(id){
        this.todos.forEach((todo)=>{
          if(todo.id == id) {
            todo.done = !todo.done
          }
        })
      },
      AllCheck(done){
          this.todos.forEach((todo)=>{
            todo.done = done
          })
      },
      DeleteAlltodo(){
        this.todos = this.todos.filter((todo)=>{
              return !todo.done
        })
      }
    },
    watch:{ 
      todos:{
        deep:true,
        handler(value){
          localStorage.setItem('todos',JSON.stringify(value))
        }
      }
    },
    mounted(){
        this.$bus.$on('Checktodo',this.Checktodo)
        this.$bus.$on('Deletetodo',this.Deletetodo)
        this.$bus.$on('Updatetodo',this.Edittodo)
        this.$bus.$on('Addtodo',this.Addtodo)
        this.$bus.$on('DeleteAlltodo',this.DeleteAlltodo)
        this.$bus.$on('AllCheck',this.AllCheck)
    },
    beforeDestroy() {
        this.$bus.$off('Checktodo')
        this.$bus.$off('Deletetodo')
        this.$bus.$off('Updatetodo')
        this.$bus.$off('Addtodo')
        this.$bus.$off('AllCheck')
    },
    components:{
      UserHeader,
      UserList,
      UserFooter
    },

  }
</script>
<style>

.btn {
  display: inline-block;
  padding: 4px 12px;
  margin-bottom: 0;
  font-size: 14px;
  line-height: 20px;
  text-align: center;
  vertical-align: middle;
  cursor: pointer;
  box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, .05);
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
.btn-edit {
  color: #fff;
  background-color:#FFA600;
  border: 1px solid #d7961d;
  margin-right: 5px;
}
.btn-edit:hover {
  color: #fff;
  background-color: #d7961d;
}
.btn:focus {
  outline: none;
}
#app{
  display: flex;
  height: 60vh;
  align-items: center;
}
.todo-container {
  width: 600px;
  margin: auto;
  display: flex;
  justify-content: center;
  background: rgba(255,255,255,.8);
  padding: 40px;
  box-shadow: 5px 5px 20px #4A4A4A;
}

.todo-container .todo-wrap {
  padding: 10px;
  border-radius: 5px;
}
html,body{
  background-image: url('../public/assets/dark.jpg');
  background-size: 100% 100%;
  height: 100vh;
  font-family: 'ZCOOL XiaoWei', sans-serif;
  font-size: 30px;
}
</style>