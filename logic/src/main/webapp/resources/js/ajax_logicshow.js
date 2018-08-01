var logicArr=new Array();
var height;
var width;
var logic;
var BLANK=0;
var CORRECT=1;


$(
	function()
	{
		logic=$('#logic').val();
		height=$('#height').val();
		width=$('#width').val();
		var k=0;
		for(var i=0;i<height;i++)
		{
			if(i%5==4)
			{
				var trname="#tr_"+i;
				$(trname).addClass('trborderbold');
			}	
			for(var j=0;j<width;j++)
			{
				var tdname="#td_"+i+"_"+j;
				if(j%5==4)
				{
					$(tdname).addClass('tdborderbold');
				}
				var temp=logic.charAt(k);
				if(temp==CORRECT)
				{
					$(tdname).addClass("tdClick");
				}
				k++;
			}
		}//배열을 넓이와 높이로 계산된 크기만큼 만듬
		

		$('#logic').val('');
		
	}
);


