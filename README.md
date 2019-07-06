# BABMUKJA

### 기획 의도
시중에 많은 요리 전문 사이트가 있으나 이들 사이트가 요리에 필요한 재료를 바로 구매할 수 없다는 점, 이용자들이 요리에 관한 관심을 키울 수 있는 커뮤니티 기능을 구현하지 않는 점 등이 아쉬움으로 남았다. 이에 레시피를 작성하고 쉽게 관리할 수 있으며 필요한 요리의 재료를 즉시 구매할 수 있는 사이트를 제작하고자 하였다. 또한 이용자 간 요리 모임을 만들 수 있는 기능까지 추가하였다.

### 프로젝트 진행 과정
총 7주간 진행
* 1주차 : 프로젝트 기획
* 2주차 : 데이터 모델링
* 3 ~ 6주차 : 개발 기간
* 7주차 : 코드 리펙토링, 발표 준비 및 발표 후 마무리

### 프로젝트 영상
[![Video Label](https://www.youtube.com/watch?v=EgwHpzViGGU&feature=youtu.be%2F0.jpg)](https://youtu.be/EgwHpzViGGU)

### 프로젝트 기술
* Back-End : Spring, myBatis, mySQL
* Front-End : javascript, html, css, jQuery, jsp
* 협업 도구 : sourcetree, google spreadsheet

### 주요 기능
1. 레시피 - 레시피 작성(Editor.js)
* 레시피를 상징하는 키워드를 선택할 수 있으며, 직관적인 블럭 형태로 본문을 작성할 수 있음.
* 키워드 선택
* Editor.js를 이용한 블럭 형태의 게시글 작성
<img src="/img/reicpewrite.gif" width="700px" height="300px">
<img src="/img/recipewirte-body.jpg" width="700px" height="400px">
<img src="/img/editor-menubar.gif" width="700px" height="100px">
<img src="/img/editor-imgupload.gif" width="700px" height="250px">

2. 레시피 - 레시피 검색
* 메뉴바에서 나라별로 구분 기능
* 무한 스크롤로 페이징
* 키워드로 검색
<img src="/img/main-menubar.gif" width="700px" height="100px">
<img src="/img/infinitescroll.gif" width="700px" height="250px">
<img src="/img/searchrecipe.gif" width="700px" height="600px">

3. 레시피 - 레시피 상세 조회
* 작성자에 대한 팔로우 기능
* 게시글에 대한 좋아요 기능
* 댓글과 함께 평점 입력 기능
<img src="/img/recipedetail.gif" width="700px" height="350px">

4. 스토어 - 상품 조회 및 검색
* 상품 검색 및 정렬 기능
<img src="/img/storelist.gif" width="700px" height="350px">
<img src="/img/storelistsearch.gif" width="700px" height="350px">

5. 스토어 -  상품 상세 조회
* 상품에 대한 좋아요 기능
* 상품에 대한 후기(별점)와 문의를 남길 수 있음
* 상품 수량 변경 후 장바구니에 추가 기능
* 장바구니 추가 후, 계속 쇼핑하거나 장바구니로 이동할 수 있음 (장바구니는 상단 메뉴바의 오른쪽 장바구니 버튼을 클릭해도 이동할 수 있다)
* 결제 완료 시 결제 내역화면으로 이동 (결제 내역은 마이페이지에서 확인 가능)
<img src="/img/storedetail.gif" width="700px" height="350px">
<img src="/img/payment.gif" width="700px" height="350px">
<img src="/img/review.gif" width="700px" height="350px">

6. 모임
* 모임 개설과 모임 관리 기능 제공
* 원하는 날짜와 카테고리, 키워드,회비를 설정한 후, 표지 이미지를 업로드하면 모임 개설 가능
* 모임 상세 화면에서 모임에 대한 소개글 작성 기능 제공
* 모임 상세 화면에서 공지사항과 자유게시판, 2개의 게시판 기능을 제공하고 있음
* 모임 상세화면에서 사진첩 기능을 제공(업로드된 이미지들을 모아서 확인할 수 있음)
* 모임 개설자는 회원 신청 현황과 회원 관리를 할 수 있음
<img src="/img/meetup.gif" width="700px" height="350px">
<img src="/img/meetup-introwrite.gif" width="700px" height="350px">
<img src="/img/meetup-notice.gif" width="700px" height="350px">
<img src="/img/meetup-detail.gif" width="700px" height="350px">
<img src="/img/meetup-member.gif" width="700px" height="350px">

7.마이 페이지(마이키친)
* 개인 정보 수정 (프로필 사진, 비밀번호) -> 타인의 경우 팔로우 해제 또는 팔로우 기능 활성화
* 팔로워/팔로우 현황 확인
* 작성한 게시물 확인
* 내 스크랩북 확인/ 스크랩북 추가 -> 타인의 경우 확인 불가능
* 결제 내역 확인 -> 타인의 경우 확인 
* 레시피 작성으로 이동
[![Video Label](https://www.youtube.com/watch?v=bPgruR_YFa0&feature=youtu.be/0.jpg)](https://youtu.be/bPgruR_YFa0)
