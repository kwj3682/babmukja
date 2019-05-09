<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
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
</head>
<body>
    <div id="writeform-header">레시피 작성</div>
    
    <div id="editorjs"></div>
    <button>저장</button>
    <script>
        /*
            이미지의 경우 확장자가 이미지 확장자로 종료되어야 한다.

        */ 
        const editor = new EditorJS({
            holderId: 'editorjs',

            autofocus: true,
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
                        endpoints: {
                        byFile: 'http://localhost:8085/babmukja/file/upload.do' // Your backend file uploader endpoint
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
            console.dir(editor)
            editor.save().then((outputData) => {
                console.log("Article data : ", outputData);
                console.log(JSON.stringify(outputData));
            }).catch((error) => {
                console.log("Saving failed : ", error);
            });
        });
    </script>
</body>
</html>