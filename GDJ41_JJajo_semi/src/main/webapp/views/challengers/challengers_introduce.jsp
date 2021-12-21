<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ page import="java.util.*" %>
<%@ page import="com.im.challengers.model.vo.CH_Advertisement" %>

<%

	List<CH_Advertisement> adList = (List)request.getAttribute("advertisementList");

%>



<%@ include file="/views/common/header.jsp"%>       
    
    
   <section>
   	<!-- 타이틀 제목 -->
      <div class="container"  style="text-align: center; font-size: 50px; color: #01DFD7;" >
        Challenge List
	  </div>
      <br>
     
     <!-- 로그인된 유저가 관리자일 경우에만 광고등록 버튼이 생성된다 -->
     <%if(loginMember!=null && loginMember.getMemberId().equals("admin")){ %>
     <div class="container" style="text-align: center;">
     <button type="button" class="btn btn-outline-dark" onclick="location.assign('<%=request.getContextPath()%>/challengers/advertisement_enroll.do')">광고등록</button>
     </div>
     <br>
     <%}%>
     
     <!-- 광고 제공 안내문구 부분 -->
     <div class="container">
      <div class="row">
        <div class="col-1">
        <!-- 좌측으로부터 col-1만큼의 공간확보 -->
        </div>
        <div class="col" style="color:grey">
          <span class="image blinking" >  ※ 해당 페이지는 광고를 제공하고 있습니다 ※</span>
        </div>
      </div>
   </div>
 
   	<!-- 광고 표시되는 부분 -->
      <div class="container">
        <div class="row">
	        <div class="col-1" >
	           <!-- 좌측으로부터 col-1만큼의 공간확보 -->
	        </div>
	        <div class="col">
		        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel" style="border: 10px solid #A4A4A4;">
		          <div class="carousel-inner">
					<%if(adList!=null && !(adList.isEmpty())){
						int count=1;
					for(CH_Advertisement ad : adList){
					/*첫번째 캐러셀에만 active속성이 적용되야함으로 다음과 같이 로직을 작성하였음*/
					if(count==1){  %>
					 <div class="carousel-item active">
					<%count++;}else{ %>
		           	 <div class="carousel-item">
		          	<%} %>
		              <a href="<%=ad.getAddress() %>" target="_blank"><img src="<%=request.getContextPath()%>/images/challengers/advertisement/<%=ad.getFilepath()%>" class="d-block w-100" id="challengeListAdvertisement" alt="..."></a>
		              <div class="carousel-caption d-none d-md-block">
		                <h5><%=ad.getContent() %></h5>
		                 <%if(loginMember!=null && loginMember.getMemberId().equals("admin")){ %>
			                <button type="button" class="btn btn-success" onclick="location.assign('<%=request.getContextPath()%>/challengers/advertisement_update.do?advertisementNo=<%=ad.getAdvertisementNo()%>')">수정하기</button>
			                <button type="button" class="btn btn-danger" onclick="location.assign('<%=request.getContextPath()%>/challengers/advertisement_delete.do?advertisementNo=<%=ad.getAdvertisementNo()%>')">삭제하기</button>
		                <%} %>
		              </div>
		            </div>
		            <%} 
		        	} %>      
		          </div>
		          	<!-- 광고 좌/우로 움직이는 버튼 -->
					  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
			            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			            <span class="visually-hidden">Previous</span>
			         </button>
			         <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
			            <span class="carousel-control-next-icon" aria-hidden="true"></span>
			            <span class="visually-hidden">Next</span>
			         </button>    
		          
		        </div>
	      	</div>
		<!--</div> if/else로 인해 div태그가 2개라서 </div>가 부족하다고 뜨는데 로직상 이거는 없어야 하는거니까 없애도 정상작동-->
	      <div class="col-1">
	           <!-- 좌측으로부터 col-1만큼의 공간확보 -->
	      </div>
    	</div>
      </div>
      <br>
      <br>

	<!-- 로그인된 유저가 관리자일 경우에만 챌린지 리스트등록 버튼이 생성된다 -->
	 <%if(loginMember!=null && loginMember.getMemberId().equals("admin")){ %>
     <div class="container" style="text-align: center;">
     <button type="button" class="btn btn-outline-dark" onclick="location.assign('<%=request.getContextPath()%>/challengers/ch_enroll.do')">List 등록</button>
     </div>
     <br>
     <%} %>
	
	<!-- 챌린지 리스트 출력되는 부분 -->
      <div class="container">
        <div class="row">
          <div class="col">
           
          </div>
          <div class="col">
            <div class="card" style="width: 18rem; border: 5px solid #81F7BE" >
              <img src="https://newsimg.hankookilbo.com/cms/articlerelease/2020/08/18/93e55f66-3144-4bea-834f-69df68b1cd4b.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title" style="text-align: center; color: #BCA9F5">헬스장 가기</h5>
                <p class="card-text" style="height: 100px;">어떠한 일에 집중하기 위해서는 주변 환경을 집중할 수 있도록 만들라는 말이 있죠? 헬스장 만큼 운동에 집중할 수 있는 곳이 있을까요? 도전해보시죠!</p>
                <div style="text-align: center;"><a href="#" class="btn btn-outline-success">도전하기</a></div>
              </div>
            </div>
          </div>
          <div class="col">
        
          </div>
          <div class="col">
            <div class="card h-100" style="width: 18rem; border: 5px solid #81F7BE">
              <img src="https://cphoto.asiae.co.kr/listimglink/6/2018111215570022200_1542005817.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title" style="text-align: center; color: #BCA9F5">물 1L 마시기</h5>
                <p class="card-text">혹시 하루 1L이상의 물을 섭취하는 것이 건강에 도움된다는 것을 알고 계셨나요? 물 마시기 습관화를 통해 건강을 지켜보세요! </p>
                <div style="text-align: center;"><a href="#" class="btn btn-outline-success">도전하기</a></div>
              </div>
            </div>
          </div>
          <div class="col">
           
          </div>
          <div class="col">
            <div class="card h-100" style="width: 18rem; border: 5px solid #81F7BE">
              <img src="https://src.hidoc.co.kr/image/lib/2019/4/8/20190408103037491_0.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title" style="text-align: center; color: #BCA9F5">1만보 걷기</h5>
                <p class="card-text">운동을 하고싶지만 방법을 몰라 고민하고 있는 당신! 오직 당신의 두 다리와 노력만으로도 운동을 할 수 있는 1만보 걷기! 도전해보시겠습니까? </p>
                <div style="text-align: center;"><a href="#" class="btn btn-outline-success">도전하기</a></div>
              </div>
            </div>
          </div>
          <div class="col">
           
          </div>
        </div>
      </div>
      <br>
      <br>


      <div class="container" style="text-align: center;">
        <button type="button" class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#mychallenge-go-check" style="font-size:20px;">My Challenge</button>
      </div>
      <br>

     

    </section>
    
<!---------------------------------------------------------- Modal ----------------------------------------------------------------------------->

	<div class="modal fade" id="mychallenge-go-check" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="staticBackdropLabel" >이동여부 확인</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        MyChallenge로 이동하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
	        <button type="button" class="btn btn-primary"  data-bs-dismiss="modal" onclick="location.href='<%=request.getContextPath() %>/challengers/mychallenge.do'">&ensp;네&ensp;</button>
	      </div>
	    </div>
	  </div>
	</div> 
    
    
    
<%@ include file="/views/common/footer.jsp"%>    