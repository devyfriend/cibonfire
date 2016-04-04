<?php echo theme_view('header'); ?>
<div class="container">
<?php
echo theme_view('_sitenav');
echo Template::message();
echo isset($content) ? $content : Template::content();
?>
</div>
<?php echo theme_view('footer'); ?>