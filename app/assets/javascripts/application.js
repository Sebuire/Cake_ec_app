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
//= require rails-ujs
//= require activestorage
//= require jquery
//= require bootstrap-sprockets
//= require_tree .


// トップボタンのjs
$(function(){

	$('.to-top').each(function(){

		let el = ('html');

		$(this).on('click', function(){
			$(el).stop(true).animate({scrollTop: 0}, 600);
		});
	});
});

// ヘッダーのjs
$(function(){

	$('.customer-header').each(function(){

		let $window = $(window),
			$header = $(this),
			headerOffsetTop = $header.offset().top;

		$window.on('scroll', function(){
			if ($window.scrollTop() > headerOffsetTop){
				$header.addClass('sticky');
			}else{
				$header.removeClass('sticky');
			}
		});

		$window.trigger('scroll');
	});
});
// topのスライドショー
$(function(){
	$('.slideshow').each(function(){
		var $slides = $(this).find('img'),
		slideCount = $slides.length,
		currentIndex = 0;

		$slides.eq(currentIndex).fadeIn();

		setInterval(showNextSlide, 3000);

		function showNextSlide(){
			var nextIndex = (currentIndex + 1) % slideCount;

			$slides.eq(currentIndex).fadeOut();

			$slides.eq(nextIndex).fadeIn();

			currentIndex = nextIndex;
		}
	});
});

$(function(){

	let $js = $('.js');

	$js.on('mouseover', function(){
		$(this).stop(true).animate({
			opacity: 0.7
		}, 300);
	})
	.on('mouseout', function(){
		$(this).stop(true).animate({
			opacity: 1
		}, 300);
	});

	$js.on('mouseover', function(){
		$(this).find('section').stop(true).animate({
			opacity: 1
		}, 500);
	})
	.on('mouseout', function(){
		$(this).find('section').stop(true).animate({
			opacity: 0
		}, 500);
	});
});


