<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-us"> 
	<head> 
		<title>{$title}{if $subtitle} | {$subtitle}{/if}</title>
		
		<!-- Begin Stylesheets -->
		<link type="text/css" href="{#cssLibDir#}reset.css" rel="stylesheet" media="print, projection, screen" />
		<link type="text/css" href="{#templateDir#}resources/css/style.css" rel="stylesheet" media="print, projection, screen" />
		<!--[if IE 6]>
		<link href="css/ie6.css" rel="stylesheet" type="text/css" />
		<![endif]-->
		
		{if $page == "curriculo" || $page == "cadastro"}
		
		<link type="text/css" href="{#cssLibDir#}themes/base/jquery.ui.all.css" rel="stylesheet" />
		<link rel="stylesheet" href="{#templateDir#}resources/css/cadastro_candidato.css" type="text/css" id="" media="print, projection, screen" />
		
		{/if}
		<!-- End Stylesheets -->
		
		<!-- Begin Javascript -->
		<script type="text/javascript" src="{#jsLibDir#}jquery.js"></script>
		
		{if $page == "login"}
		
		<script type="text/javascript" src="{#jsLibDir#}sha1-min.js"></script>
		{/if}
		
		{if $page == "curriculo" || $page == "cadastro"}
		
		<script type="text/javascript" src="{#jsLibDir#}jquery.validate.js"></script>
		<script type="text/javascript" src="{#jsLibDir#}jquery.ui.core.js"></script> 
		<script type="text/javascript" src="{#jsLibDir#}jquery.ui.widget.js"></script> 
		<script type="text/javascript" src="{#jsLibDir#}jquery.ui.datepicker.js"></script>
		<script type="text/javascript" src="{#jsLibDir#}jquery.ui.tabs.js"></script>
		<script type="text/javascript" src="{#jsLibDir#}jquery.alphanumeric.js"></script>
		
		{/if}
		
		{include file="jsReady\open.tpl"}
		
		{if $page == "index"}
		{include file="index\jsReady.tpl"}
		{/if}
		
		{if $page == "login"}
		{include file="login\jsReady.tpl"}
		{/if}
		
		{if $page == "curriculo" || $page == "content" || $page == "cadastro"}
		{include file="content\jsReady.tpl"}
		{/if}
		
		{if $page == "cadastro"}
		{include file="forms\cadastro_candidato\jsReady.tpl"}
		{/if}
		
		{if $page == "curriculo"}
		{include file="forms\curriculo_candidato\jsReady.tpl"}
		{/if}
		
		{include file="jsReady\close.tpl"}
		
		<!-- End Javascript -->

	</head>
	<body>
		
		<!-- Background -->
		<div id="background">
			<img src="{#templateDir#}resources/images/background.jpg" width="100%" height="100%" alt="background" />
		</div>
		
		<!-- Begin Wrapper -->
		<div id="wrapper">
			
			<!-- Begin Header -->
			<div id="header">
				
				<!-- Logo -->
				<a id="logo" href="" title=""><img src="{#templateDir#}resources/images/logo.png" alt="Logo" /></a>
				
				<!-- Menu -->
				<ul id="menu">
					<li><a href="{#root#}index.php" title="P�gina Inicial">P�gina Inicial</a></li>
					<li><a href="{#root#}candidato/" title="Meu Cadastro">Meu Cadastro</a></li>
					<li><a href="{#root#}" title="Vagas">Vagas</a></li>
					<li><a href="{#root#}login.php" title="Login">Login</a></li>
				</ul>
				
			</div>
			<!-- End Header -->
			
			<!-- Begin Content -->
			<div id="content">