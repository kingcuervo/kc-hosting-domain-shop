<?php
session_start();
?>
<html>
<head>
<title>Creo Tu Idea - Total pedido</title>
<link href='http://fonts.googleapis.com/css?family=Roboto:300' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="Private/Stylesheets/web.css">
<link rel="stylesheet" href="Private/Stylesheets/domain_total.css">
<link rel="stylesheet" href="Private/Stylesheets/payment.css">
</head>
<body>
<!--Cabecera-->
<div id="head">
<div id="top">
<div id="wrapper">
<div id="logo"></div>
<div id="menu">
<a href="#">Inicio</a>
<a href="#">Planes y tarifas</a>
<a href="#">Sobre nosotros</a>
<a href="#">Contacto</a>
</div>
</div>
</div>
</div>
<!-- Fin de cabecera -->
<div id="shadow">
<div id="wrapper">
<div id="left"></div>
<div id="right">
<div id="social" class="instagram"></div>
<div id="social" class="youtube"></div>
<div id="social" class="twitter"></div>
<div id="social" class="facebook"></div>
</div>
</div>
</div>
<!-- Metodo de pago -->
<div id="wrapper">
<div id="domain1">
<div id="domain1-left">
<div id="domain1-text1">PASO #3:</div>
<div id="domain1-text2">CREACIÓN DE LA CUENTA</div>
</div>
<div id="domain1-right">
<div id="domain1-text3">PLAN SELECCIONADO: <?php echo $_SESSION["plan"]; ?></div>
<div id="domain1-text4">DOMINIO SELECCIONADO: <?php echo $_SESSION["dominioelegido"]; ?></div>
</div>
</div>
<div id="domain2">
<form action="paymethod.php" method=post>
<table style="margin-left: 20px;margin-top: 15px;">
<tr>
<td>
Nombre y Apellido:
</td>
<td><input type="text" name="nameuss" style="font-family: inherit;font-size: 16px;width: 300px;"></td>
</tr>
<tr>
<td>
Correo electronico:
</td>
<td><input type="text" name="mailuss" style="font-family: inherit;font-size: 16px;width: 300px;"></td>
</tr>
<tr>
<td>
Contraseña:
</td>
<td><input type="password" name="passworduss" style="font-family: inherit;font-size: 16px;width: 300px;"></td>
</tr>
<tr>
<td>
Número de telefono:
</td>
<td><input type="text" name="phoneuss" style="font-family: inherit;font-size: 16px;width: 300px;"></td>
</tr>
<tr>
<td>
Direccion (Solo si es de Venezolano):
</td>
<td><input type="text" name="addressuss" style="font-family: inherit;font-size: 16px;width: 300px;"></td>
</tr>
</table>
<div style="width:960px;text-align:right;height:140px;margin-top:10px;"><div style="height:140px;width:480px;float:left;text-align:center;"><button style="font-family: inherit;font-size: 22px;">Siguiente paso</button></div><div style="height:140px;width:480px;float:left;text-align:center;vertical-align:middle;"></div></div>
</form>
</div>
<!-- Metodo de pago -->
<div id="payment">
<div id="payment-left">
<div id="payment-text1">¿AÚN NO TIENES LA WEB DE TU EMPRESA?</div>
<div id="payment-text2">EN CREO TU IDEA TENEMOS LA SOLUCIÓN A TUS PROBLEMAS.</div>
</div>
<div id="payment-right">
<div id="payment-text3">METODOS DE PAGO</div>
<div id="payment-text4">
<img src="Private/Images/visa.png" style="margin-right:5px;">
<img src="Private/Images/mastercard.png" style="margin-right:5px;">
<img src="Private/Images/paypal.png" style="margin-right: 5px;">
<img width="28px" height="28px" src="Private/Images/mpago.png">
</div>
</div>
</div>
</div>
<!-- Pie de pagina -->
<div id="footer">
<div id="wrapper">
COPYRIGHT 2014. <a href="http://twitter.com/creotuidea">CREO TU IDEA</a> - DISEÑADO Y PROGRAMADO POR <a href="http://twitter.com/andresjo_se">JOSE RAMIREZ</a>
</div>
</div>
</body>
</html>