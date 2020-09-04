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
[![Video Label](https://img.youtube.com/vi/EgwHpzViGGU/0.jpg)](https://youtu.be/EgwHpzViGGU)

### 프로젝트 기술
* Back-End : Spring, myBatis, mySQL, Ajax
* Front-End : javascript, html, css, jQuery, jsp
* 협업 도구 : sourcetree, google spreadsheet

### 후기...
작업 과정에서 우여곡절도 있었지만, 단 한번의 잡음 없이 잘 협업해서 마무리해준 우리 팀원들에게 감사함을 느낀다. 
이번 프로젝트에는 오픈 api를 많이 적용했다. 간단한 api는 예시만으로도 충분히 구현 가능했지만 turn.js나 editor.js 같은 api는 구현하는데 상당히 애를 먹었다. 
국내에서 적용한 사례를 거의 찾지 못했고 설명 자체가 불친절한 경우가 있어 각각 api마다 하루씩 잡고 공부를 해야만했다. 다만 적용 후 만족도가 높았기 때문에 공들여 공부한 시간이 헛되지 않았다고 느꼈다. 적용한 api 중 Three.js를 가장 재밌게 개발했던 것이 생각난다. Three.js는 웹에서 3D환경을 구축할 수 있게끔 만들어주는 api이다. 시연할 때 3D가 너무 눈에 띈다는 다른 팀들의 의견에 따라 마지막으로 발표했는데 이전 발표를 보며 지친 청중들의 이목을 집중시키는데 큰 성과가 있었다. 
개발 당시 학교에서 수강했던 컴퓨터그래픽스, 컴퓨터 비전, 그래픽 디자인 수업이 3D환경을 이해하는데 도움을 주었다. 특히 그래픽 디자인 수업 때 배웠던 3DMAX가 이런 곳에서 도움이 될 것이라곤 꿈에도 몰랐다. 다만 드래그로 화면을 조작하는 상황에서 텍스트 드래그와 겹치게 되면 화면이 뿌옇게 변하는 상황이 발생하곤 했는데, 이 에러는 끝까지 원인을 찾지 못해 해결하지 못한게 아쉬움으로 남았다. 기회가 된다면 원인을 계속해서 탐구해보고싶다. 또한 Node.js를 이용해 실시간 채팅 기능을 구현하였는데, 채팅 기능 자체를 구현하는 데는 성공하였으나 페이지 이동시 실행시킨 채팅창을 유지하기 위해선 전체 페이지를 one page로 구축해야한다는 사실을 깨달았고 이내 발표에서 해당 부분을 제외할 수 밖에 없었다.  채팅 파트는 향후에 토이 프로젝트를 열어 반드시 구현하고자 한다. 긴 프로젝트를 진행하면서 개인적으로 느낀 가장 큰 성과는 개발에 대한 즐거움인 것 같다. 이전의 나는 미술 특기생으로 공대에 입학해 참 오랜 시간을 고생했다. 개발할 때마다 항상 두려움이 앞서고 이클립스만 실행하면 종종 식은 땀이 나곤했다. 학년이 올라가며 천천히 극복해오던 두려움을 이번 프로젝트로 완전히 날려버렸다. 새로운 아이디어가 떠오를 때마다 설렘이 가득하고 필요한 기술을 연마할 땐 즐거움에 밤을 지샜다. 무엇보다 개인보다 팀으로서 작업할 때 느껴지는 시너지가 개발을 즐겁게 만들어준 것 같다. 기능을 구현할 때마다 함께 고민하고 회의하는 과정이 개발을 한층 더 재밌게 했다. 회의 과정에서 이따금씩 의견이 충돌하기도 했지만 이해와 배려로 극복해나가는 과정에서 더 성장할 수 있었다.
***

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
* Three.js를 이용해 3D로 구현
* 개인 정보 수정 (프로필 사진, 비밀번호) -> 타인의 경우 팔로우 해제 또는 팔로우 기능 활성화
* 팔로워/팔로우 현황 확인
* 작성한 게시물 확인
* 내 스크랩북 확인/ 스크랩북 추가 -> 타인의 경우 확인 불가능
* 결제 내역 확인 -> 타인의 경우 확인 
* 레시피 작성으로 이동

<img src="/img/mykitchen2.gif" width="700px" height="350px">

[![Video Label](https://img.youtube.com/vi/bPgruR_YFa0/0.jpg)](https://youtu.be/bPgruR_YFa0)
