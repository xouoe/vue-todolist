<template>
   <div class="todo-footer" v-if="todos.length">
        <label>
            <input type="checkbox" v-model="isall"/>
        </label>
        <span >
            <span>全選</span><br>  <span>已完成{{Amountdone}}項</span> /<span>全部{{todos.length}}項</span>
        </span>
        <button class="btn btn-danger" @click="deleteDone(todos.id)">清除已勾選事務</button>
    </div>
</template>

<script>
export default {
    name:'UserFooter', 
    props:['todos','AllCheck','DeleteAlltodo'],
    computed:{
      Amountdone(){
        return this.todos.reduce((pre,current)=> pre + (current.done ? 1 : 0),0)
      },
      isall:{
        get(){
          return this.Amountdone === this.todos.length && this.Amountdone > 0
        },
        set(value){
          this.$bus.$emit('AllCheck',value)
        }
        
      }
    },
    methods:{
      deleteDone(id){
          this.$bus.$emit('DeleteAlltodo',id)
        }
    }
}

</script>

<style scoped>
.todo-footer {
  height: 40px;
  line-height: 40px;
  padding-left: 6px;
  margin-top: 5px;
}

.todo-footer label {
  display: inline-block;
  cursor: pointer;
}

.todo-footer label input {
  position: relative;
  top: -1px;
  vertical-align: middle;
  margin-right: 5px;
}

.todo-footer button {
  float: right;
  margin-top: 5px;
}

</style>