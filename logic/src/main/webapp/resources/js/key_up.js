$(
		function(){
			$('.key_up').on('keyup',function(){
				var strValue = $(this).val();
				var strLen=$(this).val().length;        
				var totalByte = 0;
		        var len = 0;
		        var oneChar = "";
		        var str2 = "";


				for (var i = 0; i < strLen; i++) {
		            oneChar = strValue.charAt(i);
		            if (escape(oneChar).length > 4) {
		                totalByte += 2;
		            } else {
		                totalByte++;
		            }
		 
		            if (totalByte <= 20) {
		            	str2+=oneChar;
		            }
		   		 
			        // 넘어가는 글자는 자른다.
			        if (totalByte > 20) {
			            alert(20 + "자를 초과 입력 할 수 없습니다.");
			            $(this).val(str2);
			        }

		        }

			});
		}
);