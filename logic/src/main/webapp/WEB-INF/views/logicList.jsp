<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
	    <title>로직리스트</title>
	
	    <!-- 부트스트랩 -->
	    <link href="./resources/css/bootstrap.min.css" rel="stylesheet">
	    <link href="./resources/css/bootstrap.theme.min.css" rel="stylesheet">
	    <link href="./resources/css/cover.css" rel="stylesheet">
	    <link href="./resources/css/logicList.css" rel="stylesheet">
	    <link href="./resources/css/form-control.css" rel="stylesheet">
	
	    <script>
	    
	    </script>
  </head>
	<body>
	<div class="container">

      <div class="starter-template">
        <h1>로직리스트</h1>
    	<table class="table table-hover">
	    	<thead>
	    		<tr>
	    			<th>제목</th>
	    			<th>작성자</th>
	    		</tr>
	    	</thead>
	    	<tbody>
	    		<c:forEach var="item" items="${maplist}">
					<tr onclick="javascript:funcOpen(${item.mapid })">
						<td>${item.mapname }</td>
						<td>${item.userid }</td>
					</tr>
	    		</c:forEach>
	    	</tbody>
    	</table>
    	<p>
    		<a href="openLogicList?page=1&searchText=${searchText}"><button class="btn btn-primary">맨 앞으로 가기</button></a>
			
			<c:if test="${pageNum == 1}">
				<input type="button"  class="btn btn-primary" type="button" value="이전" readonly="readonly">
			</c:if>
			
			<c:if test="${pageNum > 1}">
				<input type="submit" class="btn btn-primary" value="이전" onclick="location.href='openLogicList?page=${pageNum - 1}&searchText=${searchText}'">
			</c:if>
			
			<c:forEach var="pageNum" begin="${reader.startPageGroup}" end="${reader.endPageGroup}">
				<a href="openLogicList?page=${pageNum}&searchText=${searchText}"><button class="btn btn-primary">${pageNum}</button></a> 
			</c:forEach>
			
			<c:if test="${reader.currentPage == reader.totalPageCount}">
				<input type="button" class="btn btn-primary" value="다음" readonly="readonly">
			</c:if>
			
			<c:if test="${reader.currentPage < reader.totalPageCount}">
				<input type="submit" class="btn btn-primary" value="다음" onclick="location.href='openLogicList?page=${pageNum + 1}&searchText=${searchText}'">
			</c:if>
			
			<a href="openLogicList?page=${reader.totalPageCount}&searchText=${searchText}"><button class="btn btn-primary">맨 뒤로 가기</button></a>
    	</p>
    	<c:if test="${sessionScope.loginid != null }">
	    	<form action='openCreateLogic' method='post'>
	    		<label>가로: </label>
	    		<select name="width" id="width" class="form-control2">
					<c:forEach var="i" begin='5' end='15' step='1'>
						<option value='${i }'>${i }</option>
					</c:forEach>
				</select>
	    		<label>세로: </label><select name="height" id="height" class="form-control2">
					<c:forEach var="i" begin='5' end='15' step='1'>
						<option value='${i }'>${i }</option>
					</c:forEach>
				</select>
	    			<button type="submit" class="btn btn-primary" >로직 만들기</button>
	    	</form>
	    	<form action=openShowClear method='post'>
	    		<input type="hidden" id="userid" name="userid" value="${sessionScope.loginid }">
	    			<button type="submit" class="btn btn-primary" >클리어 목록 보기</button>
	    	</form>
    	</c:if>
    	</div>
      </div>

    	<a href="./"><button type="button" class="btn btn-primary" >돌아가기</button></a>
  

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="./resources/js/bootstrap.min.js"></script>
    <script src="./resources/js/logicList.js"></script>
  </body>
</html>