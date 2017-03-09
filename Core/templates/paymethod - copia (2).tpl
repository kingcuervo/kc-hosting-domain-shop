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
<?php
// Using the ini_set()
ini_set("SMTP", "mail.creotuidea.com");
ini_set("sendmail_from", "atencionalcliente@creotuidea.com");
ini_set("smtp_port", "25");

// The message
//$message = "The mail message was sent with the following mail setting:\r\nSMTP = mail.zend.com\r\nsmtp_port = 25\r\nsendmail_from = YourMail@address.com";
$message = '
<img src="http://creotuidea.com/Private/Images/logo.png"><br>
<p>
Estimado <strong>Jose Ramirez</strong><br>
<br>
<strong>Su pedido ha sido procesado con éxito!</strong>
<br><br>
La presente es para notificarle que su pedido ha sido procesado con éxito, por lo que en breve se procederá a la activación de los productos y servicios contratados. 
<br><br>
Para poder realizar la activación de de los productos y/o servicios contratados es necesario que envie una copia del recibo de pago<br><br>
<strong>Datos del Pedido: </strong>
<br>
<strong>Dominio:</strong> creotuidea105.com.ve <br>
Tipo: Registro <br>
Periodo: 1 Año <br>
Importe: Bs. 0.00 (1 Año Gratis) <br><br>

<strong>Plan de Hosting:</strong> Plan #1 <br>
Periodo: Anual <br>
Importe: Bs. 5192.00 <br><br>

Sub-Total: Bs. 5192.00 <br>
IVA: Bs. 708.00 <br>
<strong>TOTAL:</strong> Bs. 5900.00 <br><br>

Una vez haya sido confirmado su pago recibirá un correo electrónico, en el que le facilitaremos sus datos de acceso y gestión de sus productos.<br><br>

Gracias por preferirnos!<br><br><br>


Si tiene cualquier consulta, no dude en contactar con nosotros... <br><br>

Reciba un cordial saludo.<br><br>
<strong>
Departamento administrativo y de facturación</strong><br>
creotuidea.com     <br>
admincrea@creotuidea.com <br>
</p>
';

// Send
$headers = 'From: "Atención al cliente - Creo Tu Idea" atencionalcliente@creotuidea.com';

mail('andresramirezdev@gmail.com', 'Confirmación de pedido - creotuidea105.com.ve', $message, $headers);

echo "<p style='margin:10px'>Revisa tu correo electronico. Gracias por preferirnos.<BR></p>";
?>
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