<?php
session_start();
if(isset($_POST["nameuss"])){
$_SESSION["nameuss"] = $_POST["nameuss"];
}
if(isset($_POST["mailuss"])){
$_SESSION["mailuss"] = $_POST["mailuss"];
}
if(isset($_POST["passworduss"])){
$_SESSION["passworduss"] = md5($_POST["passworduss"]);
}
if(isset($_POST["phoneuss"])){
$_SESSION["phoneuss"] = $_POST["phoneuss"];
}
if(isset($_POST["addressuss"])){
$_SESSION["addressuss"] = $_POST["addressuss"];
}

$hosting = $_SESSION["preciohost"];
$dominio = $_SESSION["preciodom"];
$pack = $hosting + $dominio;
$hostingsubprice = $hosting * 0.12;
$hostingprice = $hosting - $hostingsubprice;
$domainsubprice = $dominio * 0.12;
$domainprice = $dominio - $domainsubprice;
$subtotalprice = $domainprice + $hostingprice;
$ivaprice = $pack * 0.12;
$totalprice = $subtotalprice + $ivaprice;

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
</td><td>A nombre de: Jose Ramirez<br>Cuenta: 0134-0459-3645-9103-8507<br>Cedula: V-7604607</td>
</tr>
<tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
</table>
<form action="" method=post>
<div style="width:960px;text-align:right;height:140px;margin-top:10px;"><div style="height:140px;width:480px;float:left;text-align:center;"><input type="submit" name="check3" value="Finalizar" style="font-family: inherit;font-size: 22px;"></div><div style="height:140px;width:480px;float:left;text-align:center;vertical-align:middle;"></div></div>
</form>
<?php } else {
// Using the ini_set()
ini_set("SMTP", "mail.creotuidea.com");
ini_set("sendmail_from", "atencionalcliente@creotuidea.com");
ini_set("smtp_port", "25");

// The message
//$message = "The mail message was sent with the following mail setting:\r\nSMTP = mail.zend.com\r\nsmtp_port = 25\r\nsendmail_from = YourMail@address.com";
$message = '
<html>
<head>
  <title>Confirmación de pedido - '.$_SESSION["dominioelegido"].'</title>
</head>
<body>
<img src="http://creotuidea.com/Private/Images/logo.png"><br>
<p>
Estimado <strong style="text-transform: uppercase;">'.$_SESSION["nameuss"].'</strong><br>
<br>
<strong>Su pedido ha sido procesado con éxito!</strong><br>
<strong>Su codigo de pedido encriptado es: '.$_SESSION["passworduss"].'</strong>
<br><br>
La presente es para notificarle que su pedido ha sido procesado con éxito, una vez se haya confirmado el pago se procederá a la activación de los productos y servicios contratados. 
<br><br>
Para poder realizar la confirmación del pago es necesario que envie una copia del recibo de pago<br><br>
Datos para realizar pago en cuenta Banesco:<br>
Banco: Banesco<br>
Nombre: Jose Ramirez<br>
C.I. 7.604.607<br>
Nro. de Cuenta: 0134-0459-3645-9103-8507<br><br>
<strong>Datos del Pedido: </strong>
<br><br>
<strong>Dominio:</strong> '.$_SESSION["dominioelegido"].' <br>
Tipo: Registro <br>
Periodo: 1 Año <br>
Importe: Bs. '.$domainprice.'.00 (1 Año Gratis) <br><br>

<strong>Plan de Hosting:</strong> '.$_SESSION["plan"].' <br>
Periodo: Anual <br>
Importe: Bs. '.$hostingprice.'.00 <br><br>

Sub-Total: Bs. '.$subtotalprice.'.00 <br>
IVA: Bs. '.$ivaprice.'.00 <br>
<strong>TOTAL:</strong> Bs. '.$totalprice.'.00 <br><br>

Una vez haya sido confirmado su pago y activado sus servicios recibirá un correo electrónico en el que le facilitaremos sus datos de acceso y gestión de sus productos.<br><br>

Gracias por preferirnos!<br><br><br>


Si tiene cualquier inquietud sobre su pedido, no dude en contactar con nosotros... <br><br>

Reciba un cordial saludo.<br><br>
<strong><br>
Jose Ramirez<br>
Departamento administrativo y de facturación</strong><br>
Web: creotuidea.com     <br>
Email: admincrea@creotuidea.com <br>
</p>
</body>
</html>
';
// Send
$headers  =  'From: Departamento administrativo y de facturación <atencionalcliente@creotuidea.com>' . "\r\n" .
                'Reply-To: atencionalcliente@creotuidea.com' . "\r\n" .
				'Bcc: atencionalcliente@creotuidea.com' . "\r\n" .
                'X-Mailer: PHP/' . phpversion() . "\r\n" .
                'Content-Type: text/html; charset=ISO-8859-1'."\r\n".
                'MIME-Version: 1.0'."\r\n\r\n";
mail($_SESSION["mailuss"], 'Confirmación de pedido - '.$_SESSION["dominioelegido"].'', $message, $headers);

echo "<p style='margin:10px'>Revisa tu correo electronico, en breve te enviaremos mas información sobre tu pedido. Gracias por preferirnos.<BR>".$_SESSION["mailuss"]."</p>";
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