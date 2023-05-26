<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<script>
</script>

<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">구독 신청정보 관리 화면</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="/">관직자 메인페이지로</a></li>
            <li class="breadcrumb-item active">#</li>
        </ol>
        <div class="card mb-4">
            <div class="card-body">
                <p>ㅇ 구독 신청 현황을 관리하는 화면입니다.</p>
                <p>ㅇ 구독 신청 번호를 클릭하시면 해당 신청번호에 해당하는 회차별 상세내역을 보실 수 있습니다.</p>
                <p>ㅇ 구독 신청 정보 삭제는 <span style="font-weight: bold; color:red;">신중히</span> 처리해 주시기 바랍니다.</p>
            </div>
        </div>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                DataTable : Subscribe register list
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                    <tr>
                        <th>구독 신청 번호</th>
                        <th>신청자 아이디</th>
                        <th>구독 상품</th>
                        <th>신청 금액</th>
                        <th>사용 포인트</th>
                        <th>결제 금액</th>
                        <th>신청 일자</th>
                        <th>삭제</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="obj" items="${silist}">
                        <tr>
<%--                            id클릭시 해당 구독번호에 해당하는 '구독회차별상세' 테이블 조회화면 이동--%>
                            <td><a href="/subs/subsdetail?subs_id=${obj.subs_id}">${obj.subs_id}</a></td>
                            <td>${obj.cust_id}</td>
                            <td>${obj.subsitem_id}</td>
                            <td><fmt:formatNumber value="${obj.subs_amount}" pattern="###,###원"/></td>
                            <td><fmt:formatNumber value="${obj.minus_point}" pattern="###,###원"/></td>
                            <td><fmt:formatNumber value="${obj.subs_pay_amount}" pattern="###,###원"/></td>
                            <td><fmt:formatDate  value="${obj.subs_rdate}" pattern="yyyy-MM-dd" /></td>
                            <td>
                                <button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#subinfodelmodal">삭제</button>
                            </td>
                        </tr>

                        <!-- Delete Modal -->
                        <div id="subinfodelmodal" class="modal" role="dialog">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">구독 신청정보 삭제</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="card mb-4">
                                            <div class="card-body" style="color:red;font-weight: bolder">[주의] 반드시 정확히 확인 후 처리하십시오.</div>
                                        </div>
                                        <form id="del_form">
                                            <div class="form-group">
                                                <label class="control-label col-sm-4">구독 신청 번호:</label>
                                                <div>${obj.subs_id}</div>
                                                <input type="hidden" name="${obj.subs_id}" value="${obj.subs_id}">
                                            </div><br/>
                                            <div class="form-group">
                                                <label class="control-label col-sm-4">신청자 아이디:</label>
                                                <div>${obj.cust_id}</div>
                                            </div><br/>
                                            <div class="form-group">
                                                <label class="control-label col-sm-4">구독 상품:</label>
                                                <div>${obj.subsitem_id}</div>
                                            </div><br/>
                                            <div class="form-group">
                                                <label class="control-label col-sm-4">신청 일자:</label>
                                                <div>${obj.subs_rdate}</div>
                                            </div><br/><hr/>
                                            <div>
                                                <a href="/subs/subsinfodel?subs_id=${obj.subs_id}" class="btn btn-outline-danger" role="button">삭제</a>
                                                <button type="button" id="modalclose_btn" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Delete Modal END-->
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>




