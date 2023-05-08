<%@ page import="com.iainfo.tprojo.model.Article" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.iainfo.tprojo.model.Categorie" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LoicRaveloarimanana
  Date: 06/05/2023
  Time: 09:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HashMap map = (HashMap) request.getAttribute("data");
    List<Article> articleList = (List<Article>) map.get("data");
    int pagesCount = (int) map.get("pages");
    List<Categorie> categories = (List<Categorie>) request.getAttribute("categories");

%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>IA content&mdash; all actu of intelligence artificial </title>
    <meta charset="utf-8">
    <meta name="descrption" content ="actus">

    <link href="https://fonts.googleapis.com/css?family=B612+Mono|Cabin:400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="<c:url value="/resources/theme/fonts/icomoon/style.css" />" >


    <link rel="stylesheet" href="<c:url value="/resources/theme/css/bootstrap.min.css"/>" >
    <link rel="stylesheet" href="<c:url value="/resources/theme/css/jquery-ui.css"/>" >
    <link rel="stylesheet" href="<c:url value="/resources/theme/css/owl.carousel.min.css"/>" >
    <link rel="stylesheet" href="<c:url value="/resources/theme/css/owl.theme.default.min.css"/>" >
    <link rel="stylesheet" href="<c:url value="/resources/theme/css/jquery.fancybox.min.css"/>" >

    <link rel="stylesheet" href="<c:url value="/resources/theme/css/style.css"/>">



</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

<div class="site-wrap">

    <div class="header-top">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-12 col-lg-6 d-flex">
                    <p class="site-logo">
                        IA_actus
                    </p>
                </div>
            </div>
        </div>

        <div class="site-navbar py-2 js-sticky-header site-navbar-target d-none pl-0 d-lg-block" role="banner">

            <div class="container">
                <div class="d-flex align-items-center">

                    <div class="mr-auto">
                        <nav class="site-navigation position-relative text-right" role="navigation">
                            <ul class="site-menu main-menu js-clone-nav mr-auto d-none pl-0 d-lg-block">
                                <li >
                                    <a href="<%=request.getContextPath()%>/allContents-1-inteligenceArtifial_actu.html" class="nav-link text-left">Home</a>
                                </li>
                                <% for(Categorie categorie : categories) { %>
                                <li class="active">
                                    <a href="<%=request.getContextPath()%>/allContents-categories_<%=categorie.getNomCategorie()%>-<%=categorie.getId()%>_pages_1_actu.html" class="nav-link text-left"><%=categorie.getNomCategorie()%></a>
                                </li>
                                <% } %>

                            </ul>
                        </nav>

                    </div>

                </div>
            </div>

        </div>

    </div>



    <div class="site-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-9">

                    <div class="section-title">
                        <span class="caption d-block small">Categories</span>
                        <h2><%=request.getAttribute("filtre")%></h2>
                    </div>
                    <% for (Article ar : articleList) { %>
                    <div class="post-entry-2 d-flex">
                        <div class="thumbnail" ><img src="<%=ar.getPhoto()%>" width="120" height="100" alt="<%=ar.getTitre()%>"></div>
                        <div class="contents">
                            <% if((request.getParameter("cat_id") == null)&&(request.getParameter("cat_name")==null)){ %>
                                <h2><a href="<%=request.getContextPath()%>/articles/view-<%=ar.getUrl()%>-<%=ar.getId()%>_pages_<%=request.getParameter("num")%>_h=true"><%=ar.getTitre()%></a></h2>
                            <% } else { %>
                            <h2><a href="<%=request.getContextPath()%>/articles/view-<%=ar.getUrl()%>-<%=ar.getId()%>_pages_<%=request.getParameter("num")%>_cat_<%=ar.getCategorie().getId()%>_cat_n_<%=ar.getCategorie().getNomCategorie()%>"><%=ar.getTitre()%></a></h2>
                            <% } %>
                            <div class="post-meta">
                                <span class="d-block">creer par : <%=ar.getAdmin().getUserName()%> types : <%=ar.getCategorie().getNomCategorie()%></a></span>
                                <span class="date-read"><%=ar.getDateAjout()%><span class="mx-1">&bullet;</span><span class="icon-star2"></span></span>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-6">
                    <ul class="custom-pagination list-unstyled">

                        <% for(int i = 1 ; i<=pagesCount ; i++ ) { %>
                            <% if((request.getParameter("cat_id") == null)&&(request.getParameter("cat_name")==null)){ %>
                                <% if(Integer.parseInt(request.getParameter("num")) ==i) { %>
                                <li class="active"><a href="<%=request.getContextPath()%>/allContents-<%=i%>-inteligenceArtifial_actu.html"><%=i%></a></li>
                                <% } else { %>
                                <li><a href="<%=request.getContextPath()%>/allContents-<%=i%>-inteligenceArtifial_actu.html"><%=i%></a></li>
                                <% } %>
                            <% } else { %>
                                <% if(Integer.parseInt(request.getParameter("num")) ==i) { %>
                                <li class="active"><a href="<%=request.getContextPath()%>/allContents-categories-<%=request.getParameter("cat_id")%>_pages_<%=i%>_actu.html"><%=i%></a></li>
                                <% } else { %>
                                <li><a href="<%=request.getContextPath()%>/allContents-categories_<%=request.getParameter("cat_name")%>-<%=request.getParameter("cat_id")%>_pages_<%=i%>_actu.html"><%=i%></a></li>
                                <% } %>
                            <% } %>
                        <% } %>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="site-section subscribe bg-light">
        <div class="container">

            <div class="col-md-5 mr-auto">
                <h2>a propos de nous</h2>
                <p>IA_cotents , une site qui vous tient au courant des actualite sur les intelligence artificiele!</p>
            </div>


        </div>
    </div>



    <div class="footer">
        <div class="container">


            <div class="row">
                <div class="col-12">
                    <div class="copyright">
                        <p>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart text-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>


</div>
<!-- .site-wrap -->


<!-- loader -->
<div id="loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#ff5e15"/></svg></div>

<script src="<c:url value="/resources/theme/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/resources/theme/js/jquery-migrate-3.0.1.min.js"/>"></script>
<script src="<c:url value="/resources/theme/js/jquery-ui.js"/>"></script>
<script src="<c:url value="/resources/theme/js/popper.min.js"/>"></script>
<script src="<c:url value="/resources/theme/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/theme/js/owl.carousel.min.js"/>"></script>
<script src="<c:url value="/resources/theme/js/jquery.stellar.min.js" />"></script>
<script src="<c:url value="/resources/theme/js/jquery.countdown.min.js" />"></script>
<script src="<c:url value="/resources/theme/js/bootstrap-datepicker.min.js" />"></script>
<script src="<c:url value="/resources/theme/js/jquery.easing.1.3.js"/>"></script>
<script src="<c:url value="/resources/theme/js/aos.js"/>"></script>
<script src="<c:url value="/resources/theme/js/jquery.fancybox.min.js" />"></script>
<script src="<c:url value="/resources/theme/js/jquery.sticky.js"/>"></script>
<script src="<c:url value="/resources/theme/js/jquery.mb.YTPlayer.min.js"/>"></script>
<script src="<c:url value="/resources/theme/js/main.js"/>"></script>

</body>

</html>



