// post like
$(".post-like").click(function(){
  var btn = $(this)
  var parent = $(this).parent()
  var id = parent.data('id')
  $.ajax({
    url: `/me/posts/${id}/like`,
    type: "patch",
    data: "",
    success: function(data){
      if(data.liked){
        var counter = parent.children(".state").children(".state-like")
        counter.text( parseInt(counter.text())+1 )
        btn.addClass("btn-primary").removeClass('btn-default')
      }else{
        var counter = parent.children(".state").children(".state-like")
        counter.text( parseInt(counter.text())-1 )
        btn.removeClass("btn-primary").addClass("btn-default")
      }
    },
    error: function(data){
      console.log(data)
    }
  })
})


// post favorite
$('.post-favorite').click(function(){
  var btn = $(this)
  var parent = btn.parent()
  var id = parent.data("id")
  $.ajax({
    url: `/me/posts/${id}/favorite`,
    type: "patch",
    data: "",
    success: function(data){
      if(data.liked){
        btn.addClass("btn-primary").removeClass('btn-default')
      }else{
        btn.removeClass("btn-primary").addClass("btn-default")
      }
    },
    error: function(data){
      console.log(data)
    }
  })
})

$('.post-share').click(function(){
  var url = $(this).parent().data('url')
  $('#modal-me-collecte')
  .children('.modal-dialog')
  .children('.modal-content')
  .children('.modal-body')
  .children('.row')
  .children('.col-10')
  .children('.cliptext').text(url)
  
})

// share copy to clipboard
  $('.copy').click(function(){
    navigator.clipboard.writeText( $(this).parent().parent()
    .children('.col-10').children('.cliptext').text() )
    alert("copied ✅")
  })
