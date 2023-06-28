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

                if(del_startdate != null && del_startdate.substr(4,1) == '-') {
                    let sparts = del_startdate.split('-'); // '-'를 기준으로 문자열을 나눔
                    del_startdate = sparts[1] + '/' + sparts[2] + '/' + sparts[0]; // datepicker형식으로 재조합
                }
                if(del_findate != null && del_findate.substr(4,1) == '-') {
                    let fparts = del_findate.split('-'); // '-'를 기준으로 문자열을 나눔
                    del_findate = fparts[1] + '/' + fparts[2] + '/' + fparts[0]; // datepicker 형식으로 재조합
                }

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
        <p class="page_header_item"><strong>배송정보 화면</strong></p>
        <div class="card mb-4">
            <div class="card-body">
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
                                                <select class="form-select del_state" name="del_state">
                                                    <option id="opt1" vlaue="">배송상태를 선택하세요</option>
                                                    <option value="배송대기" ${obj.del_state == '배송대기' ? 'selected' : ''}>배송대기</option>
                                                    <option value="배송중" ${obj.del_state == '배송중' ? 'selected' : ''}>배송중</option>
                                                    <option value="배송완료" ${obj.del_state == '배송완료' ? 'selected' : ''}>배송완료</option>
                                                </select>
                                                <br/>
                                                <label class="control-label col-sm-4">담당 배송사</label>
                                                <select class="form-select del_com" name="del_com">
                                                    <option id="opt2" vlaue="">배송사를 선택하세요</option>
                                                    <option value="CJ대한통운" ${obj.del_com == 'CJ대한통운' ? 'selected' : ''}>CJ대한통운</option>
                                                    <option value="한진택배" ${obj.del_com == '한진택배' ? 'selected' : ''}>한진택배</option>
                                                    <option value="우체국택배" ${obj.del_com == '우체국택배' ? 'selected' : ''}>우체국택배</option>
                                                    <option value="기타" ${obj.del_com == '기타' ? 'selected' : ''}>기타</option>
                                                </select>
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




