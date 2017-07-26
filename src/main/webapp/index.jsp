<%@page import="org.jasig.cas.client.validation.Assertion" %>
<%
Assertion sssertion = (Assertion)session.getAttribute("_const_cas_assertion_");
%>
<html>
<head>
	<title>CAS Application 2</title>
	<link rel="stylesheet" type="text/css" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css"/>
	<script type="text/javascript" src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script type="text/javascript" src="//cdn.bootcss.com//bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="./">CAS Application 2</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="/marketplace">Marketplace</a></li>
        <li><a href="/marketplace/console">Cloud Console</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	<%
      	if (sssertion == null){
      	%>
      	<li><a href="javascript:login();">Login</a></li>
      	<%
      	} else {
      	%>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
          	<i class="glyphicon glyphicon-user"></i>
          	<span style="padding: 0 10px"><%=sssertion.getPrincipal() %></span>
          	<span class="caret"></span>
          </a>
          <ul class="dropdown-menu">
            <li><a href="logout">Logout</a></li>
          </ul>
        </li>
        <%} %>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<div class="jumbotron">
  <div class="container">
    <h1>Hello, <span style="color:#337ab7"><%=sssertion==null?"world":sssertion.getPrincipal() %>!</span></h1>
    <p>This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
    <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more &raquo;</a></p>
  </div>
</div>

    <div class="container">
      <!-- Example row of columns -->
      <div class="row">
        <div class="col-md-4">
          <h2>Heading</h2>
          <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
        <div class="col-md-4">
          <h2>Heading</h2>
          <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
       </div>
        <div class="col-md-4">
          <h2>Heading</h2>
          <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
      </div>

      <hr>

      <footer>
        <p>&copy; 2016 Company, Inc.</p>
      </footer>
    </div> <!-- /container -->

<script type="text/javascript">
function login(){
	var service = encodeURIComponent(document.location.href);
	document.location.href="https://cas.p4.com:7443/cas/login?service=" + service;
}
</script>

</body>
</html>
