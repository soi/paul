<? 

class password {

var $lowercase;
var $uppercase;
var $number;
var $specchar;
Var $len;
Var $prefix;

	function password($length=10,$prefix='') {
		$this->len = $length;
		$this->prefix = $prefix;
		$this->lowercase = true;
		$this->uppercase = true;
		$this->number = true;
		$this->specchar = false;	
	}

	function generate() {
		if ($this->uppercase) {
			$chars = array("A","B","C","D","E","F","G","H","I","J","K",
	                       "L","M","N","O","P","Q",
			       "R","S","T","U","V","W",
			       "X","Y","Z");
		}
		if ($this->lowercase) {
			$chars[] = "a";
			$chars[] = "b";
			$chars[] = "c";
			$chars[] = "d";
			$chars[] = "e";
			$chars[] = "f";
			$chars[] = "g";
			$chars[] = "h";
			$chars[] = "i";
			$chars[] = "j";
			$chars[] = "k";
			$chars[] = "l";
			$chars[] = "m";
			$chars[] = "n";
			$chars[] = "o";
			$chars[] = "p";
			$chars[] = "q";
			$chars[] = "r";
			$chars[] = "s";
			$chars[] = "t";
			$chars[] = "u";
			$chars[] = "v";
			$chars[] = "w";
			$chars[] = "x";
			$chars[] = "y";
			$chars[] = "z";
		}
		if ($this->number) {
			$chars[] = "1";
			$chars[] = "2";
			$chars[] = "3";
			$chars[] = "4";
			$chars[] = "5";
			$chars[] = "6";
			$chars[] = "7";
			$chars[] = "8";
			$chars[] = "9";
			$chars[] = "0";
		}
		if ($this->specchar) {
			$chars[] = '!';
			$chars[] = '@';
			$chars[] = '#';
			$chars[] = "$";
			$chars[] = '%';
			$chars[] = '^';
			$chars[] = '&';
			$chars[] = '*';
			$chars[] = '(';
			$chars[] = ')';
			$chars[] = '{';
			$chars[] = '}';
			$chars[] = '[';
			$chars[] = ']';
			$chars[] = '<';
			$chars[] = '>';
			$chars[] = '?';
			$chars[] = "=";
			$chars[] = '+';
			$chars[] = '-';
			$chars[] = "_";
			$chars[] = "/";
		}

		$max_elements = count($chars) - 1;
		$newpw = $this->prefix;
		$l = $this->len - strlen($this->prefix);
		for ($i = 0;$i<$l;$i++)
		{ 
 			srand((double)microtime()*1000000);
			$newpw .= $chars[rand(0,$max_elements)];
		}
		return  $newpw;
	}
}
?>
