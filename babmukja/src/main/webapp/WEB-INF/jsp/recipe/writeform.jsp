<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>레시피 작성</title>
    <script src="<c:url value="/resources/js/editor.min.js"/>"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/header@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/link@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/list@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/embed@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/raw@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/simple-image@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/checklist@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/quote@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/image@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/simple-image@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/marker@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/table@latest"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/warning@latest"></script>
    <link rel="stylesheet" href="<c:url value="/resources/css/recipe/recipewriteform.css"/>">
    <link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/resources/js/slider/slider-radio.css"/>">
    <script src="<c:url value="/resources/js/slider/slider-radio.js"/>"></script>
    <link href="https://vjs.zencdn.net/7.5.4/video-js.css" rel="stylesheet">

</head>
<body>
    <div id="writeform-header">레시피 작성</div>
     <div id="paragraph">
            자신만의 레시피를 완성해주세요
            <br>
            <br>
            레시피에 맞는 키워드들을 선택해주세요.
    </div>
        <div id="keyword-container">
        <div class="keyword-wrapper" id="keyword-contry-wrapper">
            <div>나라별 분류</div>
            <div class="slider-radio edgy">
                <input type="radio" name="country" id="korean" value="1" ><label for="korean">한식</label>
                <input type="radio" name="country" id="chinese" value="2"><label for="chinese">중식</label>
                <input type="radio" name="country" id="japanese" value="3"><label for="japanese">일식</label>
                <input type="radio" name="country" id="western" value="4"><label for="western">양식</label>
                <input type="radio" name="country" id="southerneast" value="5"><label for="southerneast">동남아</label>
                <input type="radio" name="country" id="countryetc" value="6"><label for="countryetc">기타</label>
   
            </div>

        </div>
        <div class="keyword-wrapper" id="keyword-caution-wrapper">
            <div>주의사항</div>
            <div>
                <input type="checkbox" id="pregnant" name="caution" value="7">
                <label for="pregnant">임산부 주의</label>
                <input type="checkbox" id="baby" name="caution" value="8">
                <label for="baby">영유아 주의</label>
                <input type="checkbox" id="high-blood-pressure" name="caution" value="9">
                <label for="high-blood-pressure">고혈압 주의</label>
                <input type="checkbox" id="vegan" name="caution" value="10">
                <label for="vegan">채식주의자를 위한</label>
                <input type="checkbox" id="halal" name="caution" value="11">
                <label for="halal">돼지고기 포함</label>
                <input type="checkbox" id="old" name="caution" value="12">
                <label for="old">노약자 주의</label>
                <input type="checkbox" id="allergic" name="caution" value="13">
                <label for="allergic">알러지 유발 주의</label>
                <input type="checkbox" id="diabetes" name="caution" value="14">
                <label for="diabetes">당뇨 주의</label>
            </div>
        </div>
        <div class="keyword-wrapper" id="keyword-situation-wrapper">
            <div>상황</div>
            <div class="slider-radio edgy">
                    <input type="radio" id="overnight" name="situation" value="15" ><label for="overnight">야식</label> 
                    <input type="radio" id="homeparty" name="situation" value="16"><label for="homeparty">홈파티</label>
                    <input type="radio" id="birthday" name="situation" value="17"><label for="birthday">생일</label> 
                    <input type="radio" id="anniversary" name="situation" value="18"><label for="anniversary">기념일</label>
                    <input type="radio" id="drinkalone" name="situation" value="19"><label for="drinkalone">혼술</label>
                    <input type="radio" id="eatalone" name="situation" value="20"><label for="eatalone">혼밥</label> 
                    <input type="radio" id="coupledate" name="situation" value="21"><label for="coupledate">데이트</label>
                    <input type="radio" id="snack" name="situation" value="22"><label for="snack">간식</label> 
                    <input type="radio" id="wholetable" name="situation" value="23"><label for="wholetable">한상차림</label>
                    <input type="radio" id="dinner" name="situation" value="24"><label for="dinner">저녁</label>
                    <input type="radio" id="lunch" name="situation" value="25"><label for="lunch">점심</label> 
                    <input type="radio" id="breakfast" name="situation" value="26"><label for="breakfast">아침</label> 
                    <input type="radio" id="picnic" name="situation" value="27"><label for="picnic">피크닉</label>
            </div> 
        </div>
        <div class="keyword-wrapper" id="keyword-level-wrapper">
            <div>난이도</div>
            <div class="slider-radio edgy">
                <input type="radio" id="veryeasy" name="level" value="28" ><label for="veryeasy">매우 쉬움</label>
                <input type="radio" id="easy" name="level" value="29"><label for="easy">쉬움</label>
                <input type="radio" id="normal" name="level" value="30"><label for="normal">보통</label>
                <input type="radio" id="hard" name="level" value="31"><label for="hard">어려움</label>
                <input type="radio" id="veryhard" name="level" value="32"><label for="veryhard">매우 어려움</label>
            </div> 
        </div>
        <div class="keyword-wrapper" id="keyword-taketime-wrapper">
            <div>조리시간</div>
            <div class="slider-radio edgy">
                <input type="radio" id="five" name="taketime" value="33" ><label for="five">5분 이내</label>
               <input type="radio" id="fifteen" name="taketime" value="34"><label for="fifteen">15분 이내</label>
                <input type="radio" id="thirty" name="taketime" value="35"><label for="thirty">30분 이내</label>
                <input type="radio" id="hour" name="taketime" value="36"><label for="hour">1시간 이내</label>
                <input type="radio" id="overhour" name="taketime" value="37"><label for="overhour">1시간 초과</label>

            </div> 
        </div>
        <div class="keyword-wrapper" id="keyword-foodtype-wrapper">
            <div>종류</div>
            <div class="slider-radio edgy">
                    <input type="radio" id="koreansoup" name="foodtype" value="38" ><label for="koreansoup">국/탕류</label>
                    <input type="radio" id="jjigae" name="foodtype" value="39"><label for="jjigae">찌개</label>
                    <input type="radio" id="sidedish" name="foodtype" value="40"><label for="sidedish">반찬</label>
                    <input type="radio" id="noodle" name="foodtype" value="41"><label for="noodle">면</label>
                    <input type="radio" id="dumpling" name="foodtype" value="42"><label for="dumpling">만두</label>
                    <input type="radio" id="rice" name="foodtype" value="43"><label for="rice">밥</label>
                    <input type="radio" id="salad" name="foodtype" value="44"><label for="salad">샐러드</label>
                    <input type="radio" id="soup" name="foodtype" value="45"><label for="soup">스프</label>
                    <input type="radio" id="beverage" name="foodtype" value="46"><label for="beverage">음료</label>
                    <input type="radio" id="bread" name="foodtype" value="47"><label for="bread">빵/디저트</label>
                    <input type="radio" id="hardboiled" name="foodtype" value="48"><label for="hardboiled">조림</label>
                    <input type="radio" id="easymixed" name="foodtype" value="49"><label for="easymixed">무침</label>
                    <input type="radio" id="hardmixed" name="foodtype" value="50"><label for="hardmixed">비빔</label>
                    <input type="radio" id="steamed" name="foodtype" value="51"><label for="steamed">찜</label>
                    <input type="radio" id="pickled" name="foodtype" value="52"><label for="pickled">절임</label>
                    <input type="radio" id="fried" name="foodtype" value="53"><label for="fried">튀김</label>
                    <input type="radio" id="boiled" name="foodtype" value="54"><label for="boiled">삶기</label>
                    <input type="radio" id="cooked" name="foodtype" value="55"><label for="cooked">굽기</label>
                    <input type="radio" id="blanch" name="foodtype" value="56"><label for="blanch">데치기</label>
                    <input type="radio" id="row" name="foodtype" value="57"><label for="row">회</label>
                    <input type="radio" id="foodtypeetc" name="foodtype" value="58"><label for="foodtypeetc">기타</label>
            </div>
        </div>
    </div>  	
    
    <div id="editorjs">
            <input type="text" id="title" placeholder="제목을 입력해주세요.">
        </div>
    <div id="buttonWrapper">
        <button>저장</button>
    </div>
    <script>
    
    /* 업로드 체크 */
    function fileCheck( file )
    {
            // 사이즈체크
            var maxSize  = 5 * 1024 * 1024    //30MB
            var fileSize = 0;

    	// 브라우저 확인
    	var browser=navigator.appName;
    	
    	// 익스플로러일 경우
    	if (browser=="Microsoft Internet Explorer")
    	{
    		var oas = new ActiveXObject("Scripting.FileSystemObject");
    		fileSize = oas.getFile( file.value ).size;
    	}
    	// 익스플로러가 아닐경우
    	else
    	{
    		fileSize = file.files[0].size;
    	}


            if(fileSize > maxSize)
            {
                alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다.    ");
                return;
            }

            document.fileForm.submit();
    }
    
         let fileList="";
       const editor = new EditorJS({
            holderId: 'editorjs',

            autofocus: false,
            data: {"time":1557295973064,"blocks":[{"type":"quote","data":{"title":"","message":""}},{"type":"warning","data":{"title":"","message":""}}],"version":"2.13.0"},
            tools: { 
                warning: {
                    class: Warning,
                    inlineToolbar: true,
                    shortcut: 'CMD+SHIFT+W',
                    config: {
                        titlePlaceholder: '주의사항',
                        messagePlaceholder: '내용을 입력해주세요',
                    },
                },
     
                table: {
                    class: Table,
                    inlineToolbar: true,
                    config: {
                        rows: 2,
                        cols: 3,
                    },
                },                       
                quote: {
                    class: Quote,
                    inlineToolbar: true,
                    shortcut: 'CMD+SHIFT+O',
                    config: {
                        quotePlaceholder: '내용을 입력해주세요',
                        captionPlaceholder: '출처',
                    },
                },
            image: {
                    class: ImageTool,
                    config: {
                        uploader: {
                            uploadByFile(file){

                                function imgUpload() {
                                    console.dir(file);
                                    if(file.size > 50 * 1024 * 1024) {
                                    	alert("첨부파일 사이즈는 50MB 이내로 등록 가능합니다.");
                                    	return;
                                    }
                                    let fileData = new FormData();
                                    
                                        fileData.append("attach", file);                                         
                                    return new Promise(function (resolve, reject) {
                              alert("업로드 중...");
                                        $.ajax({
                                            url: 'upload.do',
                                            type: "post",
                                         	processData: false,
                                            contentType: false,
                                            data: fileData,
                                            success: function (response) {
                                                
                                               if (response) {   
                                                  console.dir(response);
                                                  var obj = JSON.parse(response);
                                                   console.log(obj.path);
//                                                    console.log("${pageContext.request.contextPath}/recipe/download.do?path="+obj.path+"&sysname=" + obj.sysname);
                                                   resolve({
                                                     cnt: 1,
                                                     url: "${pageContext.request.contextPath}/recipe/download.do?path="+obj.path+"&sysname=" + obj.sysname
                                                 });
                                                }
                                            },
                                            error: function () {
                                                reject(new Error("imgUpload 실패함"));
                                            }
                                        });
                                    });
                                }

                                return imgUpload().then((result) => {
                                    alert("업로드 완료!");
                                    console.dir(result);
                                    return {
                                        success: result.cnt,
                                        file: {
                                            url: result.url,
                                        }
                                    };
                                });
                            }
                        }
                    }
                },            

                header: {
                    class: Header,
                    inlineToolbar: ['link']
                }, 
                checklist: {
                    class: Checklist,
                    inlineToolbar: true,
                },
                linkTool: {
                    class: LinkTool,
                    config: {
                        endpoint: 'http://127.0.0.1:5500', // Your backend endpoint for url data fetching
                    }
                },
                marker: {
                    class: Marker,
                    shortcut: 'ALT+M'
                },
                list: {
                    class: List,
                    "data":{
                       "style":"ordered"
                    },
                    inlineToolbar: ['link', 'bold']
                },
                embed: {
                    class: Embed,
                    inlineToolbar: false,
                    config: {
                        services: {
                            youtube: true,
                            coub: true
                        }    
                    }
                }
            }
        });

        let saveBtn = document.querySelector("button");
        saveBtn.addEventListener("click", function () {    			

           let recipeTitle = $("#title").val();
            console.dir(editor);
            editor.save().then((outputData)=>{
        
               let cnt = 0;
               for(let fileUrl of outputData.blocks){
            	   
                  if(fileUrl.type == 'image'){
                     fileList += (cnt==0)?fileUrl.data.file.url:","+fileUrl.data.file.url;   
                     cnt++;
                  }
               }
               
               
               let keywords = []; 
               let keyword = "";
               keywords.push($("input[name='country']:checked").val());
               keywords.push($("input[name='situation']:checked").val());
               keywords.push($("input[name='level']:checked").val());
               keywords.push($("input[name='taketime']:checked").val());
               keywords.push($("input[name='foodtype']:checked").val());
                 
               console.log("fileList : " + fileList);
               let cautions = [];
               $("input[name='caution']:checked").each(function(){
            	   cautions.push($(this).val());
               });
				
               let content = JSON.stringify(outputData);
               let title= $("#title").val();   
               
               let imgPath = "";
               if(fileList == "") imgPath = "";
               else if(fileList != "" && cnt == 1) imgPath = fileList;
               else imgPath = fileList.split(",")[0]; 
				
               let form = new FormData();
               form.append("imgPath",imgPath);
               form.append("content",content);
               form.append("keyword",keywords);
               form.append("caution",cautions);
               form.append("title",title);
               
               $.ajax({
               	  type: "post",
                  url:"write.do",
               	  processData : false,
               	  contentType : false,
                  data: form,
                  success:function(result){               
                  }
               });                
          
                 location.href="<c:url value="/recipe/main.do"/>";
            }).catch((error)=>{
                console.log("Saving failed : ", error);
            });
        });
        
        
    </script>
</body>
</html>
