<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>开始使用layui</title>
  <link rel="stylesheet" href="assert\layui\css\layui.css">
</head>
<body>
      <form class="layui-form" lay-filter="form_stu">
  <div class="layui-form-item">
    <label class="layui-form-label">角色名称</label>
    <div class="layui-input-block">
      <input type="text" name="roleName" required  lay-verify="required|checkrolename" placeholder="请输入角色名称" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">角色编号</label>
    <div class="layui-input-block">
      <input type="text" name="roleCode" required  lay-verify="required" placeholder="请输入角色编号" autocomplete="off" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">选择框</label>
    <div class="layui-input-block">
  <select name="roleKind" lay-verify="required">
  <option value="">请选择一个角色类型</option>
  <option value="1">超级角色</option>
  <option value="0">普通角色</option>
 
</select>
</div> 
</div> 
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">角色简介</label>
    <div class="layui-input-block">
      <textarea name="roleInfo" placeholder="请输入内容" class="layui-textarea"></textarea>
    </div>
  </div>
  
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>
<!-- 
按模块开发
layui.all.js全部加载模块
layui.js按需加载模块
 -->
<script src="assert\layui\layui.js"></script>
 <!--书写自己的脚本-->
<script>
//一般直接写在一个js文件中
layui.use(['layer', 'form'], function(){
  var layer = layui.layer;
  var form = layui.form;
  var $=layui.$;
 
  
  
  
  form.verify({
	  checkrolename: function(value, item){ //value：表单的值、item：表单的DOM对象
	    var msg;
	    $.ajax({
	    	type :'get',
	    	async:false,
	    	url: 'role/checkname',
	    	data: {'roleName':value},
	    	success:function(result){
	    		if(result==0)
	    		{
	    			msg="此名称已有人使用";
	    		}
	    	}
	    
	    });
	    return msg;
	    
	    
	  }
	  
	  
	});      
  
//监听提交
  form.on('submit(formDemo)', function(data){
	  
	 var formData=$(data.form).serialize();
	 console.log(formData);
    $.ajax({
    	type :'post',
    	url: 'role',
    	data: formData,
    	success:function(result){
    		if(result){
    		layer.msg('提交成功！！');
    		$(data.form)[0].reset();
    		}
    	}
    
    });
    return false;
  });
 
});
</script> 
</body>

</html>