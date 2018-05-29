(function(){
	var Qu = document.getElementsByClassName("query-user-class");
	var Qg = document.getElementsByClassName("query-games-class");
	var content = document.getElementById("query-result");
	Qu[2].addEventListener('click',function(event){
		event.preventDefault();
		content.innerHTML = QueryUser( Qu[1].value );
	})
	Qg[2].addEventListener('click',function(envent){
		document.getElementById("query-games-box").submit();
	})

	function QueryUser(inputname,inputmail) {
		var result = false;
		$.ajax({
			type: "POST",
			url: '../php/queryUser.php',
			dataType: 'json',
			async: false,
			data:{"query-user": inputname},

			success: function(data){
				result = data;
			}
		});
		alert(result);
		return result;
	}
})();