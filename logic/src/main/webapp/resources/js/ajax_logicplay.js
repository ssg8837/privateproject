var logicArr=new Array();
var answerArr=new Array();
var height;
var width;
var logic;
var BLANK=0;
var CORRECT=1;
var WRONG=2;
var XCHECK=3;

function upDown(y)
{
	var str="";
	for(var i=0;i<height;i++)
	{
		str+=answerArr[i][y];
	}
	var result="";
	var strAry=str.split("0");
	for(var item in strAry)
	{	
		if(strAry[item].length!=0)
		{
			result+=strAry[item].length+"<br>";
		}
	}
	var id="#updown_"+y;
	$(id).html(result);	

}

function leftRight(x)
{
	var str="";
	for(var i=0;i<width;i++)
	{
		str+=answerArr[x][i];
	}
	var result="";
	var strAry=str.split("0");
	for(var item in strAry)
	{	
		if(strAry[item].length!=0)
		{
			result+=strAry[item].length+" ";
		}
	}
	var id="#leftright_"+x;
	$(id).text(result);	

}


$(
	function()
	{
		logic=$('#logic').val();
		height=$('#height').val();
		width=$('#width').val();
		saved=$('#saved').val();
		savedlogic=$('#savedlogic').val();
		var k=0;
		for(var j=0;j<width;j++)
		{
			if(j%5==4)
			{
				var thname="#th_"+j;
				$(thname).addClass('tdborderbold');
			}	
		}
		for(var i=0;i<height;i++)
		{
			if(i%5==4)
			{
				var trname="#tr_"+i;
				$(trname).addClass('trborderbold');
			}	
			logicArr[i]=new Array();
			answerArr[i]=new Array();
			for(var j=0;j<width;j++)
			{
				if(j%5==4)
				{
					var tdname="#td_"+i+"_"+j;
					$(tdname).addClass('tdborderbold');
				}	
				answerArr[i][j]=logic.charAt(k);
				//alert(answerArr[i][j]);
				if(saved=="true")
				{
					var td_id="#td_"+i+"_"+j;
					logicArr[i][j]=savedlogic.charAt(k);
					if(logicArr[i][j]==CORRECT)
					{
						$(td_id).addClass("tdClick");
					}
					else if(logicArr[i][j]==WRONG)
					{	
						$(td_id).addClass("tdWrong");
					}
					else if(logicArr[i][j]==XCHECK)
					{
						$(td_id).addClass("tdXCheck");
					}
					
				}
				else if(saved=="false")
				{
					logicArr[i][j]='0';
				}
				k++
			}
		}//배열을 넓이와 높이로 계산된 크기만큼 만듬
		for(var i=0;i<height;i++)
		{
			leftRight(i);
		}
		for(var j=0;j<width;j++)
		{
			upDown(j);
		}

		$('#logic').val('');
		$('#savedlogic').val('');
		
		$("td").click(function()
		{
			var option=$('[name=optionRadio]:checked').val();
			var x=$(this).attr('param1');
			var y=$(this).attr('param2');
			if(logicArr[x][y]==BLANK)
			{
				if(option=='black')
				{
					if(answerArr[x][y]==CORRECT)
					{
						logicArr[x][y]=CORRECT;
						$(this).addClass("tdClick");
					}
					else
					{
						logicArr[x][y]=WRONG;
						$(this).addClass("tdWrong");
					}
				}
				else
				{
					logicArr[x][y]=XCHECK;
					$(this).addClass("tdXCheck");
				}
			}
			else if(logicArr[x][y]==XCHECK)
			{
				logicArr[x][y]=BLANK;
				$(this).removeClass("tdXCheck");
			}
			//alert(x+", "+y+" = "+logicArr[x][y]);
		});//표의 칸을 눌럿을때 정답 오답 x표시를 나눔.
		
		$("td").hover(function(){
			$(this).addClass("thishover");},
			function(){$(this).removeClass("thishover");});
		var allCells = $("td, th");
		allCells.filter("td")
		  .on("mouseover", function() {
			var el = $(this);
			var pos = el.index();
			allCells.filter(":nth-child(" + (pos+1) + ")").addClass("trhover");
			$(this).parent('tr').addClass("trhover");
		  })
		  .on("mouseout", function() {
			allCells.removeClass("trhover");
			$(this).parent('tr').removeClass("trhover");
		  });
	//	$("tr").hover(function(){$(this).children("td").addClass("trhover");},function(){$(this).children("td").removeClass("trhover");});

		//로직 저장햇을때 컨트롤러로 보냄
		$("#saveLogic").click(function(){
			var logic_save="";
			for(var i=0;i<height;i++)
			{
				for(var j=0;j<width;j++)
				{
					logic_save+=logicArr[i][j];
				}
			}
				
			$.ajax(
					{
						url : "saveLogic",
						type : "post",
						data :{ "userid" : $("#loginid").val(),
								"mapid" : $("#mapid").val(),
								"content":logic_save},
						success : function(data)//data는 서버가 보내준 값을 의미함.
						{
							if(data)
							{
								$(location).attr('href', 'openLogicList');
							}
							else
							{
								alert("관리자에게 문의하세요.");
							}
						},
						error : function(data)
						{
							alert("통신에러");
						}
					});
		});
		//세이브 파일 삭제
		$("#deleteLogicSave").click(function(){
				
			$.ajax(
					{
						url : "deleteLogicSave",
						type : "post",
						data :{ "userid" : $("#loginid").val(),
								"mapid" : $("#mapid").val()},
						success : function(data)//data는 서버가 보내준 값을 의미함.
						{
							if(data)
							{
								window.location.reload();
							}
							else
							{
								alert("관리자에게 문의하세요.");
							}
						},
						error : function(data)
						{
							alert("통신에러");
						}
					});
		});
		//1버튼 눌럿을시 x 칠하기 변경
		$('body').on('keydown', function(event){
			if(event.keyCode==	17)
			{
				var option=$('[name=optionRadio]:checked').val();
				if(option!='black')
				{
					$('[name=optionRadio]:input[value="checkX"]').attr("checked",false);
					$('[name=optionRadio]:input[value="black"]').attr("checked",true);
				}
				else
				{
					$('[name=optionRadio]:input[value="black"]').attr("checked",false);
					$('[name=optionRadio]:input[value="checkX"]').attr("checked",true);
				}
			}
		});
	}
);


