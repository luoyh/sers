<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false" trimDirectiveWhitespaces="true"%>
<%@include file="include.jsp"%>
<style>
  .questions {
    border: 1px solid #ccc;
    margin-top: 10px;
    min-height: 20px;
  }
  .questions button {
    margin: 5px;
  }
  
</style>
<body>
<div class="layui-layout layui-layout-admin">

<%@include file="menu.jsp"%>


  <div class="layui-tab layui-tab-brief" lay-filter="demoTitle">
    <div class="layui-body layui-tab-content site-demo site-demo-body">
      <div class="layui-tab-item layui-show">
        <div class="layui-main" style="" id="subject">
          <div>
            <button v-on:click="add" class="layui-btn">增加</button>
          </div>
          <table class="layui-table">
        <colgroup>
          <col width="150">
          <col width="200">
          <col>
          <col>
        </colgroup>
        <thead>
          <tr>
            <th>科目编号</th>
            <th>科目名称</th>
            <th>创建时间</th>
            <th>操作</th>
          </tr> 
        </thead>
        <tbody>
          <tr v-for="s in subjects">
            <td v-text="s.id"></td>
            <td v-text="s.name"></td>
            <td v-text="s.created"></td>
            <td>
              <button v-on:click="hello(s.name)" class="layui-btn layui-btn-small layui-btn-danger">删除</button>
              <button class="layui-btn layui-btn-small layui-btn-normal">编辑</button>
            </td>
          </tr>
        </tbody>
      </table>
        </div>
      </div>
      
    </div>
  </div>
</div>

  
</body>
<script>
  layui.use(['element','layer'], function() {
    var 
      layer = layui.layer;
  });
</script>
</html>