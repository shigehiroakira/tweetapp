$(document).ready(function(){
  $('.slider').slick({
   autoplay: true,
   autoplaySpeed: 4000,
   arrow: true,
   dots: true,
   centerMode: true,
   centerPadding: "80px"
  });

  $(".nav").slick({
    asNavFor: ".slider",
    slidesToShow: 4,
    focusOnSelect: true,
  })
});