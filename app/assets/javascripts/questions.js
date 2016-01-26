
$(document).on("ajax:success","form#questions-form",function(ev,data){
	console.log(data)
	//$(this).find("textarea").empty();
	document.getElementById('question_body').value="";
	$("#questions-box").append("<li><p>" + data.body + "</p><p>" + "Publicado por " + data.user.name + " el 2016744" + "</p></li>");
});