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
        <div class="layui-main" style="" id="app">
        	<div class="form-horizontal">
			  <div class="form-group">
			    <label class="col-md-2 control-label">试卷名称</label>
			    <div class="col-md-10">
			      <input type="text" class="form-control" placeholder="text">
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-md-2 control-label">所属科目</label>
			    <div class="col-md-10">
			    	<select class="form-control">
			    		<option value="1">语文</option>
			    		<option value="2">数学</option>
			    		<option value="3">英语</option>
			    		<option value="4">政治</option>
			    	</select>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-md-2 control-label">年月份</label>
			    <div class="input-group">
			      <div class="input-group-addon">年</div>
			      <input type="text" class="form-control">
			      <div class="input-group-addon">月</div>
			      <input type="text" class="form-control">
			    </div>
			  </div>
			  <div class="form-group">
			  	<label for="" class="col-md-2 control-label">试题</label>
			  	<div class="col-md-10">
			  		<div class="col-md-12">
			  			<button v-on:click="addQuestion" class="btn btn-primary">增加题目</button>
			  		</div>
			  		<div class="col-md-12 questions">
			  			<button class="btn" v-for="(q, i) in questions" v-text="q.code" v-on:click="edit(i)"></button>
			  		</div>
			  	</div>
			  </div>
			  <div class="form-group">
			  	<label for="" class="col-md-2 control-label">试卷总分数</label>
			  	<div class="col-md-10">
			  		<input type="text" readonly value="99" class="form-control">
			  	</div>
			  </div>
			  <div class="form-group">
			    <div class="col-md-offset-2 col-md-10">
			      <button type="button" class="btn btn-primary">保存</button>
			      <button v-on:click="back" type="button" class="btn">取消</button>
			    </div>
			  </div>
			</div>
        </div>
      </div>
      
    </div>
  </div>
</div>

<div class="modal fade" data-backdrop="static" id="add_quesion_modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">增加题目</h4>
      </div>
      <div class="modal-body">
      	<div class="form-horizontal">
			  <div class="form-group">
			    <label class="col-md-2 control-label">题目编号</label>
			    <div class="col-md-10">
			      <input type="text" id="qstn_code" class="form-control" placeholder="题目编号">
			    </div>
			  </div>
			  <div class="form-group">
			  	<label for="" class="col-md-2 control-label">题目类型</label>
			  	<div class="col-md-10">
			  		<select id="qstn_type" class="form-control">
			  			<option value="1">单选题</option>
			  			<option value="2">多选题</option>
			  			<option value="3">判断题</option>
			  			<option value="4">解答题</option>
			  		</select>
			  	</div>
			  </div>
			  <div class="form-group">
			  	<label for="" class="col-md-2 control-label">题目标题</label>
			  	<div class="col-md-10">
			  		<textarea id="qstn_title" rows="2" class="form-control"></textarea>
			  	</div>
			  </div>
			  <div class="form-group">
			  	<label for="" class="col-md-2 control-label">题目图片</label>
			  	<div class="col-md-10" id="qstn_imagep">
			  	</div>
			  </div>
			  <div id="opts_div" class="form-group">
			  	<label for="" class="col-md-2 control-label">题目选项</label>
			  	<div class="col-md-10" id="qoptions">
			  	</div>
			  </div>
			  <div class="form-group">
			  	<label for="" class="col-md-2 control-label">题目答案</label>
			  	<div id="answers" class="col-md-10">
			  	</div>
			  </div>
			  <div class="form-group">
			  	<label for="" class="col-md-2 control-label">解题说明</label>
			  	<div class="col-md-10">
			  		<textarea id="qstn_desc" rows="2" class="form-control"></textarea>
			  	</div>
			  </div>
			  <div class="form-group">
			  	<label for="" class="col-md-2 control-label">答案图片</label>
			  	<div class="col-md-10" id="qstn_ass_imagep">
			  	</div>
			  </div>
			  <div class="form-group">
			  	<label for="" class="col-md-2 control-label">题目分数</label>
			  	<div class="col-md-10">
			  		<input id="qstn_score" type="text" class="form-control">
			  	</div>
			  </div>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" id="qstn_submit" class="btn btn-primary">增加</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
  
</body>
<script>
  layui.use(['element','layer'], function() {
    var 
      layer = layui.layer;

      $(function() {
      	var initQstn = function(opts) {
      		$('#qstn_code').val(opts.code || '');
      		$('#qstn_type').val(opts.type || 1);
      		$('#qstn_title').val(opts.title || '');
      		$('#qstn_imagep').html('<input id="qstn_image" type="file" class="form-control">');
      		$('#qstn_image').data('path', opts.image || '');
      		$('#qstn_ass_imagep').html('<input id="qstn_ass_image" type="file" class="form-control">');
      		$('#qstn_ass_image').data('path', opts.assImage || '');
      		$('#qstn_score').val(opts.score || '');
      		if (opts.type == 1 || opts.type == 2) {
      			var htm = '';
      			$.each(JSON.parse(opts.options), function(i, e) {
      				if (i == 0) {
      					htm += '<div class="input-group col-md-12 m10b">\
							      <div class="input-group-addon opts">A</div>\
							      <input value="'+e+'" type="text" class="form-control">\
							      <div class="input-group-addon" id="add_qoption" style="background: #128067;cursor: pointer;color:#fff;">+</div>\
							  	</div>';
      				} else {
      					htm += '<div class="input-group col-md-12 m10b">\
							      <div class="input-group-addon opts"></div>\
							      <input value="'+e+'" type="text" class="form-control">\
							      <div class="input-group-addon" id="del_qoption" style="font-weight: bold;background: #da5c1d;cursor: pointer;color:#fff;">-</div>\
							  	</div>';
      				}
      			});
      			$('#qoptions').html(htm);
      			optsRefresh(JSON.parse(opts.answers));
      		} else {
      			$('#answers textarea').val(JSON.parse(opts.answers||'[]')[0]||'');
      		}

      	};

      	$('#qstn_submit').click(function() {
      		var code = $('#qstn_code').val(), ok = true;
      		if (code == '') {
      			layer.msg('题目编号不能为空');
      			return;
      		}
      		$.each(vm.questions, function(i, e) {
      			if (e.code == code) {
      				layer.msg('题目编号已存在');
      				return (ok = false);
      			}
      		});
      		if (ok) {
      			var options = [], answers = [], qstnType = $.trim($('#qstn_type').val());
      			$('#qoptions input').each(function(i, e) {
      				options.push($(e).val());
      			});
      			if (qstnType == 4) {
      				answers.push($('#answers textarea').val());
      			} else {
      				$('#answers input[name="v_q"]:checked').each(function(i, e){
      					answers.push($(e).val());
      				});
      			}
      			vm.questions.push({
      				code: code,
      				type: qstnType,
      				title: $('#qstn_title').val(),
      				image: $('#qstn_image').data('path'),
      				options: JSON.stringify(options),
      				answers: JSON.stringify(answers),
      				description: $('#qstn_desc').val(),
      				assImage: $('#qstn_ass_image').data('path'),
      				score: $('#qstn_score').val()
      			});
      			console.log(JSON.parse(JSON.stringify(vm.questions)));
      			$('#add_quesion_modal').modal('hide');
      		}
      	});
      	$('#qstn_type').change(function() {
      		var v = $.trim($(this).val());
      		if (v == 1 || v == 2) {
      			$('#opts_div').show();
      			optsRefresh();
      		} else if (v == 3) {
      			$('#answers').html('<label><input name="v_q" type="radio" value="0">正确</label><label><input name="v_q" type="radio" value="1">错误</label>');
      		} else {
      			$('#opts_div').hide();
      			$('#answers').html('<textarea rows="2" class="form-control"></textarea>');
      		}
      	});
      	$('#qoptions').on('click', '#del_qoption', function() {
      		$(this).parent().remove();
      		optsRefresh();
      	});
      	var optsRefresh = function(answers) {
      		$('#answers').empty();
      		var v = $.trim($('#qstn_type').val());
      		$('#qoptions').children().each(function(i, e){
      			var t = String.fromCharCode(65+i), ck = false;
      			$(e).find('.opts').text(t);
      			if (answers && answers.length > 0) {
      				for(var a in answers) {
	      				if (answers[a] == v) {
	      					ck = true;
	      					break;
	      				}
	      			}
      			}
      			$('#answers').append('<label><input '+(ck?"checked":"")+' name="v_q" type="'+(v==1?'radio':'checkbox')+'" value="'+t+'">'+t+'</label>');
      		});
      	};
      	$('#qoptions').on('click', '#add_qoption', function() {
      		//var opts = String.fromCharCode(65 + $('#qoptions').children().length);
      		$('#qoptions').append('<div class="input-group col-md-12 m10b">\
				      <div class="input-group-addon opts"></div>\
				      <input type="text" class="form-control">\
				      <div class="input-group-addon" id="del_qoption" style="font-weight: bold;background: #da5c1d;cursor: pointer;color:#fff;">-</div>\
				  	</div>');
      		optsRefresh();
      	});
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
              ],
              questions: [
              ]
            },
            methods: {
              add: function() {

              },
              addQuestion: function() {
              	initQstn({
      				type: 1,
      				options: '[""]',
      				answers: '[]'
              	});
              	$('#add_quesion_modal').modal('show');
              },
              back: function() {
              	window.location.href = root + '/boot.suite/go#hash_suite';
              },
              edit: function(i) {
              	initQstn(this.questions[i]);
              	$('#add_quesion_modal').modal('show');
              }
            }
          });
      });
  });
</script>
</html>