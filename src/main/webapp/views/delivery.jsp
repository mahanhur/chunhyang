<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>
    let del_id;
    let del_state;
    let del_com;
    let invoice_id;
    let del_startdate;
    let del_findate;
    let delivery = {
        init: () => {
            $('.delupdate_btn').click(function () {
                let row = $(this).closest('.form-group');
                del_id = row.find('.del_id').val();
                del_state = row.find('.del_state').val();
                del_com = row.find('.del_com').val();
                invoice_id = row.find('.invoice_id').val();
                del_startdate = row.find('.del_startdate').val();
                del_findate = row.find('.del_findate').val();

                    $.ajax({
                        url:'delupdateimpl',
                        method:'post',
                        data: {
                            del_id:del_id,
                            del_state:del_state,
                            del_com:del_com,
                            invoice_id:invoice_id,
                            del_startdate:del_startdate,
                            del_findate:del_findate
                        },
                        success: function() {
                            window.location.href = '/delivery'
                        },
                        error : function() {

                        }
                    });
            })
        }
    }

    $(function () {
        delivery.init();
        $('.datePicker').datepicker( ()=> {
            format: 'yyyy-MM-dd'
        });
    });

</script>

<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">배송정보 화면</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="/">관직자 메인페이지로</a></li>
            <li class="breadcrumb-item active">#</li>
        </ol>
        <div class="card mb-4">
            <div class="card-body">
                <button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#subsitemaddmodal">구독상품 추가</button>
                <button type="button" class="btn btn-outline-danger">구독상품 삭제</button>
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
                        <th>배송번호</th>
                        <th>구독세부번호/주문번호</th>
                        <th>배송 상태</th>
                        <th>담당 배송사</th>
                        <th>운송장번호</th>
                        <th>배송시작일</th>
                        <th>배송완료일</th>
                        <th>업데이트</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="obj" items="${dlist}" varStatus="status">
                        <tr>
                            <td>${obj.del_id}</td>
                            <td>
                                <c:choose>
                                    <c:when test = "${obj.subsdetail_id == 0}">
                                        ${obj.order_id}
                                    </c:when>
                                    <c:otherwise>
                                        ${obj.subsdetail_id}
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${obj.del_state}</td>
                            <td>${obj.del_com}</td>
                            <td>${obj.invoice_id}</td>
                            <td><fmt:formatDate  value="${obj.del_startdate}" pattern="yyyy-MM-dd" /></td>
                            <td><fmt:formatDate  value="${obj.del_findate}" pattern="yyyy-MM-dd" /></td>
                            <td><button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#delupdatemodal${status.index}">업데이트</button></td>
                        </tr>

                        <!-- update Modal -->
                        <div id="delupdatemodal${status.index}" class="modal delupdatemodal" role="dialog">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">배송 정보 수정</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="card mb-4">
                                            <div class="card-body" style="color:red;font-weight: bolder">[주의] 반드시 정확히 확인 후 처리하십시오.</div>
                                        </div>
                                        <form id="delivery_form">
                                            <div class="form-group">
                                                <label class="control-label col-sm-6">배송 번호:</label>
                                                <div>${obj.del_id}</div>
                                            </div><br/>
                                            <div class="form-group">
                                                <label class="control-label col-sm-6">구독세부번호/주문번호 :</label>
                                                <div>
                                                    <c:choose>
                                                        <c:when test = "${obj.subsdetail_id == 0}">
                                                            ${obj.order_id}
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${obj.subsdetail_id}
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div><hr/>
                                            <div class="form-group">
                                                <input type="hidden" class="del_id" value="${obj.del_id}" name="del_id">
                                                <label class="control-label col-sm-4">배송 상태</label>
                                                <input type="text" class="form-control del_state" name="del_state" value="${obj.del_state}" >
                                                <br/>
                                                <label class="control-label col-sm-4">담당 배송사</label>
                                                <input type="text" class="form-control del_com" name="del_com" value="${obj.del_com}" >
                                                <br/>
                                                <label class="control-label col-sm-4">운송장 번호</label>
                                                <input type="text" class="form-control invoice_id" name="invoice_id" value="${obj.invoice_id}" >
                                                <br/>
                                                <label class="control-label col-sm-4">배송 시작일</label>
                                                <input type="text" class="datePicker form-control del_startdate" name="del_startdate" value="<fmt:formatDate  value="${obj.del_startdate}" pattern="yyyy-MM-dd" />" >
                                                <br/>
                                                <label class="control-label col-sm-4">배송 완료일</label>
                                                <input type="text" class="datePicker form-control del_findate" name="del_findate" value="<fmt:formatDate  value="${obj.del_findate}" pattern="yyyy-MM-dd" />" >
                                                <br/>
                                                <button type="button" class="btn btn-outline-primary delupdate_btn">업데이트</button>
                                                <button type="button" id="modalclose_btn" class="btn btn-outline-primary" data-dismiss="modal">취소</button>
                                            </div>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- update Modal END-->

                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>




