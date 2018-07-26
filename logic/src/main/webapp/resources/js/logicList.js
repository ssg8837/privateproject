function funcOpen(params) 
{
	var form = document.createElement('form');      // form생성

	form.setAttribute('method','post');                    // method 설정
	form.setAttribute('action','openLogicPlay');       // action 설정

	document.body.appendChild(form);                     //body 태그에 append 폼 추가

	//input
	var input_id = document.createElement('input');

	input_id.setAttribute('type', 'hidden');

	input_id.setAttribute('name', 'mapid');      //name 속성 지정
	input_id.setAttribute('value', params);        //value 값 설정

	form.appendChild(input_id);                 //from 태그에 추가

	//폼전송

	form.submit();
}


$(function()
{
	$('tr').hover
	(
		function(){$(this).addClass('onmouseTag');},
		function(){$(this).removeClass('onmouseTag');}	
	);
	
	$('tr').each(function(index,item)
	{
		if(index%2==0)
			$(item).addClass('evenTag');
	});
});
