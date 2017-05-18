$(function(){
	//1
	if($(".text_box1").val() == 1)
	{	$('.lower1').attr('disabled',true);}
	$(".add1").click(function() {
		var t = $(this).parent().find('input[class*=text_box1]');
		t.val(parseInt(t.val()) + 1);
		//ajax修改数据库
		$.post("updatashoppingcart",{quantity:parseInt(t.val()), bookid:$("#bookid1").val()});
		if (parseInt(t.val())!=1){
            $('.lower1').attr('disabled',false);
        }
		setTotal();
	});
	$(".lower1").click(function() {
		var t = $(this).parent().find('input[class*=text_box1]');
		t.val(parseInt(t.val()) - 1);
		$.post("updatashoppingcart",{quantity:parseInt(t.val()), bookid:$("#bookid1").val()});
		if (parseInt(t.val())==1){
            $('.lower1').attr('disabled',true);
        }
		if (parseInt(t.val()) < 0) {
			t.val(0);
		}
		setTotal();
	});
	function setTotal() {
		var s = 0;
		$("tbody").each(
				function() {
					s += parseInt($(this).find('input[class*=text_box1]').val())*parseFloat($(this)
							.find('td[class*=price1]').text());
				});
		$(".sum1").html(s.toFixed(2));
		mySum();
	}
	setTotal();
	//2
	if($(".text_box2").val() == 1)
	{	$('.lower2').attr('disabled',true);}
	$(".add2").click(function() {
		var t = $(this).parent().find('input[class*=text_box2]');
		t.val(parseInt(t.val()) + 1);
		$.post("updatashoppingcart",{quantity:parseInt(t.val()), bookid:$("#bookid2").val()});
		if (parseInt(t.val())!=1){
            $('.lower2').attr('disabled',false);
        }
		setTotal2();
	});
	$(".lower2").click(function() {
		var t = $(this).parent().find('input[class*=text_box2]');
		t.val(parseInt(t.val()) - 1);
		$.post("updatashoppingcart",{quantity:parseInt(t.val()), bookid:$("#bookid2").val()});
		if (parseInt(t.val())==1){
            $('.lower2').attr('disabled',true);
        }
		if (parseInt(t.val()) < 0) {
			t.val(0);
		}
		setTotal2();
	});
	function setTotal2() {
		var s = 0;
		$("tbody").each(
				function() {
					s += parseInt($(this).find('input[class*=text_box2]').val())*parseFloat($(this)
							.find('td[class*=price2]').text());
				});
		$(".sum2").html(s.toFixed(2));
		mySum();
	}
	setTotal2();
	//3
	if($(".text_box3").val() == 1)
	{	$('.lower3').attr('disabled',true);}
		$(".add3").click(function() {
			var t = $(this).parent().find('input[class*=text_box3]');
			t.val(parseInt(t.val()) + 1);
			$.post("updatashoppingcart",{quantity:parseInt(t.val()), bookid:$("#bookid3").val()});
			if (parseInt(t.val())!=1){
	            $('.lower3').attr('disabled',false);
	        }
			setTotal3();
		});
		$(".lower3").click(function() {
			var t = $(this).parent().find('input[class*=text_box3]');
			t.val(parseInt(t.val()) - 1);
			$.post("updatashoppingcart",{quantity:parseInt(t.val()), bookid:$("#bookid3").val()});
			if (parseInt(t.val())==1){
	            $('.lower3').attr('disabled',true);
	        }
			if (parseInt(t.val()) < 0) {
				t.val(0);
			}
			setTotal3();
		});
		function setTotal3() {
			var s = 0;
			$("tbody").each(
					function() {
						s += parseInt($(this).find('input[class*=text_box3]').val())*parseFloat($(this)
								.find('td[class*=price3]').text());
					});
			$(".sum3").html(s.toFixed(2));
			mySum();
		}
		setTotal3();
	//4
		if($(".text_box4").val() == 1)
		{	$('.lower4').attr('disabled',true);}
		$(".add4").click(function() {
			var t = $(this).parent().find('input[class*=text_box4]');
			t.val(parseInt(t.val()) + 1);
			$.post("updatashoppingcart",{quantity:parseInt(t.val()), bookid:$("#bookid4").val()});
			if (parseInt(t.val())!=1){
	            $('.lower4').attr('disabled',false);
	        }
			setTotal4();
		});
		$(".lower4").click(function() {
			var t = $(this).parent().find('input[class*=text_box4]');
			t.val(parseInt(t.val()) - 1);
			$.post("updatashoppingcart",{quantity:parseInt(t.val()), bookid:$("#bookid4").val()});
			if (parseInt(t.val())==1){
	            $('.lower4').attr('disabled',true);
	        }
			if (parseInt(t.val()) < 0) {
				t.val(0);
			}
			setTotal4();
		});
		function setTotal4() {
			var s = 0;
			$("tbody").each(
					function() {
						s += parseInt($(this).find('input[class*=text_box4]').val())*parseFloat($(this)
								.find('td[class*=price4]').text());
					});
			$(".sum4").html(s.toFixed(2));
			mySum();
		}
		setTotal4();	
	//5
		if($(".text_box5").val() == 1)
		{	$('.lower5').attr('disabled',true);}
		$(".add5").click(function() {
			var t = $(this).parent().find('input[class*=text_box5]');
			t.val(parseInt(t.val()) + 1);
			$.post("updatashoppingcart",{quantity:parseInt(t.val()), bookid:$("#bookid5").val()});
			if (parseInt(t.val())!=1){
	            $('.lower5').attr('disabled',false);
	        }
			setTotal5();
		});
		$(".lower5").click(function() {
			var t = $(this).parent().find('input[class*=text_box5]');
			t.val(parseInt(t.val()) - 1);
			$.post("updatashoppingcart",{quantity:parseInt(t.val()), bookid:$("#bookid5").val()});
			if (parseInt(t.val())==1){
	            $('.lower5').attr('disabled',true);
	        }
			if (parseInt(t.val()) < 0) {
				t.val(0);
			}
			setTotal5();
		});
		function setTotal5() {
			var s = 0;
			$("tbody").each(
					function() {
						s += parseInt($(this).find('input[class*=text_box5]').val())*parseFloat($(this)
								.find('td[class*=price5]').text());
					});
			$(".sum5").html(s.toFixed(2));
			mySum();
		}
		setTotal5();
	//6
		if($(".text_box6").val() == 1)
		{	$('.lower6').attr('disabled',true);}
		$(".add6").click(function() {
			var t = $(this).parent().find('input[class*=text_box6]');
			t.val(parseInt(t.val()) + 1);
			$.post("updatashoppingcart",{quantity:parseInt(t.val()), bookid:$("#bookid6").val()});
			if (parseInt(t.val())!=1){
	            $('.lower6').attr('disabled',false);
	        }
			setTotal6();
		});
		$(".lower6").click(function() {
			var t = $(this).parent().find('input[class*=text_box6]');
			t.val(parseInt(t.val()) - 1);
			$.post("updatashoppingcart",{quantity:parseInt(t.val()), bookid:$("#bookid6").val()});
			if (parseInt(t.val())==1){
	            $('.lower6').attr('disabled',true);
	        }
			if (parseInt(t.val()) < 0) {
				t.val(0);
			}
			setTotal6();
		});
		function setTotal6() {
			var s = 0;
			$("tbody").each(
					function() {
						s += parseInt($(this).find('input[class*=text_box6]').val())*parseFloat($(this)
								.find('td[class*=price6]').text());
					});
			$(".sum6").html(s.toFixed(2));
			mySum();
		}
		setTotal6();
	//7
		if($(".text_box7").val() == 1)
		{	$('.lower7').attr('disabled',true);}
		$(".add7").click(function() {
			var t = $(this).parent().find('input[class*=text_box7]');
			t.val(parseInt(t.val()) + 1);
			$.post("updatashoppingcart",{quantity:parseInt(t.val()), bookid:$("#bookid7").val()});
			if (parseInt(t.val())!=1){
	            $('.lower7').attr('disabled',false);
	        }
			setTotal7();
		});
		$(".lower7").click(function() {
			var t = $(this).parent().find('input[class*=text_box7]');
			t.val(parseInt(t.val()) - 1);
			$.post("updatashoppingcart",{quantity:parseInt(t.val()), bookid:$("#bookid7").val()});
			if (parseInt(t.val())==1){
	            $('.lower7').attr('disabled',true);
	        }
			if (parseInt(t.val()) < 0) {
				t.val(0);
			}
			setTotal7();
		});
		function setTotal7() {
			var s = 0;
			$("tbody").each(
					function() {
						s += parseInt($(this).find('input[class*=text_box7]').val())*parseFloat($(this)
								.find('td[class*=price7]').text());
					});
			$(".sum7").html(s.toFixed(2));
			mySum();
		}
		setTotal7();
	//8
		if($(".text_box8").val() == 1)
		{	$('.lower8').attr('disabled',true);}
		$(".add8").click(function() {
			var t = $(this).parent().find('input[class*=text_box8]');
			t.val(parseInt(t.val()) + 1);
			$.post("updatashoppingcart",{quantity:parseInt(t.val()), bookid:$("#bookid8").val()});
			if (parseInt(t.val())!=1){
	            $('.lower8').attr('disabled',false);
	        }
			setTotal8();
		});
		$(".lower8").click(function() {
			var t = $(this).parent().find('input[class*=text_box8]');
			t.val(parseInt(t.val()) - 1);
			$.post("updatashoppingcart",{quantity:parseInt(t.val()), bookid:$("#bookid8").val()});
			if (parseInt(t.val())==1){
	            $('.lower8').attr('disabled',true);
	        }
			if (parseInt(t.val()) < 0) {
				t.val(0);
			}
			setTotal8();
		});
		function setTotal8() {
			var s = 0;
			$("tbody").each(
					function() {
						s += parseInt($(this).find('input[class*=text_box8]').val())*parseFloat($(this)
								.find('td[class*=price8]').text());
					});
			$(".sum8").html(s.toFixed(2));
			mySum();
		}
		setTotal8();
	//9
		if($(".text_box9").val() == 1)
		{	$('.lower9').attr('disabled',true);}
		$(".add9").click(function() {
			var t = $(this).parent().find('input[class*=text_box9]');
			t.val(parseInt(t.val()) + 1);
			$.post("updatashoppingcart",{quantity:parseInt(t.val()), bookid:$("#bookid9").val()});
			if (parseInt(t.val())!=1){
	            $('.lower9').attr('disabled',false);
	        }
			setTotal9();
		});
		$(".lower9").click(function() {
			var t = $(this).parent().find('input[class*=text_box9]');
			t.val(parseInt(t.val()) - 1);
			$.post("updatashoppingcart",{quantity:parseInt(t.val()), bookid:$("#bookid9").val()});
			if (parseInt(t.val())==1){
	            $('.lower9').attr('disabled',true);
	        }
			if (parseInt(t.val()) < 0) {
				t.val(0);
			}
			setTotal9();
		});
		function setTotal9() {
			var s = 0;
			$("tbody").each(
					function() {
						s += parseInt($(this).find('input[class*=text_box9]').val())*parseFloat($(this)
								.find('td[class*=price9]').text());
					});
			$(".sum9").html(s.toFixed(2));
			mySum();
		}
		setTotal9();
	//10
	if($(".text_box10").val() == 1)
	{	$('.lower10').attr('disabled',true);}
	$(".add10").click(function() {
		var t = $(this).parent().find('input[class*=text_box10]');
		t.val(parseInt(t.val()) + 1);
		$.post("updatashoppingcart",{quantity:parseInt(t.val()), bookid:$("#bookid10").val()});
		if (parseInt(t.val())!=1){
            $('.lower10').attr('disabled',false);
        }
		setTotal10();
	});
	$(".lower10").click(function() {
		var t = $(this).parent().find('input[class*=text_box10]');
		t.val(parseInt(t.val()) - 1);
		$.post("updatashoppingcart",{quantity:parseInt(t.val()), bookid:$("#bookid10").val()});
		if (parseInt(t.val())==1){
            $('.lower10').attr('disabled',true);
        }
		if (parseInt(t.val()) < 0) {
			t.val(0);
		}
		setTotal10();
	});
	function setTotal10() {
		var s = 0;
		$("tbody").each(
				function() {
					s += parseInt($(this).find('input[class*=text_box10]').val())*parseFloat($(this)
							.find('td[class*=price10]').text());
				});
		$(".sum10").html(s.toFixed(2));
		mySum();
	}
	setTotal10();
	
	function mySum() {
		var sum = 0;
		var sp1 = 0; var sp2 = 0; var sp3 = 0; var sp4 = 0; var sp5 = 0;
		var sp6 = 0; var sp7 = 0; var sp8 = 0; var sp9 = 0; var sp10 = 0;
		$("tbody").each(
				function() {
					if($(this).find('span[class*=sum1]').html()==undefined){sp1 = 0;}
					else{sp1=$(this).find('span[class*=sum1]').html();}
					if($(this).find('span[class*=sum2]').html()==undefined){sp2 = 0;}
					else{sp2=$(this).find('span[class*=sum2]').html();}
					if($(this).find('span[class*=sum3]').html()==undefined){sp3 = 0;}
					else{sp3=$(this).find('span[class*=sum3]').html();}
					if($(this).find('span[class*=sum4]').html()==undefined){sp4 = 0;}
					else{sp4=$(this).find('span[class*=sum4]').html();}
					if($(this).find('span[class*=sum5]').html()==undefined){sp5 = 0;}
					else{sp5=$(this).find('span[class*=sum5]').html();}
					if($(this).find('span[class*=sum6]').html()==undefined){sp6 = 0;}
					else{sp6=$(this).find('span[class*=sum6]').html();}
					if($(this).find('span[class*=sum7]').html()==undefined){sp7 = 0;}
					else{sp7=$(this).find('span[class*=sum7]').html();}
					if($(this).find('span[class*=sum8]').html()==undefined){sp8 = 0;}
					else{sp8=$(this).find('span[class*=sum8]').html();}
					if($(this).find('span[class*=sum9]').html()==undefined){sp9 = 0.00;}
					else{sp9=$(this).find('span[class*=sum9]').html();}
					if($(this).find('span[class*=sum10]').html()==undefined){sp10 = 0.00;}
					else{sp10=$(this).find('span[class*=sum10]').html();}
					sum += parseFloat(sp1)+parseFloat(sp2)+parseFloat(sp3)+
					parseFloat(sp4)+parseFloat(sp5)+parseFloat(sp6)+parseFloat(sp7)+
					parseFloat(sp9)+parseFloat(sp10);
				});
		$(".msum").html(sum.toFixed(2));
		/*alert(s.toFixed(2));*/
	}
	mySum();
		
});