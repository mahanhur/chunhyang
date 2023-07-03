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
<style>
    #datatablesSimple th {
        text-align: center; /* 내용 가운데 정렬 */
    }

    #datatablesSimple td {
        text-align: center; /* 내용 가운데 정렬 */
    }
</style>
<main>
    <div class="container-fluid px-4"><br>
        <p class="page_header_board"><strong>FAQ</strong></p>
        <div class="card mb-4">
            <div class="card-body">
                <p>ㅇ 고객 서비스의 FAQ화면에 작성된 FAQ가 표출됩니다.</p>
                <p>ㅇ FAQ 글번호를 클릭하시면 자세한 내용을 볼 수 있습니다.</p>
                <hr/>
                <button type="button" class="btn btn-outline-primary" onclick="location.href='/board/addfa'">F&A 등록</button>
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
                            <th>질  문</th>
                            <th>작성자 사번</th>
                            <th>등록 일자</th>
                            <th>수정 일자</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="obj" items="${falist}">
                        <tr>
                            <td><input type="checkbox" class="del">
                                <a href ="/board/fadetail?noti_id=${obj.noti_id}">${obj.noti_id}</a></td>
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
</main>