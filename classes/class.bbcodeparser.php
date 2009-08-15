<?php

class bbcodeparser {	
	private $patterns = array ('/\[b\](.+)\[\/b\]/Uis',
                               '/\[i\](.+)\[\/i\]/Uis',
                               '/\[u\](.+)\[\/u\]/Uis',
                               '/\[url=(.+)\](.+)\[\/url\]/Ui',
                               '/\[img\](.+)\[\/img\]/Ui');
                            	
	private $new_tags = array ('<b>\1</b>', 
                        	   '<i>\1</i>',
                        	   '<u>\1</u>',
                        	   '<a href = "\1" target = "_blank">\2</a>',
                        	   '<img src = "\1" />');

	public function parse($text){
		return preg_replace($this->patterns, $this->new_tags, nl2br($text));
	}
}

?>