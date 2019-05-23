//모달 적용부분


$(".header_meetup_create").click(function () {
    alert("modal 켜진다");
    $("#write_modal").modal("show");
    $("#write_modal").modal({
        backdrop: 'static'
    });
});

//모달 ajax 부분 
$(document).on("click", "#modalEnrollSave", function(){
	alert("저장 버튼을 누루셨습니다.");
	//지역 처리하기
	
	var cityVal1="";
	var cityVal2="";
	var cityVal3="";
	    if($("#select_modal_city1").val() == 1 ){
			cityVal1 = "서울";
			
		}//if
	    if($("#select_modal_city1").val() == 2 ){
			cityVal1 = "부산";

		}
	    if($("#select_modal_city1").val() == 3 ){
	    	cityVal1 = "대구";
		
		}
	    if($("#select_modal_city1").val() == 4 ){
	    	cityVal1 = "인천";
		
		}
	    if($("#select_modal_city1").val() == 5 ){
	    	cityVal1 = "광주";

		}
	    if($("#select_modal_city1").val() == 6 ){
	    	cityVal1 = "대전";

		}
	    if($("#select_modal_city1").val() == 7 ){
	    	cityVal1 = "울산";
	    }
	    if($("#select_modal_city1").val() == 8 ){
	    	cityVal1 = "강원";


		}
	    if($("#select_modal_city1").val() == 9 ){
	    	cityVal1 = "경기";
		
		}
	    if($("#select_modal_city1").val() == 10 ){
	    	cityVal1 = "경남";

		}
	    if($("#select_modal_city1").val() == 11 ){
	    	cityVal1 = "경북";

		}
	    if($("#select_modal_city1").val() == 12 ){
			cityVal1 = "전남";
		}
	    if($("#select_modal_city1").val() == 13 ){
			cityVal1 = "전북";
		}
	    if($("#select_modal_city1").val() == 14 ){
			cityVal1 = "제주";
		}
	    if($("#select_modal_city1").val() == 15 ){
			cityVal1 = "충남";
		}
	    if($("#select_modal_city1").val() == 16 ){
			cityVal1 = "충북";
		}

	   //2
	    
	    if($("#select_modal_city2").val() == 1 ){
			cityVal2 = "서울";
			
		}//if
	    if($("#select_modal_city2").val() == 2 ){
			cityVal2 = "부산";

		}
	    if($("#select_modal_city2").val() == 3 ){
	    	cityVal2 = "대구";
		
		}
	    if($("#select_modal_city2").val() == 4 ){
	    	cityVal2 = "인천";
		
		}
	    if($("#select_modal_city2").val() == 5 ){
	    	cityVal2 = "광주";

		}
	    if($("#select_modal_city2").val() == 6 ){
	    	cityVal2 = "대전";

		}
	    if($("#select_modal_city2").val() == 7 ){
	    	cityVal2 = "울산";
	    }
	    if($("#select_modal_city2").val() == 8 ){
	    	cityVal2 = "강원";


		}
	    if($("#select_modal_city2").val() == 9 ){
	    	cityVal2 = "경기";
		
		}
	    if($("#select_modal_city2").val() == 10 ){
	    	cityVal2 = "경남";

		}
	    if($("#select_modal_city2").val() == 11 ){
	    	cityVal2 = "경북";

		}
	    if($("#select_modal_city2").val() == 12 ){
			cityVal2 = "전남";
		}
	    if($("#select_modal_city2").val() == 13 ){
			cityVal2 = "전북";
		}
	    if($("#select_modal_city2").val() == 14 ){
			cityVal2 = "제주";
		}
	    if($("#select_modal_city2").val() == 15 ){
			cityVal2 = "충남";
		}
	    if($("#select_modal_city2").val() == 16 ){
			cityVal2 = "충북";
		}

	    
	 //2
	    
	    if($("#select_modal_city3").val() == 1 ){
			cityVal3 = "서울";
			
		}//if
	    if($("#select_modal_city3").val() == 2 ){
			cityVal3 = "부산";

		}
	    if($("#select_modal_city3").val() == 3 ){
	    	cityVal3 = "대구";
		
		}
	    if($("#select_modal_city3").val() == 4 ){
	    	cityVal3 = "인천";
		
		}
	    if($("#select_modal_city3").val() == 5 ){
	    	cityVal3 = "광주";

		}
	    if($("#select_modal_city3").val() == 6 ){
	    	cityVal3 = "대전";

		}
	    if($("#select_modal_city3").val() == 7 ){
	    	cityVal3 = "울산";
	    }
	    if($("#select_modal_city3").val() == 8 ){
	    	cityVal3 = "강원";


		}
	    if($("#select_modal_city3").val() == 9 ){
	    	cityVal3 = "경기";
		
		}
	    if($("#select_modal_city3").val() == 10 ){
	    	cityVal3 = "경남";

		}
	    if($("#select_modal_city3").val() == 11 ){
	    	cityVal3 = "경북";

		}
	    if($("#select_modal_city3").val() == 12 ){
			cityVal3 = "전남";
		}
	    if($("#select_modal_city3").val() == 13 ){
			cityVal3 = "전북";
		}
	    if($("#select_modal_city3").val() == 14 ){
			cityVal3 = "제주";
		}
	    if($("#select_modal_city3").val() == 15 ){
			cityVal3 = "충남";
		}
	    if($("#select_modal_city3").val() == 16 ){
			cityVal3 = "충북";
		}
	//모달데이터 처리하기
	
	//회비 처리부분
	var selectPrice = $(".modal_monthly_fee:checked").val();
	alert("확인:" + $(".modal_monthly_fee:checked").val());
	if(selectPrice == "personal" ){
		selectPrice = $(".modal_fee_input").val();
	};
	

	
	let category = $(".food_nation_category").val();
	console.log("category" + category);
	let title = $(".meetup_title").val();
	console.log("title" + title);
	let tag = $(".meetup_tag").val();
	console.log("tag" + tag);
	let fee = selectPrice;
	console.log("fee" +fee);
	let selectDay = $(".selectDay:checked").val();
	console.log("selectDay:checked" +selectDay);
	
	alert("city1" + cityVal1);
	let town1 = $("#select_modal_town1").val()
	alert("town" + town1);
	alert("city2" + cityVal2);
	let town2 = $("#select_modal_town2").val()
		alert("city3" + cityVal3);
	let town3 = $("#select_modal_town3").val()
    alert("city3" + cityVal3);
	var city =[]
	var town =[]
	selectDay
	//지역 도시 처리부분
	for(let i=1; i<=3; i++){
		if(cityVal + i !=""){
		city.push(cityVal + i);
		}
	}
	console.log("city배열 "+ city[0]);
	for(let i=1; i<=3; i++){
		if(town+i !=null){
		town.push(town+i);
		}
	}
	console.log("town배열 "+ town[0]);
	data = {};
		data.check = "check";
		$(".food_nation_categody").val()	
		$.ajax({
			url: '/babmukja/meetup/mainMeetupEnroll.do',
			data: data,
			type: "POST",
			enctype: 'multipart/form-data',
			success: function (data) {
				
				console.log(data);
			}
		});
});


//클릭시 주소 이동부분
$(".info_block").click(function(){
	location.href="http://localhost/babmukja/meetup/detail.do";
});

//검색창 none->block 변경 부분
$(".header_search").click(function () {

    $(".after_click").css("display", "block");
});
$(".location_title_container").click(function () {
    alert($(".location_position").css("display"));
    // if (

    //     $(".location_position").css("display") == "none"
    // ) {
    $(".location_position").css("display", "block");
    // } else if (
    //     $(".location_position").css("display") == "block"
    // ) {
    //     $(".location_position").css("display", "none");
    // }

});
$(".food_type_title").click(function () {
    $(".food_type_position").css("display", "block");
});
$(".monthly_fee_title").click(function () {
    $(".monthly_fee_position").css("display", "block");
});


//tab 누를떄 변경부분
for (let i = 0; i <= 4; i++) {
    let number = i;

    $("td:eq(" + number + ")").click(function () {

        $(`td`).css("background-color", "white");
        $(`td`).css("color", "black");
        $(".tabPanel").css("display", "none");
        $("td:eq(" + number + ")").css("background-color", "#7db341");
        $("td:eq(" + number + ")").css("color", "white");
        $(".tabPanel:eq(" + number + ")").css("display", "block");
        clearInterval(interval);
    });
    //이거 쓰기mouseup
}//for
var num = 0;
var interval = setInterval(function () {


    $("td:eq(" + num + ")").click();
    console.log(num);
    num++;
    if (num == 5) {
        num = 0;
    }
}, 1200);



//bootstrap
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('.image-upload-wrap').hide();
            $('.file-upload-image').attr('src', e.target.result);
            $('.file-upload-content').show();
            $('.image-title').html(input.files[0].name);
        };

        reader.readAsDataURL(input.files[0]);

    } else {
        removeUpload();
    }
}

function removeUpload() {
    $('.file-upload-input').replaceWith($('.file-upload-input').clone());
    $('.file-upload-content').hide();
    $('.image-upload-wrap').show();
}
$('.image-upload-wrap').bind('dragover', function () {
    $('.image-upload-wrap').addClass('image-dropping');
});
$('.image-upload-wrap').bind('dragleave', function () {
    $('.image-upload-wrap').removeClass('image-dropping');
});