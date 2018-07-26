<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
	    <title>메인 화면</title>
	
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
	<div class="container">

      <div class="starter-template">
        <h1>네모네모로직</h1>
    		<div class="list-group">
  				<c:if test="${sessionScope.loginid ==null}">
            		<a href="openNewUser" class="list-group-item">회원가입</a>  
					<a href="openLogin" class="list-group-item">로그인</a> 
            		<a href="openLogicList" class="list-group-item">로직플레이</a>  
   				</c:if>
    			<c:if test="${sessionScope.loginid !=null}">
            		<a href="openLogicList" class="list-group-item">로직플레이</a>  
            		<a href="logout" class="list-group-item">로그아웃</a>
    			</c:if>	
			</div>
      </div>
	<c:if test="${sessionScope.loginid ==null}">
	※비회원에게는 저장 기능을 제공하지 않습니다.
	</c:if>
    </div>
  		
  

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="./resources/js/bootstrap.min.js"></script>
  </body>
</html>