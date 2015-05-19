
$(window).on("scroll", function(){ 
        var height = $('.slide').height()+1;
        var nav = $(".navbar");
        var li =$('.navbar li');
        var logo =$('#logo img');
        var eye =$('#logo_mini img.eye');
    if($(window).scrollTop() < height)
        {
            nav.css({'paddingTop' : '3rem', 'marginBottom' : '2rem'});
            li.css({'paddingTop' :0});
            logo.css({'marginTop' :'-43px'});
            eye.css({top :'-403px'});
        }
    else
        {
            nav.css({'paddingTop' : 0, 'marginBottom' : 0});
            li.css({'paddingTop' : '4px'});
            logo.css({'marginTop' :'-400px'});
            eye.css({top :0});
        }
});
        
$(window).ready(function() {      
    $(".flush_message").click(function() {
        $(this).css({'display' : 'none'})
	});
    $("#me").click(function() {
        $('#info').css({'opacity' :'0.8'});
         $('#crossed').css({'opacity' :'0.8'});
	});
    $( "#crossed" ).click(function() {
      $( '#info' ).css({'opacity' :'0'} );
      $( this ).css({'opacity' :'0'} );
    });

});


$(window).keydown(function(e){
var li = $('.carousel-indicators li')
var lenght = (li.length-1);
var li_active = $('.carousel-indicators li.active').index()
    if(e.which === 39)
    {
        if (li_active < lenght)
        {
        li.eq(li_active + 1).click();
        }
        else {
        li.eq(0).click();            
        }
    }
    else if(e.which === 37)
    {
        if (li_active > 0)
        {
        li.eq(li_active - 1).click();
        }
        else {
        li.eq(lenght).click();            
        }
    }
});

$(document).ready(function() {
      var width = ($('.gallery img').width() * 0.65);
      $(".gallery").height(width);
    
    $(".video_gallery").fitVids();
            
    var lastId,
        topMenu = $("#ul_nawigacja"),
        topMenuHeight = topMenu.outerHeight()+15,
    
        menuItems = topMenu.find("a"),
    
        scrollItems = menuItems.map(function(){
          var item = $($(this).attr("href"));
          if (item.length) { return item; }
        });
    
    menuItems.click(function(e){
      var href = $(this).attr("href"),
          offsetTop = href === "#" ? 0 : $(href).offset().top-topMenuHeight+1;
      $('html, body').stop().animate({ 
          scrollTop: offsetTop
      }, 1000);
      e.preventDefault();
    });
    
    $(window).scroll(function(){
    
       var fromTop = $(this).scrollTop()+topMenuHeight;
       
    
       var cur = scrollItems.map(function(){
         if ($(this).offset().top < fromTop)
           return this;
       });
    
       cur = cur[cur.length-1];
       var id = cur && cur.length ? cur[0].id : "";
       
       if (lastId !== id) {
           lastId = id;
    
           menuItems
             .parent().removeClass("active")
             .end().filter("[href=#"+id+"]").parent().addClass("active");
       }                   
    });
    
    $('.carousel, .workshop_slider').carousel({
        interval: false
    }) 

    }) ;  
