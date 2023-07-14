<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp"></jsp:include>



<!-- Blog Details Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                     <div class="sidebar__item">
                            <h4>기본대비요령</h4>
                            <ul>
                                <li><a href="/info/DP">재난대비</a></li>
                                <li><a href="/info/EP">비상대비</a></li>
                                
                            </ul>
                        </div>
                        <div class="sidebar__item">
                            <h4>사회재난</h4>
                            <ul>
                                <li><a href="/info/fire">화재</a></li>
                                <li><a href="/info/terrorism">테러</a></li>
                                <li><a href="/info/infectious_diseases">감염병 예방</a></li>
                                <li><a href="/info/collapse_building">건축물 붕괴</a></li>
                                <li><a href="/info/subway_accident">지하철 사고</a></li>
                                
                            </ul>
                        </div>
                        <div class="sidebar__item">
                            <h4>생활안전</h4>
                            <ul>
                                <li><a href="/info/first_aid">응급처치</a></li>
                                <li><a href="/info/CPR">심폐소생술</a></li>
                                <li><a href="/info/AED">자동심장충격기</a></li>
                                <li><a href="/info/fire_extinguisher">소화기 사용법</a></li>
                                <li><a href="/info/fire_hydrant">소화전 사용법</a></li>
                                
                            </ul>
                        </div>
                        <div class="sidebar__item">
                            <h4>자연재난</h4>
                            <ul>
                                <li><a href="/info/heat_wave">폭염</a></li>
                                <li><a href="/info/drought">가뭄</a></li>
                                <li><a href="/info/heavy_snow">대설</a></li>
                                <li><a href="/info/cold_wave">한파</a></li>
                                <li><a href="/info/earthquake">지진</a></li>
                                <li><a href="/info/lightning">낙뢰</a></li>
                                <li><a href="/info/landslide">산사태</a></li>
                                <li><a href="/info/ash">화산재 낙하</a></li>
                                <li><a href="/info/typhoon_heavyRain">태풍 및 호우</a></li>
                                <li><a href="/info/yellow_sand">황사 및 고농도 미세먼지</a></li>
                            </ul>
                        </div>
                        
                        
                       
                    </div>
                </div>
                <div class="col-lg-8 col-md-7 order-md-1 order-1">
                    <div class="checkout__form">
                        <h4>게시물 수정</h4>
                        <form action="#">
                            <div class="row">
                                <div class="col-lg-8 col-md-6">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            
                                        </div>
                                        
                                    </div>
                                    <div class="checkout__input">
                                    <p>제목</p><input type="text" placeholder="제목을 입력하세요.">
                                    </div>
                                    <div class="checkout__input">
                                        <textarea rows="8" cols="64" name="contents" placeholder="내용을 입력하세요."></textarea>
                                    </div>
                                        <th> <input type="file" name="imageFileName" onchange="readURL(this);"/></th>
                                    <br><br><br>
                                        <div class="checkout__input">
                                           <button type="submit" class="site-btn">수정</button>&nbsp
                                           <button type="reset" class="site-btn">삭제</button>&nbsp
                                           <button type="reset" class="site-btn">뒤로가기</button>&nbsp
                                        </div>
                                        
                                </div>
                               
                                </div>
                            </div>
                    <div class="blog__details__content">
                        <div class="row">
                            <div class="col-lg-6">
                            
                                </div>
                            </div>
                            <div class="col-lg-6">
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Details Section End -->


<jsp:include page="../include/footer.jsp"></jsp:include>
    