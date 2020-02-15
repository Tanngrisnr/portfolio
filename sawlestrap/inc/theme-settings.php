<?php
/**
 * Check and setup theme's default settings
 *
 * @package swalestrap
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly.
}

if ( ! function_exists( 'swalestrap_setup_theme_default_settings' ) ) {
	function swalestrap_setup_theme_default_settings() {

		// check if settings are set, if not set defaults.
		// Caution: DO NOT check existence using === always check with == .
		// Latest blog posts style.
		$swalestrap_posts_index_style = get_theme_mod( 'swalestrap_posts_index_style' );
		if ( '' == $swalestrap_posts_index_style ) {
			set_theme_mod( 'swalestrap_posts_index_style', 'default' );
		}

		// Sidebar position.
		$swalestrap_sidebar_position = get_theme_mod( 'swalestrap_sidebar_position' );
		if ( '' == $swalestrap_sidebar_position ) {
			set_theme_mod( 'swalestrap_sidebar_position', 'right' );
		}

		// Container width.
		$swalestrap_container_type = get_theme_mod( 'swalestrap_container_type' );
		if ( '' == $swalestrap_container_type ) {
			set_theme_mod( 'swalestrap_container_type', 'container' );
		}
	}
}
