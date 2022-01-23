window.addEventListener('message', function(event) {
	if (event.data.actionhud == "setValue"){
		if (event.data.key == "job"){
		}
		setValue(event.data.key, event.data.value)
	}else if (event.data.actionhud == "showhudmoney"){
		if (event.data.showhud){
			$('#showhudmoney').fadeIn(100);
			document.getElementById('img').style.display = "block";
		} else{
			$('#showhudmoney').fadeOut(100);
			document.getElementById('img').style.display = "none";
		}
		} else if (event.data.actionhud == "showhudstatus") {
		if (event.data.showhud){
			$('#iddubail').fadeIn(100);
		} else{
			$('#iddubail').fadeOut(100);
		}
	}
});

function setValue(key, value){ 
	$('#'+key+' span').html(value).fadeOut(80);
	$('#'+key+' span').html(value);
	$('#'+key+' span').html(value).fadeIn(80)
}