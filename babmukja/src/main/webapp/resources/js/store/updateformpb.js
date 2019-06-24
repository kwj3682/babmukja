    // 가격 , 정규식
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
    
    	const value = $("#hiddenValue").text();
    	const no = $("#hiddenNo").text();
    	
    	const editor = new EditorJS({
            holderId: 'editorjs',

            autofocus: true,
            data: JSON.parse(value),
            tools: { 
                warning: {
                    class: Warning,
                    inlineToolbar: true                 
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
                    inlineToolbar: true
                },
				image: {
                    class: ImageTool,
                    config: {
                        uploader: {
                            uploadByFile(file){

                                function imgUpload() {
                                    let fileData = new FormData();
                                        fileData.append("attach", file);  
                                    return new Promise(function (resolve, reject) {
                                        $.ajax({
                                            url: 'uploadpb.do',
                                            type: "post",
                    	   					processData: false,
                                          	contentType: false,
                                            data: fileData,
                                            success: function (response) {
                                            	if (response) {	
                                            		var obj = JSON.parse(response);
                                                	resolve({
			                                            cnt: 1,
			                                            url: "/babmukja/store/downloadpb.do?path="+obj.path+"&sysname=" + obj.sysname
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
        	let storepbName = $("#name").val();
        	let storepbPrice = $("#price").val();
            editor.save().then((outputData)=>{
            	let content = JSON.stringify(outputData);
            	let name= $("#name").val();
            	let price= $("#price").val().replace(/,/g, "");
            	$.ajax({
					type: "post",
	   					url:"updatepb.do",
						data: {content : content,
								 name : name,
								 price : price,
								  pbNo : no},
						success:function(result){
						}
            	});
                location.href= saveUrl;
            }).catch((error)=>{
                console.log("Saving failed : ", error);
            });
        });