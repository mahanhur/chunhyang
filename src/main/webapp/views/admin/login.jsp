<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="shortcut icon" href="/img/logo/logo.png" type="image/x-icon" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>춘향 ADMIN</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

    <script src="/js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="/assets/demo/chart-area-demo.js"></script>
    <script src="/assets/demo/chart-bar-demo.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
    <script src="/js/datatables-simple-demo.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <%--calender--%>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.7/index.global.min.js"></script>

    <%-- font --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
    <%--    ------------------------------------------------------------------------------------------%>
    <style>
        * {
            font-family: 'Nanum Gothic', sans-serif;
        }
        .nav-link{
            padding: 0px;
        }
        .page_header_item{
            background: #F9F7F6;
            border-left: 0.5em solid #E6E6FA;
            padding: 0.5em;
            margin: 15px 0 5px 0;
            font-size: 1.5em;
            color: #4d5154;
        }
        .page_header_cust{
            background: #F9F7F6;
            border-left: 0.5em solid #CEF6E3;
            padding: 0.5em;
            margin: 15px 0 5px 0;
            font-size: 1.5em;
            color: #4d5154;
        }
        .page_header_board{
            background: #F9F7F6;
            border-left: 0.5em solid #EFBBBB;
            padding: 0.5em;
            margin: 15px 0 5px 0;
            font-size: 1.5em;
            color: #4d5154;
        }
    </style>

<script>
    <%-- 로그인 기능 --%>
    // login.jsp // 로그인 기능 자바스크립트
    let login_form = {
        init:function (){ // 화면에 이벤트 처리
            $('#login_btn').click(function (){
                login_form.send();
            });
        },
        send:function () {
            $('#login_form').attr({
                'action':'/admin/loginimpl', // maincontroller 로 보낸다.
                'method':'post'
            });
            $('#login_form').submit();
        }
    };
    // 로그인 기능(스크립트)를 상단에 기입했으므로, 스크립트 끝나기 전 아래 함수 적어줘야 함.
    $(function (){
        login_form.init();
    });
</script>

<main>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-4">
                <div class="card shadow-lg border-0 rounded-lg mt-5">
                    <div class="card-header"><h3 class="text-center font-weight-light my-4">로그인</h3></div>
                    <div class="card-body">
                        <div id="container">
                <form id="login_form" >

                    <div class="row mb-3">
                        <div class="col-md-12">
                            <div class="form-floating mb-3 mb-md-0">
                                <input class="form-control" id="admin_id" type="text" name="admin_id" placeholder="사번을 입력하세요" />
                                <label for="admin_id">사원번호</label>
                            </div>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-12">
                            <div class="form-floating mb-3 mb-md-0">
                                <input class="form-control" id="admin_pwd" type="password" name="admin_pwd" placeholder="비밀번호를 입력하세요" />
                                <label for="admin_pwd">비밀번호</label>
                            </div>
                        </div>
                    </div>

                    <div class="mt-1 mb-1">
                        <div class="d-grid">
                            <button type="button" class="btn btn-primary btn-block" id="login_btn">로그인</button>
                        </div>
                    </div>
                    <div class="mt-1 mb-1">
                        <div class="d-grid">
                            <a href="/facelogin" type="button" class="btn btn-success btn-block" id="face_btn">얼굴로 로그인</a>
                        </div>
                    </div>
                    <div class="mt-1 mb-1">
                        <div class="d-grid">
                            <a href="/admin/register" type="button" class="btn btn-secondary btn-block">직원 등록</a>
                        </div>
                    </div>
                </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>