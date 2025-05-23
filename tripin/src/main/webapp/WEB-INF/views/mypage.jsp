<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="icon" href="/tripin/resources/img/favicon.ico">
<!-- Pacifico 폰트 링크 -->
<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
<!-- Noto Sans KR 폰트 링크 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&amp;display=swap" rel="stylesheet">
<!-- Remix icon 아이콘 폰트 라이브러리 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.6.0/remixicon.min.css">
<!-- 내 css 파일경로 -->
<link href="/tripin/resources/css/mypage.css" rel="stylesheet">
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- 내 js 파일경로 -->
<script type="text/javascript" src="/tripin/resources/js/mypage.js"></script>
<c:choose>
    <c:when test="${not empty sessionScope.user}">
        <script>
            const USER_ID = ${sessionScope.user.user_id};
        </script>
    </c:when>
    <c:otherwise>
        <script>
            const USER_ID = null;
        </script>
    </c:otherwise>
</c:choose>
</head>
<body>
    <!-- 헤더 -->
	<header class="place_list_header">
		<div class="container">
			<!-- 타이틀 -->
			<div class="left-header">
				<img class="logo" src="/tripin/resources/img/tripin_logo.png">
				<nav class="main-nav">
					<a href="#" class="home">홈</a> <a href="#" class="trivy">트리비와
						대화하기</a> <a href="#" class="theme">테마여행</a>
				</nav>
			</div>
			<div class="icon-group">
				<button class="icon-button">
					<i class="ri-user-line"></i>
				</button>
			</div>
		</div>
	</header>
	<main class="main-container">
    
    	<!-- user_id 가져왔을 때 프로필 섹션-->
    	<section class="profile-section">
            <div class="profile-container">
                <div class="profile-image-wrapper">
                    <div class="profile-image-box">
                        <img class="profile-image" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fimgnews.naver.net%2Fimage%2F5401%2F2024%2F09%2F20%2F0000318721_003_20240920144609446.jpg&type=sc960_832">
                    </div>
                </div>
                <div class="profile-text">
                	<input type="hidden" id="user_id" value="${user.user_id }"/>
                    <h1 id="profile-name" class="profile-name">${user.user_name}</h1>
                    <p id="profile-login" class="profile-login">${user.login_id}</p>
                    <div class="profile-tags">
                    	<c:if test="${ reviewCount >= 50 }">
                    		<span class="tag blue">여행 애호가</span>
                    	</c:if>
                        <span class="tag green">리뷰 ${reviewCount}개</span>
                    </div>
                </div>
                <button id="edit-profile-btn" class="edit-profile-btn">
                    프로필 편집
                </button>
                
                
                <!-- 프로필편집 팝업창 -->
				<div id="profile-modal" class="modal-wrapper" style="display: none;">
					<div class="modal-content">
						<span class="close-btn">&times;</span>
						<h2>프로필 편집</h2>
						
						<div class="profile-image-wrapper">
							<label for="profileImage" class="image-label"> <img id="profilePreview" src="" alt="프로필 이미지"
								class="profile-image-edit">
								<input type="file" id="profileImage" name="profileImage" accept="image/*" style="display: none;">
							</label>
							<div class="image-instruction">클릭하여 수정</div>
						</div>
						
						<!-- 사진편집 시 enctype="multipart/form-data" -->
						<form id="profile-form" action="updateUser.do" method="post">
							<input type="hidden" name="user_id" value="${user.user_id}"/>
							<input type="hidden" id="beforePass" value="${user.password}"/>
							<!-- 닉네임 -->
							<div class="form-group">
								<label for="user_name">닉네임</label> <input type="text"
									id="user_name" name="user_name" value="${user.user_name}"
									required>
							</div>

							<!-- 비밀번호 -->
							<div class="form-group">
								<label for="password">비밀번호</label> 
								<input type="hidden" id="password" name="password">
								<input type="password" id="password-input" >
								<button type="button" id="edit-password-btn" class="edit-btn">비밀번호 수정</button>
								
								
								<div id="update_pass_group" class="form-group">
									<label for="update_pass">새로운 비밀번호</label> <input type="password" id="update_pass">
									<label for="update_pass_confirm">비밀번호 확인</label> <input type="password" id="update_pass_confirm">
								</div>
								<small id="password-message" style="color: red; ">비밀번호가 일치하지 않습니다.</small>
							</div>

							<!-- 휴대폰번호 -->
							<div class="form-group">
								<label for="phone_num">휴대폰번호</label> <input type="text" id="phone_num"
									name="phone_num" value="${user.phone_num}">
							</div>


							<button type="submit" class="submit-btn" disabled>저장</button>
						</form>
					</div>
				</div>
				<!-- end of 프로필 편집 -->
				
			</div>
        </section>        

        <!-- 탭 네비게이션 -->
        <div class="tab-section">
            <div class="tab-header">
                <button class="tab-button" id="place-saved">저장한 여행지</button>
                <button class="tab-button" id="review-written">내가 작성한 리뷰</button>
                <button class="tab-button" id="my-inquiries">내 문의</button>
            </div>
			
            <!-- 저장 콘텐츠 탭 컨텐츠 -->
            <div id="content-saved" class="p-6">                

                <!-- 저장한 여행지 탭 -->
                <div id="content-places" class="content-hidden">
                    <div class="places-grid">
                    
                    	<!-- ************데이터베이스에서 가져온 것들 forEach 돌리기 ***********-->
                     	<c:forEach var="place" items="${places}">
	                    	<div class="place-card">
	                    		<input type="hidden" class="dest_id" value="${place.dest_id}">
	                            <div class="place-image-wrapper">
	                                <img src="${place.repr_img_url}">
	                            </div>
	                            <div class="place-info">	                            	
	                                <h3 class="place-title">${place.dest_name }</h3>
	                                <p class="place-location">${place.full_address}</p>
	                                <div class="place-rating">
	                                    <div class="stars">
	                                    <!-- avg(rating) 만큼 for문 돌리기(소수점 고려해야함) -->
	                                    <c:forEach begin="1" end="${place.avg_rating}">
	                                    	<i class="ri-star-fill"></i>
	                                    </c:forEach>
	                                    
	                                        <i class="ri-star-half-fill"></i>
	                                    </div>
	                                    <!-- dest_id의 여행지 상세페이지로 이동(리뷰도 거기 있음)-->
	                                    <a href ="">
	                                    	<!-- reviews 테이블에서 dest_id로 group by하고 avg(rating) 가져오기 -->
	                                    	<span id="review-avg" class="review-text">${place.avg_rating}</span>
	                                    	<!-- reviews 테이블에서 dest_id로 group by하고 count(rating) 가져오기 -->
	                                    	<span id="review-count" class="review-text">(${place.review_count} 리뷰)</span>
                                   		</a>
	                                </div>
	                                <div class="place-actions">
	                                    <button class="detail-button">
	                                        <i class="ri-information-line mr-1"></i> 상세정보
	                                    </button>
	                                    <button class="heart-button">
	                                        <i class="icon ri-heart-fill"></i>
	                                    </button>
	                                </div>
	                            </div>
	                        </div>
                    	</c:forEach> 
                        
                    </div>
                </div>
                               
				<!-- 내가 작성한 리뷰 탭 컨텐츠 -->
                
                <div id="content-reviews" class="content-hidden">
                    <div class="review-list">
                    	<!-- *********리뷰 forEach 돌리기********* -->
                    	<c:forEach var="review" items="${reviews }">
	                    	<div class="review-card">
	                    	<input type="hidden" class="review_id" value='${review.review_id}' />
	                            <div class="review-header">
	                                <div class="review-place">
	                                    <div class="review-avatar">
	                                        <img src="https://readdy.ai/api/search-image?query=beautiful%20landscape%20of%20Gyeongbokgung%20Palace%2C%20Seoul%2C%20South%20Korea%2C%20traditional%20Korean%20architecture%2C%20palace%20grounds%2C%20travel%20destination&amp;width=100&amp;height=100&amp;seq=12&amp;orientation=squarish" alt="경복궁">
	                                    </div>
	                                    <div>
	                                    	<!-- dests랑 조인해야되서 reviewVO에 dest_name 멤버 추가 해야됨 -->
	                                        <h3 class="place-title">${review.dest_name}</h3>
	                                        <div class="star-rating">
	                                        	<!-- ${review.rating} 값으로 for문 돌려야함-->
	                                        	
	                                            <c:forEach begin="1" end="${review.rating}">
											        <i class="ri-star-fill"></i>
											    </c:forEach>
	                                        </div>
	                                    </div>
	                                </div>
	                                <span class="review-text">${review.created_at}</span>
	                            </div>
	                            <p class="review-text">${review.content}</p>
	                            <!-- review 사진 갯수만큼 for문 돌려야함 -->
	                            <div class="review-photos">
	                                <div class="photo-thumbnail">
	                                    <img src="https://readdy.ai/api/search-image?query=detailed%20view%20of%20Gyeongbokgung%20Palace%20gate%2C%20traditional%20Korean%20architecture%2C%20tourists%20in%20hanbok%2C%20sunny%20day%2C%20travel%20photo&amp;width=100&amp;height=100&amp;seq=13&amp;orientation=squarish" alt="리뷰 사진">
	                                </div>
	                                <div class="photo-thumbnail">
	                                    <img src="https://readdy.ai/api/search-image?query=inside%20Gyeongbokgung%20Palace%2C%20traditional%20Korean%20pavilion%2C%20pond%2C%20mountains%20in%20background%2C%20beautiful%20scenery%2C%20travel%20photo&amp;width=100&amp;height=100&amp;seq=14&amp;orientation=squarish" alt="리뷰 사진">
	                                </div>
	                            </div>
	                            
	                            <div class="review-actions">
	                                <button class="action-button update">
	                                    <i class="ri-edit-line mr-1"></i> 수정
	                                </button>
	                                <button class="action-button delete">
	                                    <i class="ri-delete-bin-line mr-1"></i> 삭제
	                                </button>
	                            </div>
	                        </div>                    	
                    	</c:forEach>
                        
                    </div>
                </div>
                
                <!-- 내 문의 탭 컨텐츠 -->
                
                <div id="content-inquiries" class="content-hidden">
                    <div class="inquiry-list">
                    	<!-- *********문의 forEach 돌리기********* -->
                    	<c:forEach var="inquiry" items="${inquiries}">
	                    	<div class="inquiry-card">
	                    		<input type="hidden" class="chat_inq_id" value="${inquiry.chat_inq_id}"/>
	                    		<input type="hidden" class="user_id" value="${inquiry.user_id}"/>
	                            <div class="inquiry-header">
	                                <span class="inquiry-date">${inquiry.conv_at}</span>
	                            </div>
								<div class="inquiry-content">
									<p class="inquiry-text">${inquiry.user_query}</p>
									<button class="action-button delete_inquiry">
										<i class="ri-delete-bin-line mr-1"></i> 삭제
									</button>
								</div>
								<hr/>
	                            <!-- nvl써서 null 일 때 '관리자가 답변 확인 중입니다' 확인. -->
	                            <p class="inquiry-text">${inquiry.admin_response}</p>
	                            <div class="inquiry-actions">
	                            </div>
	                        </div>
                    	</c:forEach>
                    
                    </div>
                </div>
               
                
            </div>
        </div>
    </main>
    


    <footer class="custom-footer">
        <div class="footer-container">
            <div class="footer-content">
                <div class="footer-left">
                    <p class="footer-text">© 2025 Tripin. 모든 권리 보유.</p>
                </div>
                <div class="footer-links">
                    <a href="#">고객센터</a>
                    <a href="#">개인정보 처리방침</a>
                    <a href="#">이용약관</a>
                    <a href="#">로그아웃</a>
                </div>
            </div>
        </div>
    </footer>



<script src="https://static.readdy.ai/static/share.js"></script> -->


</body>
</html>