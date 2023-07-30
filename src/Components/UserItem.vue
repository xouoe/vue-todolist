<template>
    <div>
        <li>
              <label>
                <input type="checkbox" :checked="todoItem.done" @change="handleCheck(todoItem.id)"/>
                <span v-show="!todoItem.isEdit">{{todoItem.item}}</span>
                <input type="text" :value="todoItem.item"  v-show="todoItem.isEdit" @blur="handleblur(todoItem,$event)" ref="focusItem">
              </label>
              <button class="btn btn-danger" @click="handleDelete(todoItem.id)">刪除</button>
              <button class="btn btn-edit" @click="handleisEdit(todoItem)" v-show="!todoItem.isEdit" >編輯</button>
        </li>
    </div>
</template>

<script>

export default {
    name:'UserItem',
    props:['todoItem'],
    methods:{
      handleCheck(id){
        this.$bus.$emit('Checktodo',id)
      },
      handleDelete(id){
        this.$bus.$emit('Deletetodo',id)
      },
      handleisEdit(todoItem){
        if(todoItem.hasOwnProperty('isEdit')){
          todoItem.isEdit = true
        }else{
          this.$set(todoItem,'isEdit',true)
        }
        this.$nextTick((todoItem)=>{
            this.$refs.focusItem.focus()
        })
      },
      handleblur(todoItem,e){
          todoItem.isEdit = false
          if(!e.target.value.trim()) return
          else{
          this.$bus.$emit('Updatetodo',todoItem.id,e.target.value)
          }
      }
    },
    computed:{
        
    }
}

</script>

<style scoped>
li {
  list-style: none;
  height: 36px;
  line-height: 36px;
  padding: 0 5px;
}
li:hover{
  background: rgba(0,0,0,.3);
}
li label {
  float: left;
  cursor: pointer;
}

li label li input {
  vertical-align: middle;
  margin-right: 6px;
  position: relative;
  top: -1px;
}

li button {
  float: right;
  display: none;
  margin-top: 3px;
}
li:hover button{
  display: block;
}
li:before {
  content: initial;
}

li:last-child {
  border-bottom: none;
}

</style>