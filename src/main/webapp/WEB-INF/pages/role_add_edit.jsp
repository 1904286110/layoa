<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

      <form class="layui-form" lay-filter="form_add_edit">
  <div class="layui-form-item">
    <label class="layui-form-label">角色名称</label>
    <div class="layui-input-block">
      <input type="text" name="roleName" required  lay-verify="required|checkrolename" placeholder="请输入角色名称" autocomplete="off" class="layui-input" value="${roleEdit.roleName}">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">角色编号</label>
    <div class="layui-input-block">
      <input type="text" name="roleCode" required  lay-verify="required" placeholder="请输入角色编号" autocomplete="off" value="${roleEdit.roleCode}" class="layui-input" >
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">选择框</label>
    <div class="layui-input-block">
  <select name="roleKind" lay-verify="required">
  <option value="">请选择一个角色类型</option>
  <option value="1" ${roleEdit.roleKind==1?'selected':''}>超级角色</option>
  <option value="0" ${roleEdit.roleKind==0?'selected':''}>普通角色</option>
 
</select>
</div> 
</div> 
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">角色简介</label>
    <div class="layui-input-block">
      <textarea name="roleInfo" placeholder="请输入内容" class="layui-textarea" >${roleEdit.roleInfo}</textarea>
    </div>
  </div>
  <input type="hidden" name="rowId" id="rowId" value="${roleEdit.rowId}" />
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>


 <!--书写自己的脚本-->
<script>
//一般直接写在一个js文件中
layui.use(['layer', 'form'], function(){
  var layer = layui.layer;
  var form = layui.form;
  var $=layui.$;
 var rowId=$("#rowId").val();
  
  
  
  form.verify({
	  checkrolename: function(value, item){ //value：表单的值、item：表单的DOM对象
	    var msg;
	    $.ajax({
	    	type :'get',
	    	async:false,
	    	url: 'role/checkname',
	    	data: {'roleName':value},
	    	success:function(role){
	    		if(role&&role.rowId!=rowId)
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
	 if(rowId){//如果主键有信息，则判断进行的是修改
		 alert("111");
			$.ajax({
				type :'put',
				url:'role',
				data:formData,
				
				success:function(result){
		    		if(result){
		    		layer.msg('提交成功！！');
		    		$(data.form)[0].reset();
		    		
		    		}
		    	}
			});
		}else{//则判断执行的是新增
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
   }
    layer.close(layer.index);
    
    table.reload("demo");
  /* //修改,新增成功后刷新父界面
    window.parent.location.reload(); */
    
    /* table.render({
        elem: '#demo'
        ,height: 312
        ,url: 'role1/find/' //数据接口
        ,page: true //开启分页
        ,totalRow: true //开启合计行
        ,cols: [[ //表头
          {field: 'rowId', title: 'ID', width:80, sort: true, fixed: 'left'}
          ,{field: 'roleName', title: '用户名', width:80}
          ,{field: 'roleCode', title: '角色编号', width:177, sort: true}
          ,{field: 'roleKind', title: '角色类型', width:177,templet: '#roleKindTpl'} 
          ,{field: 'roleInfo', title: '角色简介', width: 177}
          ,{fixed: '',title: '操作', width: 165, align:'center', toolbar: '#barDemo'}
        ]]
      }); */
    return false;
  });
 
});
</script> 
