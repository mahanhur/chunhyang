<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let allcheck = {
        init: function () {
            $("#allcheck").click(function () {
                $(".del").prop("checked", true);
            });
        }
    }
    $(function (){
        allcheck.init();
    })
</script>

    <div class="container-fluid px-4"><br>
        <p class="page_header_board"><strong>이벤트</strong></p>
        <div class="card mb-4">
            <div class="card-body">
                <p>ㅇ 이벤트 상품 및 안내 사항들은 직원분들께서는 숙지해 바랍니다</p>
                <p>ㅇ 선택삭제 기능은 작동 안합니다</p>
                <hr/>
                <button type="button" class="btn btn-outline-primary" onclick="location.href='/board/addevent'">이벤트 등록</button>
                <button type="button" class="btn btn-outline-success" id="allcheck">일괄 선택</button>
                <button type="button" class="btn btn-outline-danger">선택 삭제</button>
            </div>
        </div>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                데이터테이블 : board
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                        <tr>
                            <th>글 번 호</th>
                            <th>이벤트 제목</th>
                            <th>작성자 사번</th>
                            <th>등록 일자</th>
                            <th>수정 일자</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="obj" items="${eventlist}">
                        <tr>
                            <td><input type="checkbox" class="del">
                                <a href ="/board/eventdetail?noti_id=${obj.noti_id}">${obj.noti_id}</a></td>
                            <td>${obj.noti_title}</td>
                            <td>${obj.admin_id}</td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${obj.noti_wdate}" /></td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${obj.noti_udate}" /></td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </div>