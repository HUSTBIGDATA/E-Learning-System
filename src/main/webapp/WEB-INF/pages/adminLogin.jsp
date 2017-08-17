<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html> 
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
        <meta name="format-detection" content="telephone=no">
        <meta charset="UTF-8">
        <title>管理员登录</title>
		
          <link href="css/login.css" rel="stylesheet">
          <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
		  
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
       </head>
    <body background="img/login_background.jpg" align="center" onload="scan()">
	   
        <div class="clearfix">
		 <h1 align="center"><span>管理员登录</span></h1>
		 <hr>
            <div id="adminhead"> 
                <h4><span color="#EBEBEB"><p align="center">欢迎来到E-learning大数据学习平台</p></span></h4>
            </div>
            
            <div class="box-login">
            <!-- adminLogin -->
               <form id="adminlog" role="form" class="form-horizontal">
                       <div class="form-group" >
                           <label for="name" class="col-sm-3 control-label"><span class="glyphicon glyphicon-user"></span>&nbsp帐号:</label>
                           <div class="col-sm-7">
                               <input type="text" class="form-control" id="name" name="name" placeholder="请输入帐号">
                           </div>
                       </div>
                       <div class="form-group">
                           <label for="password" class="col-sm-3 control-label"><span class="glyphicon glyphicon-lock"></span>&nbsp密码:</label>
                           <div class="col-sm-7">
                               <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
                           </div>
                       </div>
				 
				<c:if test="${!empty error}">
				    <div class="alert alert-warning alert-dismissable" id="alertinfo">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button> 
		                <font color="red"><c:out value="${error}" /></font>
                    </div> 
		        </c:if>
				

            <div class="form-group">
             <div class="col-sm-offset-2 col-sm-8">
                <button type="submit" id="btn" class="btn btn-default" onclick="check();">登录</button>
			    <button type="reset"  class="btn btn-default">重置</button>
             </div>
           </div>
		   
           </form>
         </div> 
			
	    </div>
		 <script>
		     	
             function scan(){	      
			     document.getElementById("alertinfo").style.display="none";  
			 }	
           
       	
		 </script>
		
    </body>
</html>
