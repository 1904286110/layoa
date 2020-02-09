<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <title>upload模块快速使用</title>
  <link rel="stylesheet" href="assert\layui\css\layui.css">
</head>
<body>
    学生头像： <button type="button" class="layui-btn" id="test1">
  <i class="layui-icon">&#xe67c;</i>上传图片
</button>
<input type="hidden" id="stuImg" name="stuImg"/>
<input type="hidden" id="rowId" name="rowId" value="1"/>
<script src="assert\layui\layui.js"></script>
<script>
layui.use(['upload'], function(){
  var upload = layui.upload;
  var $=layui.$;
  //执行实例
  var uploadInst = upload.render({
    elem: '#test1' //绑定元素
    ,url: 'upload/' //上传接口
    ,field:'uploadFile'
    ,done: function(res){
    	console.log(res.data);
    	$("#stuImg").val(res.data);
      //上传完毕回调
    }
    ,data:{'id':function(){
    	return $("#rowId").val();
    }}
    ,error: function(){
      //请求异常回调
    }
  });
});
</script>
</body>
</html>