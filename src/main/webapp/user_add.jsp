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
    <label class="layui-form-label">学生名称</label>
    <div class="layui-input-block">
      <input type="text" name="stuName" required  lay-verify="required|checkusername" placeholder="请输入学生名称" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">学生年龄</label>
    <div class="layui-input-block">
      <input type="text" name="stuAge" required  lay-verify="required" placeholder="请输入学生年龄" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">学生生日</label>
    <div class="layui-input-block">
      <input type="text" name="stuBirthday" id="stuBirthday" required  lay-verify="required" placeholder="请输入学生生日" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">学生爱好</label>
    <div class="layui-input-block">
      <input type="checkbox" name="stuLikes" value="写作" title="写作">
      <input type="checkbox" name="stuLikes" value="阅读" title="阅读" checked>
      <input type="checkbox" name="stuLikes" value="发呆" title="发呆">
    </div>
  </div> 
 
  <div class="layui-form-item">
    <label class="layui-form-label">学生性别</label>
    <div class="layui-input-block">
      <input type="radio" name="stuSex" value="1" title="男">
      <input type="radio" name="stuSex" value="0" title="女" checked>
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
layui.use(['layer', 'form','laydate'], function(){
  var layer = layui.layer;
  var form = layui.form;
  var $=layui.$;
 var laydate = layui.laydate;
  
  //执行一个laydate实例
  laydate.render({
    elem: '#stuBirthday' //指定元素
  });
  
  form.verify({
	  checkusername: function(value, item){ //value：表单的值、item：表单的DOM对象
	    var msg;
	    $.ajax({
	    	type :'get',
	    	async:false,
	    	url: 'student/checkusername',
	    	data: {'stuName':value},
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
    	url: 'student',
    	data: formData,
    	success:function(result){
    		layer.msg('提交成功！！');
    	}
    
    });
    return false;
  });
 
});
</script> 
</body>

</html>