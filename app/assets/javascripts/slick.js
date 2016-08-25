$(document).ready(function(){
  $('.slideshow').slick({
  slidesToShow: 2,
  slidesToScroll: 2,
  autoplay: true,
  autoplaySpeed: 8000,
  prevArrow: false,
  nextArrow: false,
  dots: false,
  infinite: true,
  speed: 1000,
  fade: true,
  cssEase: 'linear'
  });
});
