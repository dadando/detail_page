<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.spring.alltion.productList.*" %>
<%@ page import="com.spring.alltion.login.*" %>
<%@ page import="com.spring.alltion.productRegistration.ProductVO" %>
<%
 	List<ProductVO> mainlist = (List<ProductVO>)request.getAttribute("mainlist");
	List<ProductVO> cateList = (List<ProductVO>)request.getAttribute("cateList");
	List<ProductVO> viewList = (List<ProductVO>)request.getAttribute("viewList");
/*
	List<ProductVO> pricelist=(List<ProductVO>)request.getAttribute("pricelist");
	List<ProductVO> participantslist=(List<ProductVO>)request.getAttribute("participantslist");
	List<ProductVO> viewslist=(List<ProductVO>)request.getAttribute("viewslist");
	*/
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./resources/css/index_main.css?after">
    <link rel="stylesheet" href="./resources/css/main_style.css?after">
    <link href="https://fonts.googleapis.com/css2?
    family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>All-tion</title>
</head>
<body>
    <!-- 모든 페이지 공통 영역 by 하나  -->
    <!-- 광고 배너 및 헤더 -->
    <div class="ad__banner"> 	
        <a href="https://coupa.ng/bEUWFN" target="_blank">
            <img src="https://ads-partners.coupang.com/banners/263827?subId=&traceId=V0-301-969b06e95b87326d-I263827&w=728&h=90" >
        </a>
        <button style="background:url(./resources/img/header/close_btn.png);" class="ad__banner--closeBtn"></button>
<!--
        <a href="#" class="ad__banner--link">
            <img src="img/header/adEx.png" class="ad__banner--img">
            <button class="ad__banner--closeBtn"></button>
        </a>
-->
    </div>
    <div class="header">
        <jsp:include page="../header/main_header.jsp"></jsp:include>
    </div>
    <!-- 배너 영역 -->
    <div class="banner">
        <div class="banner_slide current">
            <img src="./resources/img/banner/01.jpg">
        </div>
        <div class="banner_slide">
            <img src="./resources/img/banner/02.jpg">
        </div>
        <div class="banner_slide">
            <img src="./resources/img/banner/03.jpg">
        </div>
        <button class="bannerBtn prev">
        	<span class="material-icons">
			arrow_back_ios
			</span>
        </button>
        <button class="bannerBtn next">
        	<span class="material-icons">
			arrow_forward_ios
			</span>
        </button>
    </div>
    
    <!-- !! 메인 페이지 내용(지워서 사용함) !! start -->
    <!--  메뉴 카테고리  -->
    
    <div class="menu">
        <div class="menu__tab">
            <input type="radio" name="menu--name" id="popular-items" checked>
            <label for="popular-items">많이 본 경매</label>
            <input type="radio" name="menu--name" id="deadline-items">
            <label for="deadline-items">마감 임박</label>
            <input type="radio" name="menu--name" id="resell-items">
            <label for="resell-items">인기 경매</label>
            <!-- 
            <input type="radio" name="menu--name" id="premium-items">
            <label for="premium-items">프리미엄관</label>
             -->
            <!--  많이 본 경매  -->
            <div class="menu-box content1">
			
            <% if(!mainlist.isEmpty()){
            loop : for(int i = 0; i < mainlist.size(); i++){%>	       	
                <ul class="items__list product">
	            <%for(int j = i; j < i + 4; j++) {
					if(j == mainlist.size()) {
						break loop;
					}
					
					ProductVO mainVo = (ProductVO)mainlist.get(j);
	            %> 
            	
            	<!-- 
            	<ul class="items__list popular">
            	 -->
                 	 <li>
                    	<a href="/alltion/boarddetail.hs?product_number=<%=mainVo.getProduct_number() %>">
                            <div class="product-box">
                               <img src=<%=mainVo.getProduct_img_1() %>><br>
                            </div>
                            <div class="items__product--info product">
                                <p class="product_name"><%=mainVo.getProduct_subject() %></p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown"><%=mainVo.getProduct_issue_date() %></span>
                                <div class="price-txt">
                                    <p class="price_text">현재가</p>
                                    <p class="current_price"><%=mainVo.getProduct_current_price() %> 원</p>
                                    <p class="price_text">즉시 구매가</p>
                                    <p class="direct_price"><%=mainVo.getProduct_purchase_price() %> 원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                <% if(j == i + 3){
                    i = j;
                    break;
                	}
                }%>
                </ul>
              <%} }%>
              
                <!-- 
                </ul>
                 -->
            </div>
            <!--  마감 임박  -->
            <div class="menu-box content2">
                <ul class="deadline-items__category">
                    <li id="tab1" class="active">
                        패션
                    </li>
                    <li id="tab2">
                        뷰티
                    </li>
                    <li id="tab3">
                        출산/유아동
                    </li>
                    <li id="tab4">
                        전자기기
                    </li>
                    <li id="tab5">
                        가전제품
                    </li>
                    <li id="tab6">
                        가구/인테리어
                    </li>
                    <li id="tab7">
                        반려동물/취미
                    </li>
                    <li id="tab8">
                        도서/음반/문구
                    </li>
                    <li id="tab9">
                        티켓/쿠폰
                    </li>
                    <li id="tab10">
                        스포츠
                    </li>
                    <li id="tab11">
                        공구/산업용품
                    </li>
                    <li id="tab12">
                        기타 및 잡화
                    </li>
                </ul>
                <div class="deadline-items--product tab1 active">
                    <ul class="items__list deadline">
                    	<li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="deadline-items--product tab2">
                    <ul class="items__list deadline">
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="deadline-items--product tab3">
                    <ul class="items__list deadline">
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="deadline-items--product tab4">
                    <ul class="items__list deadline">
						<li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="deadline-items--product tab5">
                    <ul class="items__list deadline">
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="deadline-items--product tab6">
                    <ul class="items__list deadline">
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="deadline-items--product tab7">
                    <ul class="items__list deadline">
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="deadline-items--product tab8">
                    <ul class="items__list deadline">
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p><!-- 현재 가격 -->
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="deadline-items--product tab9">
                    <ul class="items__list deadline">
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="deadline-items--product tab10">
                    <ul class="items__list deadline">
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="deadline-items--product tab11">
                    <ul class="items__list deadline">
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="deadline-items--product tab12">
                    <ul class="items__list deadline">
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <!--  인기 경매  -->
            <div class="menu-box content3">
            <% if(!viewList.isEmpty()){
            loop : for(int i = 0; i < viewList.size(); i++){%>	       	
                <ul class="items__list resell">
	            <%for(int j = i; j < i + 4; j++) {
					if(j == viewList.size()) {
						break loop;
					}
					
					ProductVO viewVo = (ProductVO)viewList.get(j);
	            %> 
	            	<li>
                    	<a href="/alltion/boarddetail.hs?product_number=<%=viewVo.getProduct_number() %>">
                            <div class="product-box">
                               <img src=<%=viewVo.getProduct_img_1() %>><br>
                            </div>
                            <div class="items__product--info product">
                                <p class="product_name"><%=viewVo.getProduct_subject() %></p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown"><%=viewVo.getProduct_issue_date() %></span>
                                <div class="price-txt">
                                    <p class="price_text">현재가</p>
                                    <p class="current_price"><%=viewVo.getProduct_current_price() %> 원</p>
                                    <p class="price_text">즉시 구매가</p>
                                    <p class="direct_price"><%=viewVo.getProduct_purchase_price() %> 원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    <!--
                    <li>
                        <a href="#">
                            <div class="product-box">
                               <img src="./resources/img/product/product_ex.png"><br>
                            </div>
                            <div class="items__product--info resell">
                                <p class="product_name">품목 이름</p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown">2020/06/15 00:00</span>
                                <div class="bookmark">
                                    <span class="material-icons bookmark_border">bookmark_border</span>
                                    <p class="bookmark--count">99</p>
                                </div>
                                <div class="price-txt">
                                    <p class="price_text">현재가</p>
                                    <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                    <p class="price_text">즉시 구매가</p>
                                    <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="product-box">
                               <img src="./resources/img/product/product_ex.png"><br>
                            </div>
                            <div class="items__product--info resell">
                                <p class="product_name">품목 이름</p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown">2020/06/15 00:00</span>
                                <div class="bookmark">
                                    <span class="material-icons bookmark_border">bookmark_border</span>
                                    <p class="bookmark--count">99</p>
                                </div>
                                <div class="price-txt">
                                    <p class="price_text">현재가</p>
                                    <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                    <p class="price_text">즉시 구매가</p>
                                    <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="product-box">
                               <img src="./resources/img/product/product_ex.png"><br>
                            </div>
                            <div class="items__product--info resell">
                                <p class="product_name">품목 이름</p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown">2020/06/15 00:00</span>
                                <div class="bookmark">
                                    <span class="material-icons bookmark_border">bookmark_border</span>
                                    <p class="bookmark--count">99</p>
                                </div>
                                <div class="price-txt">
                                    <p class="price_text">현재가</p>
                                    <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                    <p class="price_text">즉시 구매가</p>
                                    <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="product-box">
                               <img src="./resources/img/product/product_ex.png"><br>
                            </div>
                            <div class="items__product--info resell">
                                <p class="product_name">품목 이름</p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown">2020/06/15 00:00</span>
                                <div class="bookmark">
                                    <span class="material-icons bookmark_border">bookmark_border</span>
                                    <p class="bookmark--count">99</p>
                                </div>
                                <div class="price-txt">
                                    <p class="price_text">현재가</p>
                                    <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                    <p class="price_text">즉시 구매가</p>
                                    <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="product-box">
                               <img src="./resources/img/product/product_ex.png"><br>
                            </div>
                            <div class="items__product--info resell">
                                <p class="product_name">품목 이름</p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown">2020/06/15 00:00</span>
                                <div class="bookmark">
                                    <span class="material-icons bookmark_border">bookmark_border</span>
                                    <p class="bookmark--count">99</p>
                                </div>
                                <div class="price-txt">
                                    <p class="price_text">현재가</p>
                                    <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                    <p class="price_text">즉시 구매가</p>
                                    <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="product-box">
                               <img src="./resources/img/product/product_ex.png"><br>
                            </div>
                            <div class="items__product--info resell">
                                <p class="product_name">품목 이름</p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown">2020/06/15 00:00</span>
                                <div class="bookmark">
                                    <span class="material-icons bookmark_border">bookmark_border</span>
                                    <p class="bookmark--count">99</p>
                                </div>
                                <div class="price-txt">
                                    <p class="price_text">현재가</p>
                                    <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                    <p class="price_text">즉시 구매가</p>
                                    <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="product-box">
                               <img src="./resources/img/product/product_ex.png"><br>
                            </div>
                            <div class="items__product--info resell">
                                <p class="product_name">품목 이름</p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown">2020/06/15 00:00</span>
                                <div class="bookmark">
                                    <span class="material-icons bookmark_border">bookmark_border</span>
                                    <p class="bookmark--count">99</p>
                                </div>
                                <div class="price-txt">
                                    <p class="price_text">현재가</p>
                                    <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                    <p class="price_text">즉시 구매가</p>
                                    <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="product-box">
                               <img src="./resources/img/product/product_ex.png"><br>
                            </div>
                            <div class="items__product--info resell">
                                <p class="product_name">품목 이름</p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown">2020/06/15 00:00</span>
                                <div class="bookmark">
                                    <span class="material-icons bookmark_border">bookmark_border</span>
                                    <p class="bookmark--count">99</p>
                                </div>
                                <div class="price-txt">
                                    <p class="price_text">현재가</p>
                                    <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                    <p class="price_text">즉시 구매가</p>
                                    <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    -->
                <% if(j == i + 3){
                    i = j;
                    break;
                	}
                }%>
                </ul>
              <%} }%>
            </div>
            <!--  프리미엄관  -->
            <div class="menu-box content4">프리미엄관 내용</div>
        </div>
    </div>
    
    <!-- 경매 규칙 및 회원 등급 제도 설명 -->
    <!-- 
    <div class="rules">
        <div class="rules__content">
            <ul class="rules__content">
                <li></li>
                <li></li>
            </ul>
        </div>
    </div>
     -->
    <!-- !! 메인 페이지 내용(지워서 사용함) !! end -->
    
    <!-- 푸터 영역 -->
    <div class="footer">
        <div class="upper_footer">
            <ul class="upper_footer--list">
                <li>
                    <a href="#">
                        올션소개
                    </a>
                </li>
                <li>
                    <a href="#">
                        채용정보
                    </a>
                </li>
                <li>
                    <a href="#">
                        공지사항
                    </a>
                </li>
                <li>
                    <a href="#">
                        이용약관
                    </a>
                </li>
                <li>
                    <a href="#">
                        개인정보처리방침
                    </a>
                </li>
                <li>
                    <a href="#">
                        전자금융거래약관
                    </a>
                </li>
                <li>
                    <a href="#">
                        제휴서비스
                    </a>
                </li>
            </ul>
        </div>
        <div class="lower_footer">
            <ul class="lower_footer__content">
                <li>
                    <p>상호명 : (주)올션 / 짜면된다 / 주소: 서울특별시 종로구 삼일대로 서울특별시 서초구 서초4동 강남대로</p>
                    <p>Tel: 02-000-0000 Fax : 02-000-0000 메일 : master@alltion.co.kr</p>
                    <p>사업자등록번호 : ###-##-##### 통신판매업 신고번호 : 제##–###호</p>
                </li>
                <li>
                    <p>올션은 통신판매중개자이며 통신 판매의 당사자가 아닙니다. 따라서 올션은 상품·거래정보 및 거래에 대하여 책임을 지지 않습니다.</p> 
                    <p>Copyright © Alltion All rights reserved.</p>
                </li>
            </ul>
        </div>    
    </div>
    
    <!--  스크립트 영역  -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="./resources/js/index_main.js"></script>
    <script src="./resources/js/banner.js"></script>
</body>
</html>