<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<%--<script>--%>
<%--    let item_search = {--%>
<%--        init: function () {--%>
<%--            $('#search_btn').click(function () {--%>
<%--                $('#search_form').attr({--%>
<%--                    method: 'get',--%>
<%--                    action: '/item/search'--%>
<%--                });--%>
<%--                $('#search_form').submit();--%>
<%--            });--%>
<%--        }--%>
<%--    };--%>
<%--    $(function () {--%>
<%--        item_search.init();--%>
<%--    })--%>
<%--</script>--%>

<style>
    .medium_img {
        width: 80px;
        height: 80px;
    }

    .main_img {
        width: 160px;
        height: 160px;
    }

     #datatablesSimple th {
         text-align: center; /* 내용 가운데 정렬 */
     }

    #datatablesSimple td {
        text-align: center; /* 내용 가운데 정렬 */
    }
</style>

<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">판매상품 관리 화면</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="/">관직자 메인페이지로</a></li>
            <li class="breadcrumb-item active">#</li>
        </ol>
        <div class="card mb-4">
            <div class="card-body">
                <p>ㅇ 판매 상품을 관리하실 수 있는 화면입니다.</p>
                <p>ㅇ 하단 버튼을 클릭하시어 상품을 추가/삭제/수정 하실 수 있습니다.</p>
                <p>ㅇ 상품상세정보 및 정보변경은 <b>상품코드</b>를 누르시면 확인하실 수 있습니다. </p><hr/>
                <button type="button" class="btn btn-outline-primary" onclick="location.href='/item/add'">판매상품 추가</button>
            </div>
        </div>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                DataTable : Item
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                    <tr>
                        <th style="width: 100px">상품이미지</th>
                        <th>상품코드</th>
                        <th>상품카테고리</th>
                        <th>상품명</th>
                        <th>상품가격</th>
                        <th>상품재고</th>
                        <th>상품정보</th>
                        <th>상품설명</th>
                        <th>삭제</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="obj" items="${flist}">
                        <tr>
                            <td style="width: 100px"><img class = "medium_img" src="/uimg/${obj.item_img}"/></td>
                            <td><br/><a href="/item/detail?item_id=${obj.item_id}">${obj.item_id}</a></td>
                            <td><br/>${obj.category_id}</td>
                            <td><br/>${obj.item_name}</td>
                            <td><br/><fmt:formatNumber value="${obj.item_price}" pattern="###,###원"/></td>
                            <td><br/>${obj.item_cnt}</td>
                            <td>색상: ${obj.flower_color}<br/>
                                종류: ${obj.flower_type}<br/>
                                사이즈: ${obj.flower_size}</td>
                            <td><br/>${obj.item_content}</td>
                            <td><br/><a href="/item/delitem?item_id=${obj.item_id}" class="btn btn-danger" role="button">삭제</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>


</main>