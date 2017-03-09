<?php
session_start();
$_SESSION["plan"] = $_GET["plan"];
if(!isset($_GET["plan"])){
$_SESSION["plan"] = "Ninguno";
}
 $dominioelegido = "EN ESPERA";
if(isset($_POST['check'])) {
 
 if (!empty($_POST['domain_name'])){
 $name_domain = trim($_POST['domain_name']).$_POST['suffix'];
 $response = @dns_get_record($name_domain, DNS_ALL);
 if(empty($response)){
 $respuesta = "<H2 style='color:green;'>El dominio $name_domain está disponible.</H2>";
 $dominioelegido = $name_domain;
 $_SESSION["dominioelegido"] = $dominioelegido;
 $_SESSION["sufijodom"] = $_POST['suffix'];
 }else{
 $respuesta = "<H2 style='color:red;'>El dominio $name_domain está ocupado.</H2>";
 }
 }
 else {
 $respuesta = "<H2 style='color:red;'>Error: El dominio no puede estar vacio.</H2>";
 }
}
?>
<html>
<head>
<title>Creo Tu Idea - Comprobar disponibilidad del dominio</title>
<link href='http://fonts.googleapis.com/css?family=Roboto:300' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="Private/Stylesheets/web.css">
<link rel="stylesheet" href="Private/Stylesheets/domain_checker.css">
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
<div id="domain1-text1">PASO #1:</div>
<div id="domain1-text2">VERIFICAR DISPONIBILIDAD DEL DOMINIO</div>
</div>
<div id="domain1-right">
<div id="domain1-text3">PLAN SELECCIONADO: <?php echo $_SESSION["plan"]; ?></div>
<div id="domain1-text4">DOMINIO SELECCIONADO: <?php echo $dominioelegido; ?></div>
</div>
</div>
<div id="domain2">
<?php if($_SESSION["plan"]=="PLAN 1" or $_SESSION["plan"]=="PLAN 2" or $_SESSION["plan"]=="PLAN 3"){ ?>
<form action="" method=post>
<table style="margin-left: 20px;margin-top: 15px;">
<tr>
<td>Dominio:</td>
<td> <input type="text" name="domain_name" style="font-family: inherit;font-size: 16px;"></td>
<td>
<select name="suffix" style="font-family: inherit;font-size: 16px;height: 27px;">
<option value=".com">.com</option>
<option value=".net">.net</option>
<option value=".org">.org</option>
<option value=".com">.com.ve</option>
<option value=".net">.net.ve</option>
<option value=".org">.org.ve</option>
<option value=".org">.info.ve</option>
</select>
 
</td>
<tr>
<td align="right" colspan="3"><input type="submit" name="check" value="Verificar disponibilidad" style="font-family: inherit;font-size: 16px;"></td>
</tr>
</tr>
</table>
</form>
<div style="width:960px;text-align:right;height:140px;margin-top:10px;"><div style="height:140px;width:480px;float:left;text-align:center;"><?php echo $respuesta ?></div><div style="height:140px;width:480px;float:left;text-align:center;vertical-align:middle;"><a href="domain_total.php"><button <?php if($dominioelegido=="EN ESPERA"){ ?> disabled="disabled" <?php } else{}?> style="font-family: inherit;font-size: 22px;">Siguiente paso</button></a></div></div>
<?php } else { ?>
<p style="margin:10px;">
Aún no has elegido ningun plan. Debes escoger un plan en la pagina principal para poder iniciar el proceso.<br>Haz <a href="../">clic aqui</a> para ir a la pagina principal</p>
<?php } ?>
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