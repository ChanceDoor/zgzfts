$(document).ready ->
  $(".orders-nav-items a").mouseenter ->
    $(this).parent().addClass("orders-hover");

  $(".orders-nav-items a").mouseleave ->
    $(this).parent().removeClass("orders-hover");

  $(".orders-toggle").click ->
    $(this).toggleClass("orders-toggle-closed");
    $(this).parent().next("dd").slideToggle();
