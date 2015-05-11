
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
});