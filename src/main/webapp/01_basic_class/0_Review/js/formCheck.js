window.onload = function(){

		var frm = document.getElementById('frm');
		// var inputs = document.querySelectorAll("input");
		
		frm.onsubmit = function(evt) {
			evt.stopPropagation();
			evt.preventDefault();
			
			// alert(frm.agree.checked);
			if(!frm.agree.checked) {
				alert('반드시 체크해주셔야만 합니다.');
				return;
			}
			
			frm.submit();
		}

	}