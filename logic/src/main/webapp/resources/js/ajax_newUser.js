$(
	function()
	{
		$("#checkUser").on('click',
		function()
		{
			$.ajax(
			{
				url : "checkAndInsertUser",
				type : "post",
				data :{ "userid" : $("#userid").val(),
						"userpwd" : $("#userpwd").val()},
				success : function(data)//data는 서버가 보내준 값을 의미함.
				{
					if(data==true)
					{
						$(location).attr('href', './');
					}
					else
					{
						alert("아이디가 중복이거나 비밀번호가 입력되지 않았습니다.");
					}
				},
				error : function(data)
				{
					alert("에러");
				}
			});
			
		});
	}
);
