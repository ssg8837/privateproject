<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
	    <title></title>
	
	    <!-- 부트스트랩 -->
	    <link href="./resources/css/bootstrap.min.css" rel="stylesheet">
	    <link href="./resources/css/bootstrap.theme.min.css" rel="stylesheet">
	    <link href="./resources/css/cover.css" rel="stylesheet">
	    <link href="./resources/css/logic.css" rel="stylesheet">
  </head>
	<body>
		<h1>로직 등록</h1>
			<div class="form-horizontal" >
				
					<input type="hidden" id="loginid" name="loginid" value="${loginid }">
					<input type="hidden" id="mapid" name="mapid" value="${map.mapid }">
					<input type="hidden" id="width" name="width" value="${map.width }">
					<input type="hidden" id="height" name="height" value="${map.height }">
					<input type="hidden" id="logic" name="logic" value="${map.content }">
					<input type="hidden" id="savedlogic" name="savedlogic" value="${savedlogic }">
					<input type="hidden" id="saved" name="saved" value="${saved }">
				<div class="form-group">
					<label for="userid" class="col-sm-2 control-label">제목</label>
					<div class="col-sm-10">
						<input value="${map.mapname }" type="text" class="form-control" id="title" name="title" readonly>
					</div>
				</div>
	 			<div class="form-group" >
		 			<label class="radio-inline">
						<input type="radio" name="optionRadio" id="inlineRadio1" value="black" checked="checked"> 칠하기
					</label>
					<label class="radio-inline">
						<input type="radio" name="optionRadio" id="inlineRadio2" value="checkX">X표시하기
					</label>
	  				<p>※ Ctrl 키를 누르면 키보드로도 변경할 수 있습니다 ※</p>
					<table>
						<tbody id="logicTable" class="table table-bordered">
						<tr class="trborderbold">
							<th class="tdborderbold" id='th_0_0'><div style="width: 150px; height:150px" ></div></th>
							<c:forEach var='j' begin='1' end='${map.width }' step='1'>
								<th id="th_${j-1 }" style="vertical-align: bottom;"><div id="updown_${j-1}" style="width: 30px; height:150px " ></div></th>
							</c:forEach>
						</tr>
							<c:forEach var='i' begin='1' end='${map.height }' step='1'>
								<tr id="tr_${i-1 }">
									<th class="tdborderbold"><div id="leftright_${i-1}" style="text-align: right;width: 150px; height:30px" ></div></th>
									<c:forEach var='j' begin='1' end='${map.height }' step='1'>
										<td id="td_${i-1 }_${j-1 }" param1="${i-1 }" param2="${j-1 }"  )"><div style="width: 30px; height:30px" ></div></td>
									</c:forEach>
								</tr>
							</c:forEach>
						</tbody>
					</table>
	  			</div>
	  			
	  			<div class="form-group">
	    			<div class="col-sm-offset-2 col-sm-10">
	     				<button id="submitLogic" type="button" class="btn btn-default">제출</button>
	     				<c:if test="${sessionScope.loginid != null }">
	     					<button id="saveLogic" type="button" class="btn btn-default">저장</button>
	     				</c:if>
	     				<c:if test='${saved == "true"}'>
	     					<button id="deleteLogicSave" type="button" class="btn btn-default">저장 초기화</button>
	     				</c:if>
	     				<button type="button" class="btn btn-default" onClick="window.location.reload()">새로 고침</button>
    					<a href="openLogicList"><button type="button" class="btn btn-primary" >돌아가기</button></a>
	    			</div>
	  			</div>
	  			<p>※ 새로 고침 시 마지막으로 저장된 구간으로 돌아갑니다 ※</p>
			</div>
  		
  

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/ajax_logicplay.js"></script>	
  </body>
</html>