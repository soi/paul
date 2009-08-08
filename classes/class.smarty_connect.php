<?php

// load Smarty library
require('Smarty.class.php');

class smarty_connect extends Smarty 
{
   function smarty_connect()
   {
        // Class Constructor. 
        // These automatically get set with each new instance.

		$this->Smarty();

		$this->template_dir = 'D:\Programme\xampp\htdocs\openleaguecms\templates';
        $this->config_dir = 'D:\Programme\xampp\htdocs\openleaguecms\smarty\config';
        $this->cache_dir = 'D:\Programmieren\PHP\Classes\smarty\cache';
        $this->compile_dir = 'D:\Programmieren\PHP\Classes\smarty\templates_c';

		$this->assign('app_name', 'Intranet');
   }
}
?>
