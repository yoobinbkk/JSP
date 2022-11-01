$(document).ready(function(){
	
	$("#container").addClass("start");

	$("nav li").click(function(){
		$("#container").css("max-width", "100%")
		
		var id=$(this).attr("data-rol");    
		$("nav li").removeClass("on");    
		$(this).addClass("on");    
		$(".content").removeClass("prev this next");     
		//클릭 시 가지고 있던 클래스를 모두 지운다 
		
		$("#" + id).addClass("this").prevAll().addClass("prev");    
		//클릭한 메뉴와 매칭 되는 id에 this 클래스를 지정하고 그 앞의 모든 <section> 태그는 .prev클래스를 지정한다    
		$("#" + id).nextAll().addClass("next");    
		//클릭한 메뉴와 매칭 되는 id의 뒤에 오는 <section> 태그는 .next 클래스를 지정한다     
	});

	
	//********************************************************
	//ajax 사용하기
	$(".book_roll li").click(function(){
		
		// (1) 이벤트 발생한 li 요소에서 data-url 값 가져오기
		var liurl = $(this).attr('data-url');

		// (2)  class='notebook' 지정한 article의 요소에 ajax로 파일을 받아서 지정
		$.ajax({
			type : 'post',
			dataType : 'html',
			url : liurl,
			success : function(data){				// URL의 내용 자체가 data로 들어온다.
				$('.notebook').html(data);			// $('.notebook')에 추가되는 것이 아니라 내용이 교체된다.
			}
		});
		
	});
});

