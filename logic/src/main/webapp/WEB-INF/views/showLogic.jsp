<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
	    <title>결과</title>
	
	    <!-- 부트스트랩 -->
	    <link href="./resources/css/bootstrap.min.css" rel="stylesheet">
	    <link href="./resources/css/bootstrap.theme.min.css" rel="stylesheet">
	    <link href="./resources/css/cover.css" rel="stylesheet">
	    <link href="./resources/css/logic.css" rel="stylesheet">
  </head>
	<body>
		<input type="hidden" id="width" name="width" value="${width }">
		<input type="hidden" id="height" name="height" value="${height }">
		<h1>${userid }님의 ${title }</h1>
			<input type="hidden" id="logic" name="logic" value="${logic }">
			<div class="form-horizontal" >	
	 			<div class="form-group" >
					<table>
						<tbody id="logicTable" class="table table-bordered">
							<c:forEach var='i' begin='1' end='${height }' step='1'>
								<tr id="tr_${i-1 }">
									<c:forEach var='j' begin='1' end='${width }' step='1'>
										<td id="td_${i-1 }_${j-1 }" param1="${i-1 }" param2="${j-1 }"  )"><div style="width: 30px; height:30px" ></div></td>
									</c:forEach>
								</tr>
							</c:forEach>
						</tbody>
					</table>
	  			</div>
	  			<form action=openShowClear method='post'>
	    		<input type="hidden" id="userid" name="userid" value="${sessionScope.loginid }">
	    			<button type="submit" class="btn btn-primary" >클리어 목록 보기</button>
	    		</form>
			</div>
  		
  

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/ajax_logicshow.js"></script>	
  </body>
</html>