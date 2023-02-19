<?php

function modify_read_more_link() {
    return '&nbsp;&nbsp;<a class="more-link" href="' . get_permalink() . '">(আর্টিকেলের বাকিটুকু পড়ুন)</a>';
}
add_filter( 'the_content_more_link', 'modify_read_more_link' );

add_action( 'wp_enqueue_scripts', 'twenty_fifteen_child_right_enqueue_styles');
function twenty_fifteen_child_right_enqueue_styles() {
    wp_enqueue_style( 'parent-style', get_template_directory_uri() . '/style.css' );
}

function my_wp_default_styles($styles)
{
	//use release date for version
	$styles->default_version = "20181225";
}
add_action("wp_default_styles", "my_wp_default_styles");

add_action( 'twentyfifteen_credits', 'twenty_fifteen_right_credits_handler' );
function twenty_fifteen_right_credits_handler(){
    ?>
    Child Theme Designed by <a href="https://www.tipsandtricks-hq.com/" target="_blank">Tips and Tricks HQ</a> |
    <?php
}
