<?php

#
# Template (Version 2.0)
#
# Klasse zum Parsen von Templates
#
# Autor:            Patrick Canterino <patrick@patshaping.de>
# Letzte Aenderung: 3.7.2006
#

class Template
{
 var $file;
 var $template;
 var $original;
 var $vars = array();
 var $defined_vars = array();
 var $loop_vars = array();

 # get_template()
 #
 # Kompletten Vorlagentext zurueckgeben
 #
 # Parameter: -keine-
 #
 # Rueckgabe: Kompletter Vorlagentext (String)

 function get_template()
 {
  return $this->template;
 }

 # set_template()
 #
 # Kompletten Vorlagentext aendern
 #
 # Parameter: Vorlagentext
 #
 # Rueckgabe: -nichts- (Template-Objekt wird modifiziert)

 function set_template($text)
 {
  $this->template = $text;
 }

 # add_text()
 #
 # Vorlagentext ans Template-Objekt anhaengen
 #
 # Parameter: Vorlagentext
 #
 # Rueckgabe: -nichts- (Template-Objekt wird modifiziert)

 function add_text($text)
 {
  $this->set_template($this->get_template().$text);
 }

 # read_file()
 #
 # Einlesen einer Vorlagendatei und {INCLUDE}-Anweisungen ggf. verarbeiten
 # (Text wird an bereits vorhandenen Text angehaengt)
 #
 # Parameter: 1. Datei zum Einlesen
 #            2. Status-Code (Boolean):
 #               true  => {INCLUDE}-Anweisungen nicht verarbeiten
 #               false => {INCLUDE}-Anweisungen verarbeiten (Standard)
 #
 # Rueckgabe: -nichts- (Template-Objekt wird modifiziert)

 function read_file($file,$not_include=0)
 {
  $this->file = $file;

  if(filesize($file) > 0)
  {
   $fp = fopen($file,'r');
   if(!$fp) die;
   $content = fread($fp,filesize($file));
   fclose($fp);
  }
  else $content = '';

  $this->add_text($content);
  $this->save_state();

  if(!$not_include) $this->parse_includes();
 }

 # set_var()
 #
 # Wert einer Variable setzen
 #
 # Parameter: 1. Name der Variable
 #            2. Wert, den die Variable erhalten soll
 #
 # Rueckgabe: -nichts- (Template-Objekt wird modifiziert)

 function set_var($var,$content)
 {
  $this->vars[$var] = $content;
 }

 # get_var()
 #
 # Wert einer Variable zurueckgeben
 #
 # Parameter: (optional) Variablenname
 #
 # Rueckgabe: Wert der Variable;
 #            wenn die Variable nicht existiert, false;
 #            wenn kein Variablenname angegeben wurde, wird ein
 #            Array mit den Variablennamen zurueckgegeben

 function get_var($var=false)
 {
  if($var !== false)
  {
   if(isset($this->vars[$var]))
   {
    return $this->vars[$var];
   }
   else
   {
    return false;
   }
  }
  else
  {
   return array_keys($this->vars);
  }
 }

 # set_loop_data()
 #
 # Daten fuer eine Schleife setzen
 #
 # Parameter: 1. Name der Schleife
 #            2. Array mit den Arrays mit den Variablen fuer
 #               die Schleifendurchgaenge
 #
 # Rueckgabe: -nichts- (Template-Objekt wird modifiziert)

 function set_loop_data($loop,$data)
 {
  $this->loop_vars[$loop] = $data;
 }

 # add_loop_data()
 #
 # Daten fuer einen Schleifendurchgang hinzufuegen
 #
 # Parameter: 1. Name der Schleife
 #            2. Array mit den Variablen fuer den
 #               Schleifendurchgang
 #
 # Rueckgabe: -nichts- (Template-Objekt wird modifiziert)

 function add_loop_data($loop,$data)
 {
  if(isset($this->loop_vars[$loop]) && is_array($this->loop_vars[$loop]))
  {
   array_push($this->loop_vars[$loop],$data);
  }
  else
  {
   $this->loop_vars[$loop] = array($data);
  }
 }

 # parse()
 #
 # In der Template definierte Variablen auslesen, Variablen
 # ersetzen, {IF}- und {TRIM}-Bloecke parsen
 #
 # Parameter: -nichts-
 #
 # Rueckgabe: -nichts- (Template-Objekt wird modifiziert)

 function parse()
 {
  # Zuerst die Schleifen parsen

  if(is_array($this->loop_vars) && ($loops = array_keys($this->loop_vars)))
  {
   foreach($loops as $loop)
   {
    $this->parse_loop($loop);
   }
  }

  # Normale Variablen durchgehen

  if(($vars = $this->get_var()) !== false && is_array($vars))
  {
   foreach($vars as $var)
   {
    $val = $this->get_var($var);

    $this->parse_if_block($var,$val);

    if(is_array($val))
    {
     $this->fillin_array($var,$val);
    }
    else
    {
     $this->fillin($var,$val);
    }

    unset($val);
   }
  }

  # Jetzt dasselbe mit denen, die direkt in der Template-Datei definiert
  # sind, machen. Ich weiss, dass das eine ziemlich unsaubere Loesung ist,
  # aber es funktioniert

  $this->get_defined_vars();

  foreach($this->defined_vars as $var)
  {
   $val = $this->get_var($var);

   $this->parse_if_block($var,$val);
   $this->fillin($var,$val);

   unset($val);
  }

  # {TRIM}-Bloecke entfernen

  $this->parse_trim_blocks();
 }

 # fillin()
 #
 # Variablen durch Text ersetzen
 #
 # Parameter: 1. Variable zum Ersetzen
 #            2. Text, durch den die Variable ersetzt werden soll
 #
 # Rueckgabe: -nichts- (Template-Objekt wird modifiziert)

 function fillin($var,$text)
 {
  $template = $this->get_template();
  $template = str_replace('{'.$var.'}',$text,$template);

  $this->set_template($template);
 }

 # fillin_array()
 #
 # Variable durch Array ersetzen
 #
 # Parameter: 1. Variable zum Ersetzen
 #            2. Array, durch das die Variable ersetzt werden soll
 #            3. Zeichenkette, mit der das Array verbunden werden soll
 #               (Standard: '')
 #
 # Rueckgabe: -nichts- (Template-Objekt wird modifiziert)

 function fillin_array($var,$array,$glue='')
 {
  $this->fillin($var,implode($glue,$array));
 }

 # to_file()
 #
 # Template in Datei schreiben
 #
 # Parameter: Datei-Handle
 #
 # Rueckgabe: Status-Code (Boolean)

 function to_file($path)
 {
  fopen($path, "w+"); 
  return @fwrite(fopen($path, "w+"),$this->get_template());
 }

 # reset()
 #
 # Den gesicherten Stand des Template-Textes sichern
 #
 # Parameter: -nichts-
 #
 # Rueckgabe: -nichts- (Template-Objekt wird modifiziert)

 function reset()
 {
  $this->template = $this->original;
 }

 # save_state()
 #
 # Aktuellen Stand des Template-Textes sichern
 # (alte Sicherung wird ueberschrieben)
 #
 # Parameter: -nichts-
 #
 # Rueckgabe: -nichts- (Template-Objekt wird modifiziert)

 function save_state()
 {
  $this->original = $this->template;
 }

 # parse_loop()
 #
 # Eine Schleife parsen
 #
 # Parameter: Name der Schleife
 #
 # Rueckgabe: -nichts- (Template-Objekt wird modifiziert)

 function parse_loop($name)
 {
  $template = $this->get_template();
  if(strpos($template,'{LOOP '.$name.'}') === false) return;

  $offset   = 0;
  $name_len = strlen($name);

  while(($begin = strpos($template,'{LOOP '.$name.'}',$offset)) !== false)
  {
   if(($end = strpos($template,'{ENDLOOP}',$begin+6+$name_len)) !== false)
   {
    $block   = substr($template,$begin,$end+9-$begin);
    $content = substr($block,$name_len+7,-9);

    $parsed_block = '';

    for($x=0;$x<count($this->loop_vars[$name]);$x++)
    {
     $loop_data = $this->loop_vars[$name][$x];
     $loop_vars = array_keys($loop_data);

     $ctpl = new Template;
     $ctpl->set_template($content);

     foreach($loop_vars as $loop_var)
     {
      $ctpl->set_var($name.'.'.$loop_var,$loop_data[$loop_var]);
     }

     $ctpl->parse();
     $parsed_block .= $ctpl->get_template();

     unset($ctpl);
    }

    $template = str_replace($block,$parsed_block,$template);
    $offset   = $begin+strlen($parsed_block);
   }
   else break;
  }

  $this->set_template($template);
 }

 # get_defined_vars()
 #
 # In der Template-Datei definierte Variablen auslesen
 #
 # Parameter: -nichts-
 #
 # Rueckgabe: -nichts- (Template-Objekt wird modifiziert)

 function get_defined_vars()
 {
  $template = $this->get_template();
  if(strpos($template,'{DEFINE ') === false) return;

  $offset = 0;

  while(strpos($template,'{DEFINE ',$offset) !== false)
  {
   $begin  = strpos($template,'{DEFINE ',$offset)+8;
   $offset = $begin;

   $name    = '';
   $content = '';

   $var_open     = 0;
   $name_found   = 0;
   $define_block = 0;

   for($x=$begin;$x<strlen($template);$x++)
   {
    if($template[$x] == "\012" || $template[$x] == "\015")
    {
     # Wenn in einem {DEFINE}-Block ein Zeilenumbruch gefunden wird,
     # brechen wir mit dem Parsen des Blockes ab

     break;
    }

    if($var_open == 1)
    {
     if($template[$x] == '"')
     {
      # Der Inhalt der Variable ist hier zu Ende

      $var_open = 0;

      if($template[$x+1] == '}')
      {
       # Hier ist der Block zu Ende

       if($this->get_var($name) === false)
       {
        # Die Variable wird nur gesetzt, wenn sie nicht bereits gesetzt ist

        $this->set_var($name,$content);
        array_push($this->defined_vars,$name);
       }

       # {DEFINE}-Block entfernen

       $pre  = substr($template,0,$begin-8);
       $post = substr($template,$x+2);

       $template = $pre.$post;

       # Fertig!

       $offset = strlen($pre);
       break;
      }
     }
     elseif($template[$x] == '\\')
     {
      # Ein Backslash wurde gefunden, er dient zum Escapen von Zeichen

      if($template[$x+1] == 'n')
      {
       # "\n" in Zeilenumbrueche umwandeln

       $content .= "\n";
      }
      else $content .= $template[$x+1];

      $x++;
     }
     else $content .= $template[$x];
    }
    else
    {
     if($name_found == 1)
     {
      if($var_open == 0)
      {
       if($template[$x] == '"') $var_open = 1;
       else break;
      }
     }
     else
     {
      # Variablennamen auslesen

      if($template[$x] == '}' && $name != '')
      {
       # Wir haben einen {DEFINE}-Block

       $name_found   = 1;
       $define_block = 1;

       # Alles ab hier sollte mit dem Teil verbunden werden, der das
       # {DEFINE} in einer Zeile verarbeitet

       # Der Parser fuer {DEFINE}-Bloecke ist nicht rekursiv, was auch
       # nicht noetig sein sollte

       if(($end = strpos($template,'{ENDDEFINE}',$x)) !== false)
       {
        $x++;

        $content = substr($template,$x,$end-$x);

        if($this->get_var($name) === false)
        {
         # Die Variable wird nur gesetzt, wenn sie nicht bereits gesetzt ist

         $this->set_var($name,$content);
         array_push($this->defined_vars,$name);
        }

        $pre  = substr($template,0,$begin-8);
        $post = substr($template,$end+11);

        $template = $pre.$post;

        # Fertig!

        $offset = strlen($pre);
        break;
       }
       else break;
      }
      elseif($template[$x] != ' ')
      {
       $name .= $template[$x];
      }
      elseif($name != '')
      {
       $name_found = 1;
      }
      else break;
     }
    }
   }
  }

  $this->set_template($template);
 }

 # parse_if_block()
 #
 # IF-Bloecke verarbeiten
 #
 # Parameter: 1. Name des IF-Blocks (das, was nach dem IF steht)
 #            2. Status-Code (true  => Inhalt anzeigen
 #                            false => Inhalt nicht anzeigen
 #            3. true  => Verneinten Block nicht parsen
 #               false => Verneinten Block parsen (Standard)
 #
 # Rueckgabe: -nichts- (Template-Objekt wird modifiziert)

 function parse_if_block($name,$state,$no_negate=0)
 {
  $template = $this->get_template();

  $count = 0;

  while(strpos($template,'{IF '.$name.'}') !== false)
  {
   # Das alles hier ist nicht wirklich elegant geloest...
   # ... aber solange es funktioniert... ;-)

   $count++;

   $start    = strpos($template,'{IF '.$name.'}');
   $tpl_tmp  = substr($template,$start);
   $splitted = explode('{ENDIF}',$tpl_tmp);

   $block = ''; # Kompletter bedingter Block
   $ifs   = 0;  # IF-Zaehler (wird fuer jedes IF erhoeht und fuer jedes ENDIF erniedrigt)

   # {IF}

   for($x=0;$x<count($splitted);$x++)
   {
    if($x == count($splitted)-1) die('Nesting error found while parsing IF block "'.$name.'" nr. '.$count.' in template file "'.$this->file.'"');

    $ifs += substr_count($splitted[$x],'{IF '); # Zum Zaehler jedes Vorkommen von IF hinzuzaehlen
    $ifs--;                                     # Zaehler um 1 erniedrigen
    $block .= $splitted[$x].'{ENDIF}';          # Daten zum Block hinzufuegen

    if($ifs == 0)
    {
     # Zaehler wieder 0, also haben wir das Ende des IF-Blocks gefunden :-))

     break;
    }
   }

   $if_block = substr($block,strlen($name)+5,-7); # Alles zwischen {IF} und {ENDIF}

   # {ELSE}

   $else_block = ''; # Alles ab {ELSE}
   $ifs        = 0;  # IF-Zaehler

   $splitted = explode('{ELSE}',$if_block);

   for($x=0;$x<count($splitted);$x++)
   {
    $ifs += substr_count($splitted[$x],'{IF ');    # Zum Zaehler jedes Vorkommen von IF hinzuzaehlen
    $ifs -= substr_count($splitted[$x],'{ENDIF}'); # Vom Zaehler jedes Vorkommen von ENDIF abziehen

    if($ifs == 0)
    {
     # Zaehler 0, also haben wir das Ende des IF-Abschnitts gefunden

     # Aus dem Rest den ELSE-Block zusammenbauen

     for($y=$x+1;$y<count($splitted);$y++)
     {
      $else_block .= '{ELSE}'.$splitted[$y];
     }

     if($else_block)
     {
      $if_block   = substr($if_block,0,strlen($if_block)-strlen($else_block));
      $else_block = substr($else_block,6);
     }

     break;
    }
   }

   # Block durch die jeweiligen Daten ersetzen

   $replacement = ($state) ? $if_block : $else_block;

   $template = str_replace($block,$replacement,$template);
  }

  $this->set_template($template);

  # Evtl. verneinte Form parsen

  if(!$no_negate)
  {
   $this->parse_if_block('!'.$name,!$state,1);
  }
 }

 # parse_trim_blocks()
 #
 # {TRIM}-Bloecke parsen
 #
 # Dieser Parser ist nicht rekursiv, was auch nicht
 # noetig sein sollte.
 #
 # Parameter: -nichts-
 #
 # Rueckgabe: -nichts- (Template-Objekt wird modifiziert)

 function parse_trim_blocks()
 {
  $template = $this->get_template();
  if(strpos($template,'{TRIM}') === false) return;

  $offset = 0;

  while(($begin = strpos($template,'{TRIM}',$offset)) !== false)
  {
   if(($end = strpos($template,'{ENDTRIM}',$begin+6)) !== false)
   {
    $block    = substr($template,$begin,$end+9-$begin);
    $content  = substr($block,6,-9);

    $trimmed  = trim($content);

    $template = str_replace($block,$trimmed,$template);

    $offset   = $begin+strlen($trimmed);
   }
   else break;
  }

  $this->set_template($template);
 }

 # parse_condtag()
 #
 # Bedingungstags in einem Vorlagentext verarbeiten
 #
 # Parameter: 1. Tagname
 #            2. Status-Code (true  => Tag-Inhalt anzeigen
 #                            false => Tag-Inhalt nicht anzeigen
 #
 # Rueckgabe: -nichts- (Template-Objekt wird modifiziert)

 function parse_condtag($condtag,$state)
 {
  $template = $this->get_template();

  while(strpos($template,'<'.$condtag.'>') !== false)
  {
   $start = strpos($template,'<'.$condtag.'>');                                        # Beginn des Blocks
   $end   = strpos($template,'</'.$condtag.'>')+strlen($condtag)+3;                    # Ende des Blocks

   $extract = substr($template,$start,$end-$start);                                    # Kompletten Bedingungsblock extrahieren...

   $replacement = ($state) ? substr($extract,strlen($condtag)+2,0-strlen($condtag)-3) : '';

   $template = str_replace($extract,$replacement,$template);                           # Block durch neue Daten ersetzen
  }
  $this->set_template($template);
 }

 # parse_includes()
 #
 # {INCLUDE}-Anweisungen verarbeiten
 #
 # Parameter: -nichts-
 #
 # Rueckgabe: -nichts- (Template-Objekt wird modifiziert)

 function parse_includes()
 {
  $template = $this->get_template();
  if(strpos($template,'{INCLUDE ') === false) return;

  $offset = 0;

  $y = 0;

  while(($begin = strpos($template,'{INCLUDE ',$offset)) !== false)
  {
   $y++;

   $start  = $begin+9;
   $offset = $start;
   $long   = 0;

   if($template[$start] == '"')
   {
    $long = 1;
    $start++;
   }

   $file = '';
   $skip = 0;

   for($x=$start;$x<strlen($template);$x++)
   {
    if($template[$x] == "\012" || $template[$x] == "\015")
    {
     $skip = 1;
     break;
    }
    elseif($long == 0 && $template[$x] == ' ')
    {
     $skip = 1;
     break;
    }
    elseif($long == 1 && $template[$x] == '"')
    {
     if($template[$x+1] != '}') $skip = 1;
     break;
    }
    elseif($long == 0 && $template[$x] == '}')
    {
     break;
    }
    else
    {
     $file .= $template[$x];
    }
   }

   if($skip == 1) continue;

   if($file != '')
   {
    $filepath = $file;

    $is_absolute = (strtoupper(substr(PHP_OS,0,3)) === 'WIN')
                 ? preg_match('!^([a-z]:)?/!i',$file)
                 : preg_match('!^/!',$file);

    if(!$is_absolute)
    {
     if(!empty($this->file)) $dir = dirname($this->file);
     else $dir = '.';

     $dir = str_replace('\\','/',$dir);

     if(!preg_match('!/+$!',$dir)) $dir .= '/';

     $filepath = $dir.$file;
    }

    if(is_file($filepath))
    {
     $inc = new Template;
     $inc->read_file($filepath);

     $end = ($long == 1)
          ? $start + strlen($file) + 2
          : $start + strlen($file) + 1;

     $pre  = substr($template,0,$begin);
     $post = substr($template,$end);

     $template = $pre.$inc->get_template().$post;
     $offset   = strlen($pre)+strlen($inc->get_template());

     unset($inc);
    }
   }
  }

  $this->set_template($template);
 }
}

#
### Ende ###

?>