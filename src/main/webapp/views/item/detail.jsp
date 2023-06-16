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

<div class="container-fluid px-4">
    <h1 class="mt-4">판매상품 관리 화면</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item"><a href="/">관직자 메인페이지로</a></li>
        <li class="breadcrumb-item active">#</li>
    </ol>
    <!-- 판매상품추가 -->
    <div class="card shadow mb-4" style="width:50%">
        <div class="card-header">
            <i class="fas fa-table me-1"></i>
            판매상품 조회
        </div>
        <div class="card-body">

            <!-- Form -->
            <form id="add_form">
                <div class="row">

                    <div class="col-12">
                        <!-- 카테고리-->
                        <div class="form-group" style="padding-top:15px">
                            <label class="form-label" for="category_id">카테고리:</label>
                            <select class="form-select" id="category_id" name="category_id" value="${detail.category_id}">
                                <option value="100">꽃다발</option>
                                <option value="200">꽃</option>
                                <option value="300">화병</option>
                                <option value="400">비품</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-12 col-md-4">
                        <!-- 상품명 -->
                        <div class="form-group" style="padding-top:15px">
                            <label class="form-label" for="item_name">
                                상품명 *
                            </label>
                            <input class="form-control form-control-md" id="item_name" type="text" name="item_name" value="${detail.item_name}">
                        </div>
                    </div>

                    <div class="col-12 col-md-4">
                        <!-- 상품개수 -->
                        <div class="form-group" style="padding-top:15px">
                            <label class="form-label" for="item_cnt">
                                상품개수 *
                            </label>
                            <input class="form-control form-control-md" id="item_cnt" type="number" name="item_cnt" value="${detail.item_cnt}">
                        </div>
                    </div>

                    <div class="col-12 col-md-4">
                        <!-- 상품가격 -->
                        <div class="form-group" style="padding-top:15px">
                            <label class="form-label" for="item_price">
                                상품가격 *
                            </label>
                            <input class="form-control form-control-md" id="item_price" type="number" name="item_price" value="${detail.item_price}">
                        </div>
                    </div>
                    <br/>
                    <div class="col-12">
                        <!-- 상품설명 -->
                        <div class="form-group" style="padding-top:15px">
                            <label class="form-label" for="item_content">
                                상품설명 *
                            </label>
                            <input class="form-control form-control-md" id="item_content" type="text" name="item_content" value="${detail.item_content}">
                        </div>
                    </div>
                    <br/>
                    <div class="col-12 col-md-4">
                        <!-- 상품색상 -->
                        <div class="form-group" style="padding-top:15px">
                            <label class="form-label" for="flower_color">상품색상:</label>
                            <select class="form-select" id="flower_color" name="flower_color" value="${detail.flower_color}">
                                <option value="red">red</option>
                                <option value="orange">orange</option>
                                <option value="yellow">yellow</option>
                                <option value="green">green</option>
                                <option value="blue">blue</option>
                                <option value="navy">navy</option>
                                <option value="purple">purple</option>
                                <option value="pink">pink</option>
                                <option value="white">white</option>
                                <option value="etc">etc</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-12 col-md-4">
                        <!-- 상품종류 -->
                        <div class="form-group" style="padding-top:15px">
                            <label class="form-label" for="flower_type">상품종류:</label>
                            <select class="form-select" id="flower_type" name="flower_type" value="${detail.flower_type}">
                                <option value="감사">감사_꽃다발</option>
                                <option value="축하">축하_꽃다발</option>
                                <option value="사랑">사랑_꽃다발</option>
                                <option value="장미">장미</option>
                                <option value="작약">작약</option>
                                <option value="카라">카라</option>
                                <option value="프리지아">프리지아</option>
                                <option value="거베라">거베라</option>
                                <option value="수국">수국</option>
                                <option value="해바라기">해바라기</option>
                                <option value="백합">백합</option>
                                <option value="라벤더">라벤더</option>
                                <option value="리시안셔스">리시안셔스</option>
                                <option value="유칼립투스">유칼립투스</option>
                                <option value="아스틸베베">아스틸베베</option>
                                <option value="청공작초">청공작초</option>
                                <option value="투베로사">투베로사</option>
                                <option value="스톡크">스톡크</option>
                                <option value="기타">기타</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-12 col-md-4">
                        <!-- 상품사이즈 -->
                        <div class="form-group" style="padding-top:15px">
                            <label class="form-label" for="flower_size">상품사이즈:</label>
                            <select class="form-select" id="flower_size" name="flower_size" value="${detail.flower_size}">
                                <option value="L">Large</option>
                                <option value="M">Medium</option>
                                <option value="S">Small</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-12 col-md-5">
                        <!-- 대표사진 -->
                        <div class="form-group" style="padding-top:15px">
                            <p><label class="form-label" for="img">
                                대표사진 *
                            </label></p>
                                <img class = "medium_img" src="/uimg/${detail.item_img}"/>
                            <input class="form-control form-control-md" style="margin-top:15px" id="img" type="file" name="img" >
                        </div>
                    </div>

                    <div class="col-12 col-md-7">
                        <!-- 기타사진 -->
                        <div class="form-group" style="padding-top:15px">
                            <p><label class="form-label" for="imgList">
                                기타사진 *
                            </label></p>
                                <c:forEach var="obj" items="${ilist}">
                                    <img class = "medium_img" src="/uimg/${obj.item_subimg}">
                                </c:forEach>
                            <input class="form-control form-control-md" style="margin-top:15px" id="imgList" type="file" name="imgList" multiple>
                        </div>
                    </div>


                    <div class="col-12">
                        <!-- Button -->
                        <div class="form-group"style="padding:15px">
                            <button id="add_btn" type="button" class="btn btn-dark">상품 수정</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

