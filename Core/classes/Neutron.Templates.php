<?php
class template {
	static $template = array();
	public function get($page){
	include('Core/templates/'.$page.'.tpl');
	}
}
?>