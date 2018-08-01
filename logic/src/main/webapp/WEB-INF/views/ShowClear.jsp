<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
	    <link href="./resources/css/bootstrap.theme.min.css" rel="stylesheet">
	    <link href="./resources/css/cover.css" rel="stylesheet">
	    <link href="./resources/css/logicList.css" rel="stylesheet">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>클리어 목록</title>
	</head>
	<body>
		<h1>[${sessionScope.loginid }님의 클리어 목록]</h1>
		<div class="form-horizontal">
			<table class="table table-hover table-bordered">
				<tr>
					<th>맵 이름</th>
					<th>제작자 </th>
					<th>틀린 횟수</th>
				</tr>
				<c:forEach var="item" items="${howwrong}" varStatus="sta">
					<tr onclick="openLogicShow('${sessionScope.loginid }', '${mapid[sta.index]}');">
						<td>
							${title[sta.index]}
						</td>
						<td>
							${maker[sta.index]}
						</td>
						<td>
							${item }
						</td>
					</tr>
				</c:forEach>
			</table>
    		<a href="./openLogicList"><button type="button" class="btn btn-primary" >리스트로 돌아가기</button></a>
		</div>
		<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	    <script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/openClear.js"></script>
    <script src="./resources/js/logicList.js"></script>
	</body>
</html>

