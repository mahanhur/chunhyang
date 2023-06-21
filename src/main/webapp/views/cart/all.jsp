<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<script>
</script>


    <div class="container-fluid px-4">
        <p class="page_header_item"><strong>장바구니 관리 화면</strong></p>
        <div class="card mb-4">
            <div class="card-body">
                <p>ㅇ 장바구니 현황을 관리하는 화면입니다.</p>
                <p>ㅇ 주문번호를 클릭하시면 해당주문의 상세내역을 보실 수 있습니다.</p>
                <p>ㅇ 주문 정보 삭제는 <span style="font-weight: bold; color:red;">신중히</span> 처리해 주시기 바랍니다.</p>
            </div>
        </div>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                DataTable : cart
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                    <tr>
                        <th>고객 아이디</th>
                        <th>장바구니 번호</th>
                        <th>상품코드</th>
                        <th>상품명</th>
                        <th>상품가격</th>
                        <th>상품수량</th>
                        <th>등록일자</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="obj" items="${clist}">
                        <tr>
                            <td>${obj.cust_id}</td>
                            <td>${obj.cart_id}</td>
                            <td>${obj.item_id}</td>
                            <td>${obj.item_name}</td>
                            <td><fmt:formatNumber value="${obj.item_price}" pattern="###,###원"/></td>
                            <td>${obj.cnt}</td>
                            <td><fmt:formatDate  value="${obj.item_rdate}" pattern="yyyy-MM-dd" /></td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </div>



