/**
 * AdminLTE Demo Menu
 * ------------------
 * You should not use this file in production.
 * This file is for demo purposes only.
 */

/* eslint-disable camelcase */

(function ($) {
  'use strict'


  var navbar_dark_skins = [
    'navbar-primary',
    'navbar-secondary',
    'navbar-info',
    'navbar-success',
    'navbar-danger',
    'navbar-indigo',
    'navbar-purple',
    'navbar-pink',
    'navbar-navy',
    'navbar-lightblue',
    'navbar-teal',
    'navbar-cyan',
    'navbar-dark',
    'navbar-gray-dark',
    'navbar-gray'
  ]

  var navbar_light_skins = [
    'navbar-light',
    'navbar-warning',
    'navbar-white',
    'navbar-orange'
  ]

  var sidebar_colors = [
    'bg-primary',
    'bg-warning',
    'bg-info',
    'bg-danger',
    'bg-success',
    'bg-indigo',
    'bg-lightblue',
    'bg-navy',
    'bg-purple',
    'bg-fuchsia',
    'bg-pink',
    'bg-maroon',
    'bg-orange',
    'bg-lime',
    'bg-teal',
    'bg-olive'
  ]

  var accent_colors = [
    'accent-primary',
    'accent-warning',
    'accent-info',
    'accent-danger',
    'accent-success',
    'accent-indigo',
    'accent-lightblue',
    'accent-navy',
    'accent-purple',
    'accent-fuchsia',
    'accent-pink',
    'accent-maroon',
    'accent-orange',
    'accent-lime',
    'accent-teal',
    'accent-olive'
  ]

  var sidebar_skins = [
    'sidebar-dark-primary',
    'sidebar-dark-warning',
    'sidebar-dark-info',
    'sidebar-dark-danger',
    'sidebar-dark-success',
    'sidebar-dark-indigo',
    'sidebar-dark-lightblue',
    'sidebar-dark-navy',
    'sidebar-dark-purple',
    'sidebar-dark-fuchsia',
    'sidebar-dark-pink',
    'sidebar-dark-maroon',
    'sidebar-dark-orange',
    'sidebar-dark-lime',
    'sidebar-dark-teal',
    'sidebar-dark-olive',
    'sidebar-light-primary',
    'sidebar-light-warning',
    'sidebar-light-info',
    'sidebar-light-danger',
    'sidebar-light-success',
    'sidebar-light-indigo',
    'sidebar-light-lightblue',
    'sidebar-light-navy',
    'sidebar-light-purple',
    'sidebar-light-fuchsia',
    'sidebar-light-pink',
    'sidebar-light-maroon',
    'sidebar-light-orange',
    'sidebar-light-lime',
    'sidebar-light-teal',
    'sidebar-light-olive'
  ]
  var $navbar = $(".main-header")

  // navbar border
  $(".setting-navbar-border").change(function (e){
    e.preventDefault()
    if ( $(this).find("input[type='checkbox']").is(':checked') ){
      $navbar.addClass('border-bottom-0')
    }else{
      $navbar.removeClass('border-bottom-0')
    }
  })
  // setting-body-small-text
  $(".setting-body-small-text").change(function (e){
    var $el = $("body")
    e.preventDefault()
    if ( $(this).find("input[type='checkbox']").is(':checked') ){
      $el.addClass('text-sm')
    }else{
      $el.removeClass('text-sm')
    }
  })
  // setting-navbar-small-text
  $(".setting-navbar-small-text").change(function (e){
    e.preventDefault()
    if ( $(this).find("input[type='checkbox']").is(':checked') ){
      $navbar.addClass('text-sm')
    }else{
      $navbar.removeClass('text-sm')
    }
  })
  // setting-sidebar-small-text
  $(".setting-sidebar-small-text").change(function (e){
    e.preventDefault()
    let $el = $(".main-sidebar")
    if ( $(this).find("input[type='checkbox']").is(':checked') ){
      $el.addClass('text-sm')
    }else{
      $el.removeClass('text-sm')
    }
  })
  // setting-footer-small-text
  $(".setting-footer-small-text").change(function (e){
    e.preventDefault()
    let $el = $(".main-footer")
    if ( $(this).find("input[type='checkbox']").is(':checked') ){
      $el.addClass('text-sm')
    }else{
      $el.removeClass('text-sm')
    }
  })
  // setting-sidebar-nav-flat-style
  $(".setting-sidebar-nav-flat-style").change(function (e){
    e.preventDefault()
    let $el = $(".nav-sidebar")
    if ( $(this).find("input[type='checkbox']").is(':checked') ){
      $el.addClass('nav-flat')
    }else{
      $el.removeClass('nav-flat')
    }
  })
  // setting-sidebar-nav-legacy-style
  $(".setting-sidebar-nav-legacy-style").change(function (e){
    e.preventDefault()
    let $el = $(".nav-sidebar")
    if ( $(this).find("input[type='checkbox']").is(':checked') ){
      $el.addClass('nav-legacy')
    }else{
      $el.removeClass('nav-legacy')
    }
  })
  // setting-sidebar-nav-compact
  $(".setting-sidebar-nav-compact").change(function (e){
    e.preventDefault()
    let $el = $(".nav-sidebar")
    if ( $(this).find("input[type='checkbox']").is(':checked') ){
      $el.addClass('nav-compact')
    }else{
      $el.removeClass('nav-compact')
    }
  })
  // setting-sidebar-nav-child-indent
  $(".setting-sidebar-nav-child-indent").change(function (e){
    e.preventDefault()
    let $el = $(".nav-sidebar")
    if ( $(this).find("input[type='checkbox']").is(':checked') ){
      $el.addClass('nav-indent')
    }else{
      $el.removeClass('nav-indent')
    }
  })
  // setting-sidebar-nav-hide-on-collapse
  $(".setting-sidebar-nav-hide-on-collapse").change(function (e){
    e.preventDefault()
    let $el = $(".nav-sidebar")
    if ( $(this).find("input[type='checkbox']").is(':checked') ){
      $el.addClass('collapse-hide-child')
    }else{
      $el.removeClass('collapse-hide-child')
    }
  })
  // setting-sidebar-disable-auto-expand
  $(".setting-sidebar-disable-auto-expand").change(function (e){
    e.preventDefault()
    let $el = $(".nav-sidebar")
    if ( $(this).find("input[type='checkbox']").is(':checked') ){
      $el.addClass('sidebar-no-expand')
    }else{
      $el.removeClass('sidebar-no-expand')
    }
  })
  // setting-brand-small-text
  $(".setting-brand-small-text").change(function (e){
    e.preventDefault()
    let $el = $(".brand-link")
    if ( $(this).find("input[type='checkbox']").is(':checked') ){
      $el.addClass('text-sm')
    }else{
      $el.removeClass('text-sm')
    }
  })
  
  // dark navbar
  $(".dark-navbar").change(function (e){
    e.preventDefault()
    if ( $(this).find("input[type='checkbox']").is(':checked') ){
      
      $navbar.removeClass("navbar-light").addClass('navbar-dark')
    }else{
      $navbar.removeClass('navbar-dark').addClass('navbar-light')
    }
  })
  // navbar color
  $(".setting-navbar-color").change(function (e){
    e.preventDefault()
    var skinks = navbar_dark_skins.concat(navbar_light_skins)
    skinks.forEach(element => {
      $navbar.removeClass(element)
    });
    $navbar.addClass($(this).val())
  } )

  // accent color
  $(".setting-accent-color").change(function (e){
    e.preventDefault()
    var $el = $("body")
    var skinks = accent_colors
    skinks.forEach(element => {
      $el.removeClass(element)
    });
    $el.addClass($(this).val())
  } )
  



})(jQuery)
