<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
    <div class="container-fluid px-4"><br>
        <p class="page_header_item"><strong>판매상품 관리 화면</strong></p>
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
                    <colgroup>
                        <col width="10%"/>
                        <col width="3%"/>
                        <col width="7%"/>
                        <col width="20%"/>
                        <col width="10%"/>
                        <col width="10%"/>
                        <col width="10%"/>
                        <col width="15%"/>
                        <col width="10%"/>
                    </colgroup>
                    <thead>
                    <tr>
                        <th>이미지</th>
                        <th>상품코드</th>
                        <th>카테고리</th>
                        <th>상품명</th>
                        <th>가격</th>
                        <th>재고</th>
                        <th>정보</th>
                        <th>상품설명</th>
                        <th></th>
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
                            <td><br/>${obj.item_cnt}개</td>
                            <td>색상: ${obj.flower_color}
                                <br/>종류: ${obj.flower_type}
                                <br/>사이즈: ${obj.flower_size}
                            </td>
                            <td><br/>${obj.item_content}</td>
                            <td><br/><a href="/item/delitem?item_id=${obj.item_id}" class="btn btn-danger btn-sm" role="button">X</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>