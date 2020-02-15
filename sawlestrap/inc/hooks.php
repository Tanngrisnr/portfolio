<?php
/**
 * Custom hooks.
 *
 * @package swalestrap
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly.
}

if ( ! function_exists( 'swalestrap_site_info' ) ) {
	/**
	 * Add site info hook to WP hook library.
	 */
	function swalestrap_site_info() {
		do_action( 'swalestrap_site_info' );
	}
}

if ( ! function_exists( 'swalestrap_add_site_info' ) ) {
	add_action( 'swalestrap_site_info', 'swalestrap_add_site_info' );

	/**
	 * Add site info content.
	 */
	function swalestrap_add_site_info() {
		$the_theme = wp_get_theme();

		$site_info = sprintf(
			'<a href="%1$s">%2$s</a><span class="sep"> | </span>%3$s(%4$s)',
			esc_url( __( 'http://wordpress.org/', 'swalestrap' ) ),
			sprintf(
				/* translators:*/
				esc_html__( 'Proudly powered by %s', 'swalestrap' ),
				'WordPress'
			),
			sprintf( // WPCS: XSS ok.
				/* translators:*/
				esc_html__( 'Theme: %1$s av %2$s.', 'swalestrap' ),
				$the_theme->get( 'Name' ),
				'<a href="' . esc_url( __( '', 'swalestrap' ) ) . '">Fredrik Wintzell</a>'
			),
			sprintf( // WPCS: XSS ok.
				/* translators:*/
				esc_html__( 'Version: %1$s', 'swalestrap' ),
				$the_theme->get( 'Version' )
			)
		);

		echo apply_filters( 'swalestrap_site_info_content', $site_info ); // WPCS: XSS ok.
	}
}
