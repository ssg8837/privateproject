
$(
	function()
	{
		$("#login").on('click',
		function()
		{
			$.ajax(
			{
				url : "login",
				type : "post",
				data :{ "userid" : $("#userid").val(),
						"userpwd" : $("#userpwd").val()},
				success : function(data)//data는 서버가 보내준 값을 의미함.
				{
					if(data==true)
					{
						$(location).attr('href', './');
					}
					if(data!=true)
					{
						alert("비밀번호 및 아이디가 틀림");
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