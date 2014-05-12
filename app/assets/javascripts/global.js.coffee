$(document).ready ->
  $('#message').delay(1500).fadeOut(1000)
  $("#refresh_captcha").click ->
    $("img[alt='captcha']").attr("src", window.location.protocol+"//"+window.location.host+"/captcha?i="+new Date().getTime())
