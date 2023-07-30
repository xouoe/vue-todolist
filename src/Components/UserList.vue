<template>
  <ul class="todo-main" >
        <UserItem v-for="todoobj in todos" :key="todoobj.id" :todoItem="todoobj" /> 
 </ul>
</template>

<script>
import UserItem from './UserItem';
export default {
   name:'UserList',
   components:{UserItem},
   props:['todos']
}
</script>

<style scoped> 
.todo-main {
  margin-left: 0px;
  border-radius: 2px;
  padding: 0px;
}
</style>