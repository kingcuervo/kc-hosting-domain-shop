<?php
session_start();
if($_SESSION["plan"]=="PLAN 1"){
$preciohost = 5900.00;
$_SESSION["preciohost"] = 5900.00;
}
elseif($_SESSION["plan"]=="PLAN 2"){
$preciohost = 7850.00;
$_SESSION["preciohost"] = 7850.00;
}
elseif($_SESSION["plan"]=="PLAN 3"){
$preciohost = 9500.00;
$_SESSION["preciohost"] = 9500.00;
}
if($_SESSION["sufijodom"]==".com.ve" or $_SESSION["sufijodom"]==".net.ve" or $_SESSION["sufijodom"]==".org.ve" or $_SESSION["sufijodom"]==".info.ve"){
$preciodom = 0.00;
$_SESSION["preciodom"] = 0.00;
} else {$preciodom = 1200.00;$_SESSION["preciodom"] = 1200.00;}
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
<div id="domain1-text1">PASO #2:</div>
<div id="domain1-text2">CONFIRMAR EL TOTAL DEL PEDIDO</div>
</div>
<div id="domain1-right">
<div id="domain1-text3">PLAN SELECCIONADO: <?php echo $_SESSION["plan"]; ?></div>
<div id="domain1-text4">DOMINIO SELECCIONADO: <?php echo $_SESSION["dominioelegido"]; ?></div>
</div>
</div>
<div id="domain2">
<form action="" method=post>
<table style="margin-left: 20px;margin-top: 15px;">
<tbody><tr style="
    font-size: 22px;
">
<td>Plan seleccionado:</td>
<td><?php echo $_SESSION["plan"]; ?></td>
</tr>
<tr>
<td>Costo:</td>
<td><?php echo $preciohost; ?></td>
<td>BsF</td>
</tr>
<tr>
</tr>
<tr style="
    font-size: 22px;
">
<td>Dominio seleccionado:</td>
<td><?php echo $_SESSION["dominioelegido"]; ?></td>
</tr>
<tr>
<td>Costo:</td>
<td><?php echo $preciodom; ?></td>
<td>BsF</td>
</tr>
<tr></tr><tr></tr><tr></tr>
<tr></tr>
<tr></tr><tr></tr>
<tr style="
    font-size: 22px;
"><td><strong>Total:</strong></td><td><strong><?php $total = $preciodom + $preciohost; echo $total; $_SESSION['total'] = $total; ?></strong></td><td><strong>BsF</strong></td></tr>
</tbody></table>
</form>
<div style="width:960px;text-align:right;height:140px;margin-top:10px;"><div style="height:140px;width:480px;float:left;text-align:center;"><?php echo $respuesta ?></div><div style="height:140px;width:480px;float:left;text-align:center;vertical-align:middle;"><a href="create_account.php"><button style="font-family: inherit;font-size: 22px;">Siguiente paso</button></a></div></div>
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