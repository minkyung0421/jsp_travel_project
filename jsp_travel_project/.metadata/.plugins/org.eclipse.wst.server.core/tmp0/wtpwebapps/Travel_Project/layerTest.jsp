<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src = "http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src = "http://malsup.github.com/jquery.cycle2.js"></script>
<title>Insert title here</title>
</head>
<style>
body {
  font-family:sans-serif;
}
.bookWrapper {
  width:700px;
  height:450px; //multiply by 1.3 to get proper height
}
.bookBg {
  position:relative;
  background-color: #000000;
  width:100%;
  height:100%;
  border-radius: 12px;  
}
.centerClass {
  position:absolute;
  left:50%;
  top:50%;
}
.pageBg {
  background-color: #ffffff;
  width:652px; 
  height:422px;
  border-radius: 0px;
}
.spineCenter {
  width:2px; 
  height:422px;
  border-radius: 0px;
  background:rgba(101,101,101,.4);
}
.pageWrapper {
  position:relative;
  width:325px;
  height:422px;
  float: left;
  -webkit-font-smoothing:antialiased;
}
.pageFace {
  position:absolute;
  width:325px;
  height:422px;
  overflow:hidden;
  text-align: center;
}
.front {
  background: linear-gradient(to right,  #d9d9d9 0%,#f9f9f9 3%,#ffffff 8%,#ffffff 100%);
  
}
.back {
  background: linear-gradient(to right,  #ffffff 0%,#ffffff 92%,#f9f9f9 97%,#d9d9d9 100%);
}
.pageFoldRight {
  position: absolute;
    width:  0px;
    height: 0px;
    top:  0;
    right: 0;
    border-left-width: 1px;
    border-left-color: #DDDDDD;
    border-left-style: solid;
    border-bottom-width: 1px;
    border-bottom-color: #DDDDDD;
    border-bottom-style: solid;
    box-shadow: -5px 5px 10px #dddddd;
}
.pageFoldLeft {
   position: absolute;
    width:  0px;
    height: 0px;
    top:  0;
    left: 0;
    border-right-width: 1px;
    border-right-color: #DDDDDD;
    border-right-style: solid;
    border-bottom-width: 1px;
    border-bottom-color: #DDDDDD;
    border-bottom-style: solid;
    box-shadow: 5px 5px 10px #dddddd;
}


</style>
<body>
<script language="javascript">
var pageLocation=[],
lastPage=null;
$Zz=0;

TweenLite.set(".centerClass", {xPercent:-50, yPercent:-50});
TweenLite.set(".pageWrapper", {left: "327px", perspective:1000});
TweenLite.set(".page", {transformStyle:"preserve-3d"});
TweenLite.set(".back", {rotationY:-180});
TweenLite.set([".back", ".front"],{backfaceVisibility:"hidden"});

//All pages must have an id assigned to them in the HTML
$(".page").click(
function() {
if (pageLocation[this.id] === undefined || pageLocation[this.id] =="right") {
	$Zz = ($(".left").length)+1 ;
	TweenMax.to($(this), 1, {force3D:true,rotationY:-180,transformOrigin:"-1px top",className:'+=left',z:$Zz,zIndex:$Zz}); 
	TweenLite.set($(this), {className:'-=right'}); 
	pageLocation[this.id]= "left";
}
else {
	$Zz = ($(".right").length)+1 ;
	TweenMax.to($(this), 1, {force3D:true,rotationY:0,transformOrigin:"left top",className:'+=right',z:$Zz,zIndex:$Zz});
	TweenLite.set($(this), {className:'-=left'}); 
	pageLocation[this.id]= "right";
}
}
);

$(".front").hover(
function() {
 TweenLite.to($(this).find(".pageFoldRight"), 0.3, {width:"50px", height:"50px", backgroundImage:"linear-gradient(45deg,  #fefefe 0%,#f2f2f2 49%,#ffffff 50%,#ffffff 100%)"});
},
function() {
TweenLite.to($(this).find(".pageFoldRight"), 0.3, {width:"0px", height:"0px"});  
}
);

$(".back").hover(
function() {
 TweenLite.to($(this).find(".pageFoldLeft"), 0.3, {width:"50px", height:"50px", backgroundImage:"linear-gradient(135deg,  #ffffff 0%,#ffffff 50%,#f2f2f2 51%,#fefefe 100%)"});
},
function() {
TweenLite.to($(this).find(".pageFoldLeft"), 0.3, {width:"0px", height:"0px"});  
}
);


</script>
<div class="bookWrapper">
  <div class="bookBg">
    <div class="pageBg centerClass">
      <div class="pageWrapper">
        <div id="page3" class="page">
          <div class="pageFace front"><h1>front3</h1>
            <div class="pageFoldRight"></div></div>
          <div class="pageFace back"><h1>back3</h1>
            <div class="pageFoldLeft"></div></div>
        </div>
        <div id="page2" class="page">
          <div class="pageFace front"><h1>front2</h1>
            <div class="pageFoldRight"></div></div>
          <div class="pageFace back"><h1>back2</h1>
            <div class="pageFoldLeft"></div></div>
        </div>
        <div id="page1" class="page">
          <div class="pageFace front"><h1>front1</h1>
            <div class="pageFoldRight"></div></div>
          <div class="pageFace back"><h1>back1</h1>
            <div class="pageFoldLeft"></div></div>
        </div>
      </div>
      
</body>
</html>