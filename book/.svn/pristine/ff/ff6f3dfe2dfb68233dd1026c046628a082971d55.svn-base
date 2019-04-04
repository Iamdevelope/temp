<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
.starts, .starts ul {
	float: left;
}

.starts {
	padding-left: 16px;
	padding-top: 7px;
}

.starts ul li {
	width: 32px;
	height: 31px;
	float: left;
	background: #ddd;
	padding-right: 3px;
}

.starts ul li.on {
	background: red;
}

.starts ul span {
	display: inline;
	float: left;
	padding-left: 10px;
	height: 31px;
	line-height: 31px;
}
</style>
<script type="text/javascript">
		window.onload = function () {
		  var s = document.getElementById("pingStar"),
		    m = document.getElementById('dir'),
		    n = s.getElementsByTagName("li"),
		    input = document.getElementById('startP'); //保存所选值
		  clearAll = function () {
		    for (var i = 0; i < n.length; i++) {
		      n[i].className = '';
		    }
		  }
		  for (var i = 0; i < n.length; i++) {
		    n[i].onclick = function () {
		      var q = this.getAttribute("rel");
		      clearAll();
		      input.value = q;
		      for (var i = 0; i < q; i++) {
		        n[i].className = 'on';
		      }
		      m.innerHTML = this.getAttribute("title");
		    }
		    n[i].onmouseover = function () {
		      var q = this.getAttribute("rel");
		      clearAll();
		      for (var i = 0; i < q; i++) {
		        n[i].className = 'on';
		      }
		    }
		    n[i].onmouseout = function () {
		      clearAll();
		      for (var i = 0; i < input.value; i++) {
		        n[i].className = 'on';
		      }
		    }
		  }
		}
	</script>
<title>Insert title here</title>
</head>
<body>
	<div class="starts">
		<ul id="pingStar">
			<li rel="1" title="特别差，给1分"></li>
			<li rel="2" title="很差，给2分"></li>
			<li rel="3" title="一般般，给3分"></li>
			<li rel="4" title="很好，给4分"></li>
			<li rel="5" title="非常好，给5分"></li>
			<span id="dir"></span>
		</ul>
		<input type="hidden" value="" id="startP">
	</div>
</body>
</html>