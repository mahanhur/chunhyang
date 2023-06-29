<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<script>
    let item_add = {
        init:function (){
            $('#item_add_btn').click(function (){
                item_add.send();
            });
        },
        send:function(){
            $('#register_form').attr({
                method:'post',
                action:'/subs/addimpl',
                enctype:'multipart/form-data'
            });
            $('#register_form').submit();
        }
    };
    $(function (){
        item_add.init();
    })
</script>

<main>
    <div class="container-fluid px-4"><br>
        <p class="page_header_item"><strong>구독상품 관리 화면</strong></p>
        <div class="card mb-4">
            <div class="card-body">
                <p>ㅇ 구독 상품을 관리하실 수 있는 화면입니다.</p>
                <p>ㅇ 하단 버튼을 클릭하시어 상품 정보를 추가/삭제/수정 하실 수 있습니다.</p><hr/>
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
                <table class="table table-striped">
                    <colgroup>
                        <col width="15%"/>
                        <col width="10%"/>
                        <col width="15%"/>
                        <col width="10%"/>
                        <col width="50%"/>
                    </colgroup>
                    <thead>
                    <tr>
                        <th>상품 표출 이미지</th>
                        <th>상품아이디</th>
                        <th>상품이름</th>
                        <th>표출 가격</th>
                        <th>상품 상세 설명</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="obj" items="${slist}">
                        <tr>
                            <td>
                                <img style="width: 40%;" id="item_img" src="/uimg/${obj.subsitem_img}" alt=${obj.subsitem_img}>
                            </td>
                            <td>${obj.subsitem_id}</td>
                            <td>${obj.subsitem_name}</td>
                            <td><fmt:formatNumber value="${obj.subsitem_price}" pattern="###,###원"/></td>
                            <td>${obj.subsitem_content}</td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>



<!-- Add Modal -->
<div id="subsitemaddmodal" class="modal" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">구독 상품 추가</h4>
            </div>
            <div class="modal-body">

                <form id="register_form">
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="subsitem_imgfile">상품 상세이미지:</label>
                        <img src=""><input type="file" class="form-control" id="subsitem_imgfile" name="subsitem_imgfile" placeholder="상품 이미지를 업로드해주세요" >
                    </div><br/>
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="subsitem_name">상품 이름:</label>
                        <input type="text" class="form-control" id="subsitem_name" name="subsitem_name" placeholder="상품 이름을 입력해주세요" >
                    </div><br/>
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="subsitem_price">상품 가격:</label>
                        <input type="number" class="form-control" id="subsitem_price" name="subsitem_price" placeholder="상품 가격을 입력해주세요" >
                    </div><br/>
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="subsitem_content">상품 설명:</label>
                        <input type="text" class="form-control" id="subsitem_content" name="subsitem_content" placeholder="상품 세부 설명을 입력해주세요(200자 이내)" >
                    </div><br/>
                    <div>
                        <button type="button" id="item_add_btn" class="btn btn-outline-primary">추가</button>
                        <button type="button" id="modalclose_btn" class="btn btn-outline-primary" data-dismiss="modal">취소</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>
<!-- Add Modal END-->
