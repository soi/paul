<?php
// default image pointers
// edit these to point at images on your server if you want to test manipulations.

$resource_image = 'created_images/resource_image.jpg';
	// the image to manipulate
$base_size_image = 'created_images/base_size_image.jpg';
	// the base_size_image defines the size of the created image - imagine a box wherein the proportional created image must reside.
	// if you set this to the same as the resource_image then no size change will occur
$temp_save_image = 'created_images/temp_save_image.jpg';
	// save path and filename

if(isset($_POST['submit']) && $_POST['submit'] == "transform")
	{
	include_once('thumbnail_create.php');
	if(isset($_POST['ri']) && $_POST['ri'] !== "")
		{
		$resource_image = $_POST['ri'];
		}
	if(isset($_POST['bi']) && $_POST['bi'] !== "")
		{
		$base_size_image = $_POST['bi'];
		}
	$a = new Thumbnail($resource_image,$base_size_image,$temp_save_image,85);
		// instantiate the object - 85% compression should do for thumbnails
	$trans_str = '';
	for($ci = 1; $ci < 7; $ci++)
		{
		$tvar = '';
		eval("\$tvar = \$_POST['t" .$ci. "'];");
		if($tvar !== '')
			{
			$tvar = stripslashes($tvar);
			eval("\$a->".$tvar.";");
			$trans_str .= '$var->'.$tvar.';<br />';
			}
		}
	$a->create();
	}

?><html>
<head>
<title>extensive GD2+ image manipulation - test/help page</title>
<style>
body
	{
	font-family: Verdana, Arial, Helvetica;
	font-weight: 600;
	}
</style>

</head>
<body bgcolor="#FFFFFF">
	<table border="0" cellpadding="0" cellspacing="0">
	 <tr>
	  <td align="center" width="560" valign="center">Transformations Used
	  <br /><br />$var = new Thumbnail(<span style="color:#990000">'resource.jpg','base_image.jpg','output_image.jpg',85,''</span>);
	  <br /><?php echo $trans_str; ?>$var->create();
	  <br />
	  <br /><img name="image" src="<?php echo $temp_save_image; ?>" alt="test image create" /><br /><br /></td>
	  <td align="right" style="padding:10px; background:ButtonFace; font:MessageBox; font:Message-Box; border:4px inset Buttonface;">
		<form method="post" action="<?php echo $_SERVER['REQUEST_URI']; ?>">
		Resource Image: <input type="text" name="ri" value="<?php echo stripslashes($_POST['ri']); ?>" />
		<br />Base Size Image: <input type="text" name="bi" value="<?php echo stripslashes($_POST['bi']); ?>" />
		<br /><br /><span title="bevel
greyscale
ellipse
round_edges
merge
frame
drop_shadow
motion_blur">Transformations...hover for list</span>
		<p id="notes">usage notes here</p>
		<br />1st call: <input type="text" name="t1" onkeydown="chx(this.value)" value="<?php echo stripslashes($_POST['t1']); ?>" />
		<br />2nd call: <input type="text" name="t2" onkeydown="chx(this.value)" value="<?php echo stripslashes($_POST['t2']); ?>" />
		<br />3rd call: <input type="text" name="t3" onkeydown="chx(this.value)" value="<?php echo stripslashes($_POST['t3']); ?>" />
		<br />4th call: <input type="text" name="t4" onkeydown="chx(this.value)" value="<?php echo stripslashes($_POST['t4']); ?>" />
		<br />5th call: <input type="text" name="t5" onkeydown="chx(this.value)" value="<?php echo stripslashes($_POST['t5']); ?>" />
		<br />6th call: <input type="text" name="t6" onkeydown="chx(this.value)" value="<?php echo stripslashes($_POST['t6']); ?>" />
		<br /><br /><input type="submit" name="submit" value="transform" />
		</form>
	  </td>
	 </tr>
	</table>
	<script type="text/javascript">
	/*<[CDATA[*/
	function chx(data)
		{
		if (data.length == 2)
			{
			if (data == "be") 
				{
				notez = "bevel ( edge width, hex light colour, hex dark colour )";
				}
			else if (data == "gr") 
				{
				notez = "greyscale ( red ratio, green ratio, blue ratio )";
				}
			else if (data == "el") 
				{
				notez = "ellipse ( hex background colour )";
				}
			else if (data == "ro") 
				{
				notez = "round_edges ( edge_radius, background colour, anti-alias width )";
				}
			else if (data == "me") 
				{
				notez = "merge ( merge image, x start [neg = from right], y start [neg = from base], opacity, transparent colour on merge image )";
				}
			else if (data == "fr") 
				{
				notez = "frame ( hex light colour, hex dark colour, int width of mid bit )";
				}
			else if (data == "dr") 
				{
				notez = "drop_shadow ( shadow width, hex shadow colour, hex background colour )";
				}
			else if (data == "mo") 
				{
				notez = "motion_blur ( int number of lines, hex background colour )";
				}
			document.getElementById('notes').innerHTML = notez;
			}
		}
	/*]]>*/
	</script>
	<br /><br /><span style="font-size:10px">If you have edited the first few PHP variables to point at images somewhere, you can just add the transformations. Otherwise, just input an image URL to both the top boxes.
<br /><br />Hover over the 'Transformations...' line for list of effects.
<br />Type the first 3 letters of an effect into the 'call' boxes for usage notes.
<br /><br />Note: Hex values must NOT contain a # - eg DF78A2 and NOT #DF78A2
<br />example calls - 1. ellipse(FFFFFF) 2. bevel(10,EEDDDD,221111) 3. round_edges(4,FFFFFF,1) on a 200²px base size image = nice.
</span></body>
</html>