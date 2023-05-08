<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.iainfo.tprojo.model.Article" %>
<%--
  Created by IntelliJ IDEA.
  User: LoicRaveloarimanana
  Date: 06/05/2023
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Article article = (Article) request.getAttribute("data");
  Integer num = (Integer) request.getAttribute("curr_page");

%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>IA content &mdash;<%=article.getTitre()%> </title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" title="<%=article.getTitre()%>">

  <link href="https://fonts.googleapis.com/css?family=B612+Mono|Cabin:400,700&display=swap" rel="stylesheet">

  <link rel="stylesheet" href="<c:url value="/resources/theme/fonts/icomoon/style.css" />" >


  <link rel="stylesheet" href="<c:url value="/resources/theme/css/bootstrap.min.css"/>" type="text/css">
  <link rel="stylesheet" href="<c:url value="/resources/theme/css/jquery-ui.css"/>" type="text/css">
  <link rel="stylesheet" href="<c:url value="/resources/theme/css/owl.carousel.min.css"/>" type="text/css">
  <link rel="stylesheet" href="<c:url value="/resources/theme/css/owl.theme.default.min.css"/>" type="text/css">
  <link rel="stylesheet" href="<c:url value="/resources/theme/css/jquery.fancybox.min.css"/>" type="text/css">

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

  <div class="site-section">
    <div class="container">
      <div class="row">
        <div class="col-12 text-left">
          <div class="section-title mb-5">
            <h2><%=article.getTitre()%></h2>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-6">
          <p>
            <img src="<%=article.getPhoto()%>" alt="Image" class="img-fluid">
          </p>
        </div>
        <div class="col-lg-6 pl-md-5">
          <%=article.getDescri()%>
        </div>
      </div>
      <div class="row">
        <div class="col-12 text-left">
          <div class="section-title mb-5">
            <% if((request.getParameter("cat_id")==null)&&(request.getParameter("cat_name")==null)) { %>
              <h4><a href="<%=request.getContextPath()%>/allContents-<%=num%>-inteligenceArtifial_actu.html">retour</a></h4>
            <% } else { %>
            <h4><a href="<%=request.getContextPath()%>/allContents-categories_<%=request.getParameter("cat_name")%>-<%=request.getParameter("cat_id")%>_pages_<%=num%>_actu.html">retour</a></h4>
            <% } %>
          </div>
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

</div>
</body>

</html>
