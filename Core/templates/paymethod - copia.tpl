<?php
session_start();
?>
<?php
require_once ('Core/classes/mercadopago.php');

/* Obtén tus credenciales en:
* Argentina: https://www.mercadopago.com/mla/herramientas/aplicaciones
* Brasil: https://www.mercadopago.com/mlb/ferramentas/aplicacoes
* México: https://www.mercadopago.com/mlm/herramientas/aplicaciones
* Venezuela: https://www.mercadopago.com/mlv/herramientas/aplicaciones
* Colombia: https://www.mercadopago.com/mco/herramientas/aplicaciones
*/
$mp = new MP('2316869912685308', 'gbtf0Pts0N3luN0dOAtb9J04BNYTOKLs');

$preference_data = array(
    "items" => array(
       array(
           "title" => "Hosting: ".$_SESSION["plan"]." - Dominio: ".$_SESSION["dominioelegido"],
           "quantity" => 1,
           "currency_id" => "VEF",
           "unit_price" => $_SESSION['total']
       )
    )
);

$preference = $mp->create_preference ($preference_data);
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
<div id="domain1-text1">PASO #4:</div>
<div id="domain1-text2">PAGO DEL PEDIDO</div>
</div>
<div id="domain1-right">
<div id="domain1-text3">PLAN SELECCIONADO: <?php echo $_SESSION["plan"]; ?></div>
<div id="domain1-text4">DOMINIO SELECCIONADO: <?php echo $_SESSION["dominioelegido"]; ?></div>
</div>
</div>
<div id="domain2">
<?php if(!isset($_POST['check3'])) { ?>
<table style="margin-left: 20px;margin-top: 15px;">
<tr>
<td>
Puedes elegir uno de los siguientes metodos de pago:
</td>
</tr>
<tr>
<td>
MercadoPago
</td>
<td>
<a href="<?php echo $preference['response']['init_point']; ?>" name="MP-Checkout" class="blue-rn-m">Realizar pago hosting y dominio</a>
</td>
</tr>
<tr>
<td>
Banesco
</td><td>A nombre de: Jose Ramirez<br>Cuenta Corriente: 0134-0044-0404-4104-3740<br>Cedula: V-7604607</td>
</tr>
<tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
<tr>
<td>
Banco de Venezuela
</td><td>A nombre de: Andrea Ramirez<br>Cuenta Corriente: 0134-0044-0404-4104-3740<br>Cedula: V-22476570</td>
</tr>
</table>
<form action="" method=post>
<div style="width:960px;text-align:right;height:140px;margin-top:10px;"><div style="height:140px;width:480px;float:left;text-align:center;"><input type="submit" name="check3" value="Finalizar" style="font-family: inherit;font-size: 22px;"></div><div style="height:140px;width:480px;float:left;text-align:center;vertical-align:middle;"></div></div>
</form>
<?php } else {
require_once('Core/classes/class.phpmailer.php');
$mail = new PHPMailer();
//indico a la clase que use SMTP
$mail­>IsSMTP();
//permite modo debug para ver mensajes de las cosas que van ocurriendo
$mail­>SMTPDebug = 2;
//Debo de hacer autenticación SMTP
$mail­>SMTPAuth = true;
$mail­>SMTPSecure = "ssl";
//indico el servidor de Gmail para SMTP
$mail­>Host = "p3plcpnl0817.prod.phx3.secureserver.net";
//indico el puerto que usa Gmail
$mail­>Port = 465;
//indico un usuario / clave de un usuario de gmail
$mail­>Username = "atencionalcliente@creotuidea.com";
$mail­>Password = "Atencioncti2014";
$mail­>SetFrom('atencionalcliente@creotuidea.com', 'Atención al cliente - Creo Tu Idea');
$mail­>AddReplyTo("atencionalcliente@creotuidea.com","Atención al cliente - Creo Tu Idea");
$mail­>Subject = "Confirmación de pedido - Creo Tu Idea";
$mail­>MsgHTML("Hola que tal, esto es el cuerpo del mensaje!");
//indico destinatario
$address = "andresramirezdev@gmail.com";
$mail­>AddAddress($address, "Jose Ramirez");
if(!$mail­>Send()) {
echo "Error al enviar: " . $mail­>ErrorInfo;
} else {
echo "Mensaje enviado!";
}
}?>
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
<script type="text/javascript" src="https://www.mercadopago.com/org-img/jsapi/mptools/buttons/render.js"></script>
</body>
</html>