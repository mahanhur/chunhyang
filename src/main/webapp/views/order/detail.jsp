<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>

</script>
<style>
    .medium_img {
        width: 80px;
        height: 80px;
    }

    .main_img {
        width: 160px;
        height: 160px;
    }
</style>
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">주문상세 화면</h1>

    <!-- 결제정보 -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">결제정보</h6>
            <i class="fas fa-table me-1"></i>
            DataTable : Payment
        </div>
        <div class="card-body">
            <div class="container">
                <form id="pay_form" class="form-group well" style="width: 500px;">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="pay_id">결제번호:</label>
                        <div class="col-sm-10">
                            <input type="text" name="pay_id" class="form-control" id="pay_id" value="${payment.pay_id}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="order_id">주문번호:</label>
                        <div class="col-sm-10">
                            <input type="text" name="order_id" class="form-control" id="order_id" value="${payment.order_id}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="pay_opt">결제수단:</label>
                        <select class="form-select" width="900px" id="pay_opt" name="pay_opt" value="${payment.pay_opt}">
                            <option value="1">카드</option>
                            <option value="2">페이</option>
                            <option value="3">무통장입금</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="pay_state">결제상태:</label>
                        <select class="form-select" width="900px" id="pay_state" name="pay_state" value="${payment.pay_state}">
                            <option value="1">결제완료</option>
                            <option value="2">미결제</option>
                            <option value="3">환불</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="pay_amount">결제금액:</label>
                        <div class="col-sm-10">
                            <input type="text" name="pay_amount" class="form-control" id="pay_amount" value="${order.pay_amount}">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
        <!-- 결제정보 End -->

                <!-- 주문상품정보 -->
                <div class="card mb-4">
                    <div class="card-header">
                        <h6 class="m-0 font-weight-bold text-primary">주문상품상세</h6>
                        <i class="fas fa-table me-1"></i>
                        DataTable : Orderdetail
                    </div>
                    <div class="card-body">
                        <table id="datatablesSimple">
                            <thead>
                            <tr>
                                <th>주문상세번호</th>
                                <th>상품이미지</th>
                                <th>상품코드</th>
                                <th>상품명</th>
                                <th>상품가격</th>
                                <th>상품개수</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="obj" items="${olist}">
                                <tr>
                                    <td>${obj.orderdetail_id}</td>
                                    <td><img class ="main_img" src="/uimg/${obj.item_img}"/></td>
                                    <td><a href="/item/detail?item_id=${obj.item_id}">${obj.item_id}</a></td>
                                    <td>${obj.item_name}</td>
                                    <td><fmt:formatNumber value="${obj.item_price}" pattern="###,###원"/></td>
                                    <td>${obj.order_cnt}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
<%--                <div class="card shadow mb-4">--%>
<%--                    <div class="card-header py-3">--%>
<%--                        <h6 class="m-0 font-weight-bold text-primary">주문상품정보</h6>--%>
<%--                    </div>--%>
<%--                    <div class="card-body">--%>
<%--                        <div id="container">--%>
<%--                            <form id="item_form" class="form-group well" style="width: 500px;">--%>
<%--                                <div class="form-group">--%>
<%--                                    <label class="control-label col-sm-2" for="orderdetail_id">주문상세번호:</label>--%>
<%--                                    <div class="col-sm-10">--%>
<%--                                        <input type="text" name="orderdetail_id" class="form-control" id="orderdetail_id" value="${order.orderdetail_id}">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="form-group">--%>
<%--                                    <label class="control-label col-sm-2" for="item_id">상품번호:</label>--%>
<%--                                    <div class="col-sm-10">--%>
<%--                                        <input type="text" name="item_id" class="form-control" id="item_id" value="${order.item_id}">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="form-group">--%>
<%--                                    <label class="control-label col-sm-2" for="item_img">상품이미지:</label>--%>
<%--                                    <div class="col-sm-10">--%>
<%--                                        <input type="text" name="item_img" class="form-control" id="item_img" value="${item.item_img}">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="form-group">--%>
<%--                                    <label class="control-label col-sm-2" for="item_name">상품명:</label>--%>
<%--                                    <div class="col-sm-10">--%>
<%--                                        <input type="text" name="item_img" class="form-control" id="item_name" value="${item.item_name}">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="form-group">--%>
<%--                                    <label class="control-label col-sm-2" for="cnt">상품개수:</label>--%>
<%--                                    <div class="col-sm-10">--%>
<%--                                        <input type="text" name="cnt" class="form-control" id="cnt" value="${order.cnt}">--%>
<%--                                    </div>--%>
<%--                                </div>--%>

<%--                            </form>--%>
                            <!-- 주문상품정보 End -->


<%--                    <div class="form-group">--%>
<%--                        <div class="col-sm-offset-2 col-sm-10">--%>
<%--                            <button id="add_btn" type="button" class="btn btn-info">상품 정보 변경</button>--%>
<%--                        </div>--%>
<%--                    </div>--%>



            </div>

