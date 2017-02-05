<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false" trimDirectiveWhitespaces="true"%>
<%@include file="include.jsp"%>
<body>
<div class="layui-layout layui-layout-admin">

<%@include file="menu.jsp"%>


  <div class="layui-tab layui-tab-brief" lay-filter="demoTitle">
    <div class="layui-body layui-tab-content site-demo site-demo-body">
      <div class="layui-tab-item layui-show">
        <div class="layui-main" style="" id="app">
          <div>
            <button v-on:click="add" class="layui-btn">增加</button>
          </div>
          <table class="table table-bordered">
        <thead>
          <tr>
            <th>试卷名称</th>
            <th>所属科目</th>
            <th>年月份</th>
            <th>题目数量</th>
            <th>创建时间</th>
            <th>操作</th>
          </tr> 
        </thead>
        <tbody>
          <tr v-for="s in suites">
            <td v-text="s.title"></td>
            <td v-text="s.subject"></td>
            <td v-text="s.date"></td>
            <td v-text="s.questions"></td>
            <td v-text="s.created"></td>
            <td>
              <button class="layui-btn layui-btn-small layui-btn-danger">删除</button>
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

      $(function() {
        var 
          vm = new Vue({
            el: '#app',
            data: {
              suites: [
                {
                  title: '二零一七年高三第一模拟考试',
                  subject: '语文',
                  date: '2017年3月',
                  questions: 181,
                  created: '2012-11-01 12:00:11'
                },
                {
                  title: '二零一七年高三第三模拟考试',
                  subject: '数学',
                  date: '2017年11月',
                  questions: 219,
                  created: '2012-11-01 12:00:11'
                }
              ]
            },
            methods: {
              add: function() {
                window.location.href = root + '/boot.suite_add/go#hash_suite';
              }
            }
          });
      });
  });
</script>
</html>