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
<%--    highcharts--%>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/series-label.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>
    <script src="https://code.highcharts.com/highcharts-3d.js"></script>
    <script src="https://code.highcharts.com/modules/bullet.js"></script>
    <script src="https://code.highcharts.com/modules/data.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
    <script src="/js/datatables-simple-demo.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <%--calender--%>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.7/index.global.min.js"></script>

    <%--datepicker--%>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
    <%--websocket--%>
    <script src="/webjars/sockjs-client/sockjs.min.js"></script>
    <script src="/webjars/stomp-websocket/stomp.min.js"></script>
    <%-- font --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
    ----------------------------------------------------------------------------------------
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

</head>
<body class="sb-nav-fixed">
<nav class="sb-topnav navbar navbar-expand navbar-light" style="background-color: #E6E6FA; height: 60px;">
    <!-- Navbar Brand-->
    <a class="navbar-brand" href="/"><img src="/uimg/logo1_admin.png" width="160px"></a>
    <!-- Sidebar Toggle-->
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
    <!-- Navbar Search-->
    <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
        <div class="input-group"></div>
    </form>
    <!-- Navbar-->
    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <c:choose>
                    <c:when test="${loginadmin == null}">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown1" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fas fa-user fa-fw"></i></a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown1">
                                <li><a class="dropdown-item" href="/admin/login">로그인</a></li>
                                <li><a class="dropdown-item" href="/admin/register">관리자등록</a></li>
                            </ul>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <h6><div style="color: white">${loginadmin.admin_name}</div></h6>
                        <a class="nav-link" id="messagebtn" href="#messagemodal" role="button" data-bs-toggle="modal">
                            <i class="fas fa-message fa-fw"></i></a>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown2" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fas fa-user fa-fw"></i></a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown2">
                        <li><a class="dropdown-item" href="/admin/admindetail?admin_id=${loginadmin.admin_id}"><i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                내 정보수정</a></li>
                        <div class="dropdown-divider"></div>
                        <li><a class="dropdown-item" href="/admin/logoutimpl" data-toggle="modal" data-target="#logoutModal">
                            <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>로그아웃</a></li>
                            </ul>
                        </li>
                    </c:otherwise>
                </c:choose>
    </ul>
</nav>
<div id="layoutSidenav">
    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-light" id="sidenavAccordion" style="background-color: #f8f8ff">
            <div class="sb-sidenav-menu">
                <div class="nav">
                    <c:if test="${loginadmin.admin_level == 1}">
                    <div class="sb-sidenav-menu-heading">직원관리메뉴</div>
                    <a class="nav-link collapsed" href="/admin"><div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>직원 관리</a>
                    </c:if>
                    <div class="sb-sidenav-menu-heading"><i class="fas fa-user" style="color:#6a5acd"></i> 고객관리메뉴</div>
                    <a class="nav-link collapsed" href="/cust"><div class="sb-nav-link-icon"></div> 회원 관리</a>
                    <a class="nav-link" href="/qna/qna"><div class="sb-nav-link-icon"></div> QnA</a>
                    <a class="nav-link" href="/callcenter"><div class="sb-nav-link-icon"></div> 1:1 채팅</a>

                    <div class="sb-sidenav-menu-heading"><i class="fas fa-box"></i> 상품관리메뉴</div>
                        <%--구독 시작--%>
                        <a class="nav-link collapsed"data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth1" aria-expanded="false" aria-controls="pagesCollapseAuth">
                            <div class="sb-nav-link-icon"></div>
                             구독상품관리
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="pagesCollapseAuth1" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="/subs/subsitem"> 구독상품 관리</a>
                                <a class="nav-link" href="/subs/subsinfo"> 구독 신청정보 관리</a>
                                <a class="nav-link" href="/subs/subsdetail"> 구독상품 상세관리</a>
                            </nav>
                        </div>
                        <%--구독 끝--%>
                    <%--상품관리 시작--%>
                    <a class="nav-link collapsed"data-bs-toggle="collapse" data-bs-target="#itemsCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                        <div class="sb-nav-link-icon"></div>
                         일반상품관리
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="itemsCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link collapsed" href="/item/all"><div class="sb-nav-link-icon"></div> 상품 관리</a>
                            <a class="nav-link collapsed" href="/order/all"><div class="sb-nav-link-icon"></div> 주문 관리</a>
                            <a class="nav-link collapsed" href="/item"><div class="sb-nav-link-icon"></div> 장바구니 관리</a>
                        </nav>
                    </div>
                    <%--상품관리 끝--%>
                    <a class="nav-link collapsed" href="/delivery"><div class="sb-nav-link-icon"></div> 배송정보관리</a>

                    <div class="sb-sidenav-menu-heading"><i class="fas fa-clipboard-list"></i> 게시판관리메뉴</div>
                    <%--게시판 시작--%>
                        <a class="nav-link collapsed" href="/board/notice"><div class="sb-nav-link-icon"></div> 공지사항</a>
                        <a class="nav-link collapsed" href="/board/fa"><div class="sb-nav-link-icon"></div> FAQ</a>
                        <a class="nav-link collapsed" href="/board/event"><div class="sb-nav-link-icon"></div> 이벤트</a>
                    <%--게시판 끝--%>

                    <div class="sb-sidenav-menu-heading"><i class="fas fa-chart-area"></i> 분석 및 통계</div>
                    <a class="nav-link" href="/chart/livechart"><div class="sb-nav-link-icon"></div>  실시간통계차트</a>
                    <a class="nav-link" href="/chart/chart"><div class="sb-nav-link-icon"></div> 매출분석</a>

                </div>
            </div>
            <c:choose>
                <c:when test="${loginadmin != null}">
            <div class="sb-sidenav-footer">
                <div class="small">Logged in as:</div>
                ${loginadmin.admin_id}
            </div>
                </c:when>
                <c:otherwise>
            <div class="sb-sidenav-footer">
            </div>
                </c:otherwise>
            </c:choose>
        </nav>
    </div>
    <div id="layoutSidenav_content">
        <main>
            <c:choose>
                <c:when test="${center == null}">
                    <jsp:include page="center.jsp"/>
                </c:when>
                <c:otherwise>
                    <jsp:include page="${center}.jsp"/>
                </c:otherwise>
            </c:choose>
        </main>
        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Copyright &copy; Your Website 2023</div>
                    <div>
                        <a href="#">Privacy Policy</a>
                        <a href="#">Terms &amp; Conditions</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="/admin/logoutimpl">Logout</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>

<!-- message receive Modal -->
<div id="messagemodal" class="modal" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">메시지함</h4>
            </div>
            <div class="modal-body">
                <div class="card mb-4">
                    <div class="card-body" style="color:red;font-weight: bolder">메시지함입니당</div>
                </div>
                <div id="tableset">
                <table id="datatablesSimple">
<%--                    <thead>--%>
<%--                    <tr>--%>
<%--                        <th>보낸이</th>--%>
<%--                        <th>내용</th>--%>
<%--                        <th>보낸시간</th>--%>
<%--                    </tr>--%>
<%--                    </thead>--%>
<%--                    <tbody>--%>
<%--                    <c:forEach var="obj" items="${mrlist}" varStatus="status">--%>
<%--                        <tr>--%>
<%--                            <td>${obj.m_sender}</td>--%>
<%--                            <td>${obj.m_content}</td>--%>
<%--                            <td><fmt:formatDate  value="${obj.m_rdate}" pattern="yyyy-MM-dd HH:MM" /></td>--%>
<%--                        </tr>--%>
<%--                    </c:forEach>--%>
<%--                    </tbody>--%>
                </table>
                </div>
                <a href="#sendmodal" role="button" data-bs-toggle="modal" class="btn btn-outline-primary">보내기</a>

            </div>
        </div>
    </div>
</div>
<!-- message Modal END-->


<script>
    let index = {
        init:function() {
            $('#messagebtn').click( function() {
                $.ajax({
                    url:'/message',
                    dataType: 'json',
                    type:'get',
                    success: function(data) {
                        alert("success");
                        alert(data);
                        //     let html = "<table id='datatablesSimple'>";
                        //     html += "<thead>";
                        //     html += "<tr>";
                        //     html += "<th>보낸이</th>";
                        //     html += "<th>내용</th>";
                        //     html += "<th>보낸시간</th>";
                        //     html += "</tr>";
                        //     html += "</thead>";
                        //     html += "<tbody>";
                        // let parsedData = JSON.parse(data);
                        // for (let i = 0; i < parsedData.length; i++) {
                        //     let message = data[i];
                        //     html += "<tr>";
                        //     html += "<td>";
                        //     html += message.m_sender;
                        //     html += "</td>";
                        //     html += "<td>";
                        //     html += message.m_content;
                        //     html += "</td>";
                        //     html += "<td>";
                        //     html += message.m_rdate;
                        //     html += "</td>";
                        //     html += "</tr>";
                        // }
                        // html += "</tbody>";
                        // html += "</table>";
                        // $('#tableset').html(html);
                    },
                    error: function() {
                        alert("success");
                        console.log('--------------------------------message ajax 오류입니다');
                    }
                });

            })
        }
    };

    $(function () {
        index.init();
    })
</script>

<!-- message send Modal -->
<div id="sendmodal" class="modal" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">메시지함</h4>
            </div>
            <div class="modal-body">
                <div class="card mb-4">
                    <div class="card-body" style="color:red;font-weight: bolder">메시지함입니당</div>
                </div>
                <form id="message_form" action="/messagesend" method="post">
                    <div class="form-group">
                        <label class="control-label col-sm-4">수령인 :</label>
                        <input name="m_receiver"/>
                    </div><br/>
                    <div class="form-group">
                        <label class="control-label col-sm-4">내용 :</label>
                        <input name="m_content"/>
                    </div><br/>
                    <button class="btn btn-outline-primary" type="submit">보내기</button>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- send Modal END-->