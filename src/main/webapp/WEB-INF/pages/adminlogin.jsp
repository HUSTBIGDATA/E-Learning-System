<!DOCTYPE html>
<html lang="">
<head>
	<meta charset="utf-8">
	<title>管理员登录</title>
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="robots" content="" />
	<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
	<link rel="stylesheet" href="css/style.css" media="all" />
</head>
<body class="login">
	<section>
		<h1><strong>大数据教学平台</strong></h1>
		<form method="link" action="adminMain.html">
			<input type="text" value="管理员帐号" />
			<input value="Password" type="password" />
			<button class="blue">Login</button>
		</form>
	
	</section>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('.login button').click(function(e){ 
		// Get the url of the link 
		var toLoad = $(this).attr('href');  
 
		// Do some stuff 
		$(this).addClass("loading"); 
 
			// Stop doing stuff  
			// Wait 700ms before loading the url 
			setTimeout(function(){window.location = toLoad}, 10000);	  
 
		// Don't let the link do its natural thing 
		e.preventDefault
	});
	
	$('input').each(function() {

       var default_value = this.value;

       $(this).focus(function(){
               if(this.value == default_value) {
                       this.value = '';
               }
       });

       $(this).blur(function(){
               if(this.value == '') {
                       this.value = default_value;
               }
       });

});
});
</script>
</body>
</html>