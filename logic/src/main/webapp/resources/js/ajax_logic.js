var logicArr=new Array();
var height;
var width

function upDown(y)
{
	var str="";
	for(var i=0;i<height;i++)
	{
		str+=logicArr[i][y];
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
		str+=logicArr[x][i];
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
		height=$('#height').val();
		width=$('#width').val();
		for(var i=0;i<height;i++)
		{
			logicArr[i]=new Array();
			for(var j=0;j<width;j++)
			{
				logicArr[i][j]='0';
			}
		}//배열을 넓이와 높이로 계산된 크기만큼 만듬
		
		$("td").click(function()
		{
			var x=$(this).attr('param1');
			var y=$(this).attr('param2');
			if(logicArr[x][y]==1)
			{
				logicArr[x][y]=0;
				$(this).removeClass("tdClick");
			}
			else
			{
				logicArr[x][y]=1;
				$(this).addClass("tdClick");
			}
			upDown(y);
			leftRight(x);
			//alert(x+", "+y+" = "+logicArr[x][y]);
		});//색칠하고 배열에 저장
		
		$("td").hover(function(){
			$(this).addClass("thishover");},
			function(){$(this).removeClass("thishover");});
		var allCells = $("td");
		allCells
		  .on("mouseover", function() {
			var el = $(this);
			var pos = el.index();
			allCells.filter(":nth-child(" + (pos+1) + ")").addClass("trhover");
		  })
		  .on("mouseout", function() {
			allCells.removeClass("trhover");
		  });
		$("tr").hover(function(){$(this).children("td").addClass("trhover");},function(){$(this).children("td").removeClass("trhover");});

		//로직 저장햇을때 컨트롤러로 보냄
		$("#createLogic").click(function(){
			var logic="";
			for(var i=0;i<height;i++)
			{
				for(var j=0;j<width;j++)
				{
					logic+=logicArr[i][j];
				}
			}
				
			$.ajax(
					{
						url : "createLogic",
						type : "post",
						data :{ "userid" : $("#loginid").val(),
								"mapname" : $("#title").val(),
								"height":height,
								"width":width,
								"content":logic},
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
	}
);


