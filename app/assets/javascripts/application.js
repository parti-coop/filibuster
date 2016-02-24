//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require jssocials

$(function(){
  $("#share").jsSocials({
    showCount: true,
    showLabel: false,
    shares: ["facebook", "googleplus", "twitter"]
  });
});