<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Project Header</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
    
     <style>
      #login_id_chk,
      #login_pw_chk {
        color: red;
      }
    </style>
    <script>
      $(function () {
        $("#login_btn").on("click", function () {
          let id = $("#login_id").val();
          let pw = $("#login_pw").val();
          console.log("id: " + id + ", pw: " + pw);
          if (id && !id.includes(" ") && pw) {
            $("#login_id_chk").hide();
            $("#login_pw_chk").hide();
            let v_form = document.createElement("form");
            v_form.method = "post";
            v_form.action = "/member/login";
            let id_chk = document.createElement("input");
            id_chk.setAttribute("type", "hidden");
            id_chk.setAttribute("name", "id");
            id_chk.setAttribute("value", id);
            v_form.appendChild(id_chk);
            let pw_chk = document.createElement("input");
            pw_chk.setAttribute("type", "hidden");
            pw_chk.setAttribute("name", "pw");
            pw_chk.setAttribute("value", pw);
            v_form.appendChild(pw_chk);
            document.body.appendChild(v_form);
            v_form.submit();
          } else {
            if (!id || id.includes(" ")) {
              $("#login_id_chk").text("올바른 ID 형식이 아닙니다.");
              $("#login_id_chk").show();
            } else {
              $("#login_id_chk").hide();
            }
            if (!pw) {
              $("#login_pw_chk").text("올바른 비밀번호 형식이 아닙니다.");
              $("#login_pw_chk").show();
            } else {
              $("#login_pw_chk").hide();
            }
          }
        });
      });
    </script>
    
    
    
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="#"><img src="img/logo.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price">item: <span>$150.00</span></div>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
                <img src="img/language.png" alt="">
                <div>English</div>
                <span class="arrow_carrot-down"></span>
                <ul>
                    <li><a href="#">Spanis</a></li>
                    <li><a href="#">English</a></li>
                </ul>
            </div>
            <div class="header__top__right__auth">
                <a href="#"><i class="fa fa-user"></i> Login</a>
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="./index.html">Home</a></li>
                <li><a href="./shop-grid.html">Shop</a></li>
                <li><a href="#">Pages</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="./shop-details.html">Shop Details</a></li>
                        <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                        <li><a href="./checkout.html">Check Out</a></li>
                        <li><a href="./blog-details.html">Blog Details</a></li>
                    </ul>
                </li>
                <li><a href="./blog.html">Blog</a></li>
                <li><a href="./contact.html">Contact</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                <li>Free Shipping for all Order of $99</li>
            </ul>
        </div>
    </div>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <section class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    
                </div>
               
                    <img src="../resources/img/action/google.jpg">
                    <div class="col-lg-3" align="right">
                    <br><br>
                    <div class="header__top__right__auth">
                        <a href="#"><i class="fa fa-user"></i> Login | Join</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    

    <!-- Header Section End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                       
                    </div>
                    <div class="col-lg-6">
                        
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li><a href="./index.html">재난행동</a></li>
                            <li><a href="./shop-grid.html">대피소</a></li>
                            <li><a href="#">게시판</a> </li>
                            <li class="active"><a href="./blog.html">쇼핑몰</a></li>
                            <li><a href="./contact.html">재난현황</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                   
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->
    
    