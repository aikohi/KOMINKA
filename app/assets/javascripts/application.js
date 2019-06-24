// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require bootstrap-sprockets
//= require_tree .

$(document).on('ready page:load',function() {
	$(function () {
		$('.zdo_drawer_button').click(function () {
			$(this).toggleClass('active');
			$('.zdo_drawer_bg').fadeToggle();
			$('nav').toggleClass('open');
		})
		$('.zdo_drawer_bg').click(function () {
			$(this).fadeOut();
			$('.zdo_drawer_button').removeClass('active');
			$('nav').removeClass('open');
		});
	})
	$(function () {
		$('.carousel-item active').carousel({
		  interval: 3000
		})
	});
	$(function () {
		$('.carousel-item').carousel({
		  interval: 3000
		})
	});
});
