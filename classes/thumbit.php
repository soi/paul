<?php 
    error_reporting(E_ALL|E_STRICT);
    ini_set('display_errors', 1);
    
    ini_set("max_execution_time", 300);    
    include_once('class.upload.php');
     
    function thumb_one ($path) {
        $handle = new upload($path);
        
        /**********************
        //Create coloured Thumbsnail
        **********************/
        $handle->file_safe_name = false;
        $handle->file_overwrite = true;
        $handle->image_resize = true;
        $handle->image_ratio = true;
        $size = getimagesize($path);
        $factor = $size[0] / $size[1];
        $to_be_cut = abs(round(($size[0] - $size[1]) / 2));
        // determine how far we zoom in for making the thumbnail looking not streched
        if ($factor >= 1) {   //picture horizontal
            $handle->image_y = 80;
            $handle->image_precrop = "0px ".$to_be_cut."px";
        }
        else  {  //picture vertical
            $handle->image_x = 80;
            $handle->image_precrop = $to_be_cut."px 0px";
        }
        $handle->process('/var/www/web360/html/felix/pics/thumbs/');
        
        /****************************
        //greyscale thumb (do rarely the same like before)
        *****************************/
        
        $handle->file_safe_name = false;
        $handle->file_overwrite = true;
        $handle->image_resize = true;
        $handle->image_ratio = true;
        $handle->image_greyscale = true; //only difference
        // determine how far we zoom in for making the thumbnail looking not streched
        if ($factor >= 1) {   //picture horizontal
            $handle->image_y = 80;
            $handle->image_precrop = "0px ".$to_be_cut."px";
        }
        else  {  //picture vertical
            $handle->image_x = 80;
            $handle->image_precrop = $to_be_cut."px 0px";
        }
        
        $handle->process('/var/www/web360/html/felix/pics/thumbs/bw/');
        if (!$handle->processed) {
          die('error : ' . $handle->error);
        }

    }
        
    function thumb_folder($source, $destination) { // ALWAYS WITH "/" IN THE END
        $picdir_handle = opendir($source); //open pic-directory
        while (false !== ($pic_file = readdir($picdir_handle))) { // iterate over pics
            if (!is_dir($source.$pic_file)) {
                thumb_one($source.$pic_file);
            }
        }    
    }
    
    
    
        
    
    

 ?>
