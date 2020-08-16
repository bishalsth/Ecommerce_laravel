/*price range*/

 $('#sl2').slider();

	var RGBChange = function() {
	  $('#RGB').css('background', 'rgb('+r.getValue()+','+g.getValue()+','+b.getValue()+')')
	};	
		
/*scroll to top*/

$(document).ready(function(){
	$(function () {
		$.scrollUp({
	        scrollName: 'scrollUp', // Element ID
	        scrollDistance: 300, // Distance from top/bottom before showing element (px)
	        scrollFrom: 'top', // 'top' or 'bottom'
	        scrollSpeed: 300, // Speed back to top (ms)
	        easingType: 'linear', // Scroll to top easing (see http://easings.net/)
	        animation: 'fade', // Fade, slide, none
	        animationSpeed: 200, // Animation in speed (ms)
	        scrollTrigger: false, // Set a custom triggering element. Can be an HTML string or jQuery object
					//scrollTarget: false, // Set a custom target element for scrolling to the top
	        scrollText: '<i class="fa fa-angle-up"></i>', // Text for element, can contain HTML
	        scrollTitle: false, // Set a custom <a> title if required.
	        scrollImg: false, // Set true to use image
	        activeOverlay: false, // Set CSS color to display scrollUp active point, e.g '#00FFFF'
	        zIndex: 2147483647 // Z-Index for the overlay
		});
	});
});

$(document).ready(function(){
// alert("test");
$("#selSize").change(function(){
	var idSize = $(this).val();
	// alert(idSize);
	if(idSize ==""){
		return false;
	}
	$.ajax({
		type:'get',
		url:'/get-product-size',
		data:{idSize:idSize},
		success:function(resp){
			var arr = resp.split("#");
			$("#getPrice").html(" RS " +arr[0]);
			$("#price").val(arr[0]);
			if(arr[1]==0){
				$("#CartBtn").hide();
				$("#TextId").text("Out of Stock");
				
			}else{
				$("#CartBtn").show();
				$("#TextId").text("In Stock");
			}
			// alert(resp);
		},error:function(){
			alert("error");
		}

	});
});

});


$(document).ready(function(){

	$(".AltImage").click(function(){
		var image = $(this).attr('src');
		// alert(image);
		$(".MainImage").attr('src',image);
	});
});

// Instantiate EasyZoom instances
var $easyzoom = $('.easyzoom').easyZoom();

// Setup thumbnails example
var api1 = $easyzoom.filter('.easyzoom--with-thumbnails').data('easyZoom');

$('.thumbnails').on('click', 'a', function(e) {
	var $this = $(this);

	e.preventDefault();

	// Use EasyZoom's `swap` method
	api1.swap($this.data('standard'), $this.attr('href'));
});

// Setup toggles example
var api2 = $easyzoom.filter('.easyzoom--with-toggle').data('easyZoom');

$('.toggle').on('click', function() {
	var $this = $(this);

	if ($this.data("active") === true) {
		$this.text("Switch on").data("active", false);
		api2.teardown();
	} else {
		$this.text("Switch off").data("active", true);
		api2._init();
	}
});

$().ready(function(){
	// alert("test");
	$("#registerForm").validate({
		rules:{
			name:{
				required:true,
				minlength:2,
				

			},
			password:{
				required:true,
				minlength:6

			},
			email:{
				required:true,
				email:true,
				remote:"/check-email"
		}

		},
		messages:{
			name: {required:"Please provide your Name",
			minlength:"Please provide atleast 2 characters long"
			

			},
			password:{
				required:"Please provide your Password",
				minlength:"Please provide atleast 6 characters long"
			},
			email:{
				required:"Pleaee enter your email",
				email:"Please enter valid email",
				remote:"Email already exist"
			}

		}

	});
});



















