<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    let item_add = {
        maxSize: 5242880,  // 5M
        init:function(){
            $('#add_btn').click(function(){
                var formData = new FormData();

                var inputFile = $("input[name='img']");
                // console.log(inputFile);
                var files = inputFile[0].files;
                for(var i=0; i<files.length;i++){
                    // 함수 호출(checkExtension)
                    if(!item_add.checkExtension(files[i].name, files[i].size)){
                        return;
                    }
                }
                item_add.send();

            });
        },
        checkExtension:function(fileName, fileSize){
            var reg = new RegExp("(.*?)\.(exe|zip|alz)$");

            // 파일크기 제한
            // 실제파일의 크기 > 최대 크기
            if(fileSize >= this.maxSize){
                alert("파일 사이즈 초과");
                return false;
            }

            // 확장자 제한
            // 실제파일명의 확장자와 정규식 비교
            // 정규식이면
            if(reg.test(fileName)){
                alert("해당 종류의 파일은 업로드 할 수 없습니다.");
                return false;
            }
            return true;

        },
        send:function(){
            $('#add_form').attr({
                method:'post',
                action:'/item/addimpl',
                enctype: 'multipart/form-data'
            });
            $('#add_form').submit();
        }
    };

    $(function(){
        item_add.init();
    });
</script>
<style>
    .medium_img {
        width: 80px;
        height: 80px;
    }
</style>
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">판매상품 관리화면</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">판매상품 상세변경</h6>
        </div>
        <div class="card-body">
            <div id="container">
                <form id="add_form" class="form-group well" style="width: 500px;">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="item_name">상품명:</label>
                        <div class="col-sm-10">
                            <input type="text" name="item_name" class="form-control" id="item_name" value="${detail.item_name}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="category_id">카테고리:</label>
                        <select class="form-select" width="900px" id="category_id" name="category_id" value="${detail.category_id}">
                            <option value="1">꽃</option>
                            <option value="2">화분</option>
                            <option value="3">비품</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="item_price">상품가격:</label>
                        <div class="col-sm-10">
                            <input type="number" name="item_price" class="form-control" id="item_price" value="${detail.item_price}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="item_cnt">상품개수:</label>
                        <div class="col-sm-10">
                            <input type="number" name="item_cnt" class="form-control" id="item_cnt" value="${detail.item_cnt}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="item_content">상품설명:</label>
                        <div class="col-sm-10">
                            <input type="text" name="item_content" class="form-control" id="item_content" value="${detail.item_content}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="flower_color">색상:</label>
                        <div class="col-sm-10">
                            <input type="text" name="flower_color" class="form-control" id="flower_color" value="${detail.flower_color}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="flower_type">종류:</label>
                        <select class="form-select" id="flower_type" name="flower_type" value="${detail.flower_type}">
                            <option value="1">꽃다발</option>
                            <option value="2">장미</option>
                            <option value="3">튤립</option>
                            <option value="4">작약</option>
                            <option value="5">프리지아</option>
                            <option value="6">라넌큘러스</option>
                            <option value="7">거베라</option>
                            <option value="8">리시안셔스</option>
                            <option value="9">아카시아</option>
                            <option value="10">수국</option>
                            <option value="11">국화</option>
                            <option value="12">백합</option>
                            <option value="13">카라</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="flower_size">사이즈:</label>
                        <select class="form-select" id="flower_size" name="flower_size" value="${detail.flower_size}">
                            <option value="L">Large</option>
                            <option value="M">Medium</option>
                            <option value="S">Small</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2" for="img">대표사진:</label>
                        <div class="col-sm-10">
                            <img class = "medium_img" src="/uimg/${detail.item_img}"/>
                            <input type="file" name="img" class="form-control" id="img" >
                        </div>
                    </div>

                    <c:forEach var="obj" items="${ilist}">
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="img1">상품사진:</label>
                            <div class="col-sm-10">
                                <img class = "medium_img" src="/uimg/${obj.item_subimg}">
                                <input type="file" name="img1" class="form-control" id="img1">
                            </div>
                        </div>
                    </c:forEach>

<%--                    <div class="form-group">--%>
<%--                        <label class="control-label col-sm-2" for="img2">상품사진2:</label>--%>
<%--                        <div class="col-sm-10">--%>
<%--                            <input type="file" name="img2" class="form-control" id="img2" >--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="form-group">--%>
<%--                        <label class="control-label col-sm-2" for="img3">상품사진3:</label>--%>
<%--                        <div class="col-sm-10">--%>
<%--                            <input type="file" name="img3" class="form-control" id="img3" >--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="form-group">--%>
<%--                        <label class="control-label col-sm-2" for="img4">상품사진4:</label>--%>
<%--                        <div class="col-sm-10">--%>
<%--                            <input type="file" name="img4" class="form-control" id="img4" >--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="form-group">--%>
<%--                        <label class="control-label col-sm-2" for="img5">상품사진5:</label>--%>
<%--                        <div class="col-sm-10">--%>
<%--                            <input type="file" name="img5" class="form-control" id="img5" >--%>
<%--                        </div>--%>
<%--                    </div>--%>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button id="add_btn" type="button" class="btn btn-info">상품 정보 변경</button>
                        </div>
                    </div>
                </form>


            </div>
        </div>
    </div>
</div>
