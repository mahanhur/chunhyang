<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<script>
</script>


    <div class="container-fluid px-4">
        <p class="page_header_item"><strong>주문 관리 화면</strong></p>
<%--        <ol class="breadcrumb mb-4">--%>
<%--            <li class="breadcrumb-item"><a href="/">관직자 메인페이지로</a></li>--%>
<%--            <li class="breadcrumb-item active">#</li>--%>
<%--        </ol>--%>
        <div class="card mb-4">
            <div class="card-body">
                <p>ㅇ 주문 현황을 관리하는 화면입니다.</p>
                <p>ㅇ 주문번호를 클릭하시면 해당주문의 상세내역을 보실 수 있습니다.</p>
                <p>ㅇ 주문 정보 삭제는 <span style="font-weight: bold; color:red;">신중히</span> 처리해 주시기 바랍니다.</p>
            </div>
        </div>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                DataTable : item_order
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                    <tr>
                        <th>주문번호</th>
                        <th>아이디</th>
                        <th>주문상세</th>
                        <th>주문금액</th>
                        <th>사용포인트</th>
                        <th>결제금액</th>
                        <th>고객정보</th>
                        <th>주문일자</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="obj" items="${olist}">
                        <tr>
<%--                            id클릭시 해당 구독번호에 해당하는 '구독회차별상세' 테이블 조회화면 이동--%>
                            <td><a href="/order/detail?order_id=${obj.order_id}">${obj.order_id}</a></td>
                            <td>${obj.cust_id}</td>
                            <td>
                                <a href="/order/detail?order_id=${obj.order_id}" type="button"  class="btn btn-outline-dark">주문상세</a>
                            </td>
                            <td><fmt:formatNumber value="${obj.order_amount}" pattern="###,###원"/></td>
                            <td><fmt:formatNumber value="${obj.user_point}" pattern="###,###원"/></td>
                            <td><fmt:formatNumber value="${obj.pay_amount}" pattern="###,###원"/></td>
                            <td>${obj.order_name}<button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#custinfomodal${obj.cust_id}">정보상세</button></td>
                            <td><fmt:formatDate  value="${obj.order_date}" pattern="yyyy-MM-dd" /></td>

                        </tr>

                        <!-- Custinfo Modal -->
                        <div id="custinfomodal${obj.cust_id}" class="modal" role="dialog">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">주문고객 상세정보</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="card mb-4">
                                            <div class="card-body" style="color:blue;font-weight: bolder">[안내] 주문고객 정보변경은 고객메뉴를 이용하시기 바랍니다.</div>
                                        </div>
                                        <form id="custinfo_form">
                                            <div class="form-group">
                                                <label class="control-label col-sm-4">주문자 아이디:</label>
                                                <div>${obj.cust_id}</div>
                                            </div><br/>
                                            <div class="form-group">
                                                <label class="control-label col-sm-4">주문자 이름:</label>
                                                <div>${obj.order_name}</div>
                                            </div><br/>
                                            <div class="form-group">
                                                <label class="control-label col-sm-4">주문자 전화번호:</label>
                                                <div>${obj.order_phone}</div>
                                            </div><br/>
                                            <div class="form-group">
                                                <label class="control-label col-sm-4">주문자 주소:</label>
                                                <div>${obj.od_addr1}</div><br/>
                                                <div>${obj.od_addr2}</div>
                                            </div><br/>
                                            <div class="form-group">
                                                <label class="control-label col-sm-4">주문자 메모:</label>
                                                <div>${obj.ship_memo}</div><br/>
                                            </div><br/>
                                            <hr/>
                                            <div>
                                                <button type="button" id="modalclose_btn" class="btn btn-outline-secondary" data-dismiss="modal">닫기</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Custinfo Modal END-->
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </div>



