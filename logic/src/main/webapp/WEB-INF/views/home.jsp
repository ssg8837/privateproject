<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
	    <title>메인 화면</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="./resources/js/ajax_1.js"></script>	
	    <!-- 부트스트랩 -->
	    <link href="./resources/css/bootstrap.min.css" rel="stylesheet">
	    <link href="./resources/css/bootstrap.theme.min.css" rel="stylesheet">
	    <link href="./resources/css/cover.css" rel="stylesheet">
	
	    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
	    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
	    <!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	    <![endif]-->
	</head>
	
	<body> 
		  
	    <h1>로그인</h1>
		<form class="form-horizontal" action="openMenu" method="post">
			
			<div class="form-group">
				<label for="userid" class="col-sm-2 control-label">ID</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="userid" name="userid" placeholder="ID">
				</div>
			</div>
 			<div class="form-group">
				<label for="userpwd" class="col-sm-2 control-label">비밀번호</label>
				<div class="col-sm-10">
	      			<input type="password" class="form-control" id="userpwd" name="userpwd" placeholder="Password">
	    		</div>
  			</div>
  			
  			<div class="form-group">
    			<div class="col-sm-offset-2 col-sm-10">
     				<button id="openMenu" type="button" class="btn btn-default">로그인</button>
     				<button id="openNewAccount" type="button" class="btn btn-default">회원가입</button>
    			</div>
  			</div>
		</form>

	    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	    <script src="./resources/js/bootstrap.min.js"></script>
	</body>
</html>