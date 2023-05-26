<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    let item_add = {
//        maxSize: 5242880,  // 5M
        init:function(){
            $('#add_btn').click(function() {
                var formData = new FormData();

//                var inputFile = $("input[name='img']");
                // console.log(inputFile);
//                var files = inputFile[0].files;
//                for(var i=0; i<files.length;i++){
                // 함수 호출(checkExtension)
                //                  if(!item_add.checkExtension(files[i].name, files[i].size)){
                //                     return;
                //                 }
//            }
                item_add.send();

            });
        },
        // checkExtension:function(fileName, fileSize){
        //     var reg = new RegExp("(.*?)\.(exe|zip|alz)$");
        //
        //     // 파일크기 제한
        //     // 실제파일의 크기 > 최대 크기
        //     if(fileSize >= this.maxSize){
        //         alert("파일 사이즈 초과");
        //         return false;
        //     }
        //
        //     // 확장자 제한
        //     // 실제파일명의 확장자와 정규식 비교
        //     // 정규식이면
        //     if(reg.test(fileName)){
        //         alert("해당 종류의 파일은 업로드 할 수 없습니다.");
        //         return false;
        //     }
        //     return true;
        //
        // },
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
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">판매상품 관리화면</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">판매상품 추가</h6>
        </div>
        <div class="card-body">
            <div id="container">
                <form id="add_form" class="form-horizontal well">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="item_name">상품명:</label>
                        <div class="col-sm-10">
                            <input type="text" name="item_name" class="form-control" id="item_name" placeholder="Enter name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="category_id">카테고리:</label>
                        <select class="form-select" id="category_id" name="category_id">
                            <option value="1">꽃</option>
                            <option value="2">화분</option>
                            <option value="3">비품</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="item_price">상품가격:</label>
                        <div class="col-sm-10">
                            <input type="number" name="item_price" class="form-control" id="item_price" placeholder="Enter price">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="item_cnt">상품개수:</label>
                        <div class="col-sm-10">
                            <input type="number" name="item_cnt" class="form-control" id="item_cnt" placeholder="Enter cnt">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="item_content">상품설명:</label>
                        <div class="col-sm-10">
                            <input type="text" name="item_content" class="form-control" id="item_content" placeholder="Enter content">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="flower_color">색상:</label>
                        <div class="col-sm-10">
                            <input type="text" name="flower_color" class="form-control" id="flower_color" placeholder="Enter color">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="flower_type">종류:</label>
                        <div class="col-sm-10">
                            <input type="number" name="flower_type" class="form-control" id="flower_type" placeholder="Enter type">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="flower_size">사이즈:</label>
                        <select class="form-select" id="flower_size" name="flower_size">
                            <option value="L">Large</option>
                            <option value="M">Medium</option>
                            <option value="S">Small</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2" for="img1">상품사진1:</label>
                        <div class="col-sm-10">
                            <input type="file" name="img1" class="form-control" id="img1" placeholder="Input image">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2" for="img2">상품사진2:</label>
                        <div class="col-sm-10">
                            <input type="file" name="img2" class="form-control" id="img2" placeholder="Input image">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="img3">상품사진3:</label>
                        <div class="col-sm-10">
                            <input type="file" name="img3" class="form-control" id="img3" placeholder="Input image">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="img4">상품사진4:</label>
                        <div class="col-sm-10">
                            <input type="file" name="img4" class="form-control" id="img4" placeholder="Input image">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="img5">상품사진5:</label>
                        <div class="col-sm-10">
                            <input type="file" name="img5" class="form-control" id="img5" placeholder="Input image">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button id="add_btn" type="button" class="btn btn-info">상품 추가</button>
                        </div>
                    </div>
                </form>


            </div>
        </div>
    </div>
</div>
