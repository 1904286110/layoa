<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <title>table模块快速使用</title>
<link rel="stylesheet" href="assert\layui\css\layui.css">
</head>
<body>
    <button type="button" class="layui-btn" id="btn_add">新增</button>
    <form class="layui-form" id="form_search">
    <div class="layui-input-inline">
    <label class="layui-form-label">角色名称</label>
    <div class="layui-input-block">
      <input type="text" name="roleName" required   placeholder="请输入角色名称"  class="layui-input">
    </div>
  </div>
  
  <div class="layui-input-inline">
    <label class="layui-form-label">角色编号</label>
    <div class="layui-input-block">
      <input type="text" name="roleCode"    placeholder="请输入角色编号"  class="layui-input">
    </div>
  </div>
  
     <div class="layui-input-inline">
    <label class="layui-form-label">选择框</label>
    <div class="layui-input-block">
  <select name="roleKind" lay-verify="">
  <option value="">请选择一个角色类型</option>
  <option value="1">超级角色</option>
  <option value="0">普通角色</option>
 
</select>
</div> 
</div> 
 
 <div class="layui-input-inline">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="role_search">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
    </form>
   <table id="demo" lay-filter="test"></table>
   <script type="text/html" id="barDemo">
  
  <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
{{#  if(d.roleKind ==1){ }}
  <button type="button" class="layui-btn layui-btn-danger layui-btn-disabled layui-btn-xs">删除</a>
 {{#  } else { }}
 <button type="button" class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
 {{#  } }}
</script>
 <script type="text/html" id="roleKindTpl">
  {{#  if(d.roleKind ==1){ }}
   <span class="layui-badge layui-bg-orange" >超级用户</ span>
  {{#  } else { }}
    <span class="layui-badge layui-bg-cyan">普通用户</span>
  {{#  } }}
</script>
<script src="assert\layui\layui.js"></script>
<script>
layui.use(['table','layer', 'form'], function(){
  var table = layui.table;
  var layer = layui.layer;
  var form = layui.form;
  var $=layui.$;
  
//监听提交
  form.on('submit(role_search)', function(data){
	  var formData = $('#form_search').serialize();
	  console.log(formData);
	  table.reload('demo', {
			page: {
				curr: 1 
			},
			where:formData,

			url: 'role'
		});
    return false;
  });
  
  //第一个实例
  table.render({
    elem: '#demo'
    ,height: 312
    ,url: 'role' //数据接口
    
    ,page: true //开启分页
    ,totalRow: true //开启合计行
    ,cols: [[ //表头
      {field: 'rowId', title: 'ID', width:80, sort: true, fixed: 'left'}
      ,{field: 'roleName', title: '用户名', width:80}
      ,{field: 'roleCode', title: '角色编号', width:177}
      ,{field: 'roleKind', title: '角色类型', width:177,templet: '#roleKindTpl'} 
      ,{field: 'roleInfo', title: '角色简介', width: 177}
      ,{fixed: '',title: '操作', width: 165, align:'center', toolbar: '#barDemo'}
    ]]
  });
  //监听行工具事件
  table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
    var data = obj.data //获得当前行数据
    var layEvent = obj.event; //获得 lay-event 对应的值
    var rowId=data.rowId;
    
    console.log(rowId);
   if(layEvent === 'del'){
	   layer.confirm('真的删除行么', function(index){
	        
	        $.ajax({
	        	type:'delete',
				url:'role/'+rowId,
				success:function(result){
					if(result){
						window.parent.location.reload();
						 layer.close(index);
					        //向服务端发送删除指令
					}
				}
			});
	        
	      });
    } else if(layEvent === 'edit'){
      //layer.msg('修改操作');
	  $.ajax({
			
			 url:'role/'+rowId,
			 
			 success:function(htmlData){
				 layer.open({
					  type: 1, 
					  title: '修改',
					  area: '800px',
					  content: htmlData, 
					 
					  success: function(){
						  form.render(null,'form_add_edit');
						  }
					});
			 }
		 });
    }
  });
  
  $('#btn_add').off('click').on('click',function(){
	  $.ajax({
		     type :'get',
			 url:'role/goadd/',
			 
			 success:function(htmlData){
				 layer.open({
					  type: 1, 
					  title: '新增',
					  area: '800px',
					  content: htmlData, 
					 
					  success: function(){
						  form.render(null,'form_add_edit');
						  }
					});
			 }
		 });
		
	});
 // 
});
</script>
</body>
</html>