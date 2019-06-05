




//검색창 none->block 변경 부분
$(".header_search").click(function () {
    $(".after_click").css("display", "block");
});
$(".location_title_container").click(function () {
    //alert($(".location_position").css("display"));
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
//실험
$(".header_cooking_meetup").click(function () {
    alert("실험 나오는지 확인");
});

$(".food_type_title").click(function () {
    $(".food_type_position").css("display", "block");
});
$(".monthly_fee_title").click(function () {
    $(".monthly_fee_position").css("display", "block");
});







