<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>PB스토어 상품 등록</title>
    <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
    <script src="<c:url value="/resources/js/editor.min.js"/>"></script>
    <script src="https://cdn.jsdelivr.net/npm/@editorjs/header@latest"></script>
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
    <link rel="stylesheet" href="<c:url value="/resources/css/admin/insertformpb.css"/>">
</head>
<body>
    <div id="writeform-header">상품 등록</div>
    <div id="paragraph">PB 상품을 등록해주세요</div>
    <div id="editorjs">
            <input type="text" id="name" placeholder="상품명을 입력해주세요.">
            <input type="text" id="price" placeholder="가격을 입력해주세요.">
        </div>
    <div id="buttonWrapper">
        <button>저장</button>
    </div>
    <script>
	(function($) {
	    let changeComma = function (val) {
	        val = val.toString().replace(/,/g, "");       //  /,/g : 정규표현식 문법 - g는 글로벌의약자.  입력받은값에 ,를 g(글로벌) 다 찾는다.
	        // + or - 로 시작하는 숫자값  ex> -123456  +123456
	        // 숫자 3자리마다 ,를 찍게 하는 패턴 (정규표현식을 이용하여) 만들기
	        let pattern = /(^[+-]?\d+)(\d{3})/;   
	        // , 를 3자리마다 계속 찍어줘야하기때문에 while루프를 도는데, pattern.test(val)를 주면 패턴대상에 맞는게 있으면 true 를 반환한다.
	        while (pattern.test(val)) {
	            val = val.replace(pattern, "$1" + "," + "$2");
	        }
	        return val;
	    };
	     
	    $.fn.comma = function() {     // $.fn.등록할함수명
	    let ele = this;     // this 는 jquery 객체가 된다.

	    // 숫자입력할 떄 3자리마다 , 가 추가 되도록 이벤트 설정하기
	    this.keyup(function () {
	        // ele.val -> text창에 입력되는 값을 changeComma 함수 에게 넘겨준다.  
	        // -> changeComma 함수가 처리하고 return해준 값을 ele.val 에 다시 세팅한다.
	        ele.val(changeComma(ele.val()));    
	    });
	  };
	})(jQuery);

	$("#price").comma();

    	let fileList="";
    	const editor = new EditorJS({
            holderId: 'editorjs',

            autofocus: true,
            data: {"time":1557295973064,
            	"blocks":[
            		{"type":"image","data":{"name":"","message":""}}
            		]
    				,"version":"2.13.0"},
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
                    },
                },
                
				image: {
                    class: ImageTool,
                    config: {
                    	captionPlaceholder: '#키워드를 입력해주세요',
                        uploader: {
                            uploadByFile(file){

                                function imgUpload() {
                                    console.dir(file);
                                    let fileData = new FormData();
                                    
                                        fileData.append("attach", file);  
                                        
                                    return new Promise(function (resolve, reject) {
                                        $.ajax({
                                            url: '${pageContext.request.contextPath}/store/uploadpb.do',
                                            type: "post",
                    	   					processData: false,
                                          	contentType: false,
                                            data: fileData,
                                            success: function (response) {
                                                
                                            	if (response) {	
                                            		console.dir(response);
                                            		var obj = JSON.parse(response);
                                                	console.log(obj.path);
                                                	console.log(obj.sysname);
                                                	console.log("${pageContext.request.contextPath}/store/downloadpb.do?path="+obj.path+"&sysname=" + obj.sysname);
                                                	resolve({
			                                            cnt: 1,
			                                            url: "${pageContext.request.contextPath}/store/downloadpb.do?path="+obj.path+"&sysname=" + obj.sysname
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
        	let storeName = $("#name").val();
        	let storePrice = $("#price").val();
            console.dir(editor)
            editor.save().then((outputData)=>{
            	
            	let cnt = 0;
            	for(let fileUrl of outputData.blocks){
            		if(fileUrl.type == 'image'){
		            	fileList += (cnt==0)?fileUrl.data.file.url:","+fileUrl.data.file.url;   
		            	cnt++;
            		}
            	}
            	
            	let content = JSON.stringify(outputData);
            	let name= $("#name").val();
            	let price= $("#price").val().replace(/,/g, "");
            	$.ajax({
					type: "post",
	   					url:"insertpb.do",
						data: {content : content,
								 name : name,
								 price : price,
								 imgPath : fileList},
						success:function(result){
			                location.href="<c:url value="/admin/pbstoreselectlist.do"/>";
						}
            	});
                console.log("Article data : ", outputData);
                console.log("name : "+name);
                console.log("price : "+price);
                console.log("content : " + content);
            }).catch((error)=>{
                console.log("Saving failed : ", error);
            });
        });
        
    	

    	
    </script>
</body>
</html>