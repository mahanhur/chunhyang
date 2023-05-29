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

    .detail_img {
        width: 400px;
        height: 300px;
    }
</style>

<main>
    <div class="container-fluid">

    <div class="container-fluid px-4">
        <h1 class="mt-4">판매상품 관리 화면</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="/">관직자 메인페이지로</a></li>
            <li class="breadcrumb-item active">#</li>
        </ol>
        <div class="card mb-4">
            <div class="card-body">
                <button type="button" class="btn btn-outline-primary" onclick="location.href='/item/add'">판매상품 추가</button>
                <span> 상품상세정보 및 정보변경은 <b>상품코드</b>를 누르시면 확인하실 수 있습니다. </span>
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
                        <th>상품이미지</th>
                        <th>상품코드</th>
                        <th>상품카테고리</th>
                        <th>상품명</th>
                        <th>상품가격</th>
                        <th>상품재고</th>
                        <th>삭제</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="obj" items="${flist}">
                        <tr>
                            <td><img src="${obj.item_img}">${obj.item_img}</td>
                            <td><a href="/item/detail?item_id=${obj.item_id}">${obj.item_main_id}</a></td>
                            <td>${obj.category_id}</td>
                            <td>${obj.item_name}</td>
                            <td><fmt:formatNumber value="${obj.item_price}" pattern="###,###원"/></td>
                            <td>${obj.item_cnt}</td>
                            <td><a href="/item/delitem?item_id=${obj.item_id}" class="btn btn-danger" role="button">삭제</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>


<%--                            <!-- Modal -->--%>
<%--                            <div id="target${obj.id}" class="modal fade" role="dialog">--%>
<%--                                <div class="modal-dialog">--%>

<%--                                    <!-- Modal content-->--%>
<%--                                    <div class="modal-content">--%>
<%--                                        <div class="modal-header">--%>
<%--                                            <h4 class="modal-title">Detail Image</h4>--%>
<%--                                        </div>--%>
<%--                                        <div class="modal-body">--%>
<%--                                            <p>${obj.name}</p>--%>
<%--                                            <img src="/uimg/${obj.imgname}" class="detail_img">--%>
<%--                                        </div>--%>
<%--                                        <div class="modal-footer">--%>
<%--                                            <a href="/item/detail?id=${obj.id}" class="btn btn-primary"--%>
<%--                                               role="button">Detail</a>--%>
<%--                                            <a href="#" class="btn btn-default" role="button" data-dismiss="modal">Close</a>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>

<%--                                </div>--%>
<%--                            </div>--%>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
</main>