<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    let item_update = {
        // maxSize: 5242880,  // 5M
        maxSize: 55242880,  // 55M
        init:function(){
            $('#update_btn').click(function(){
                item_update.send();
            });
        },
        send:function(){
            $('#add_form').attr({
                method:'post',
                action:'/item/updateimpl',
                enctype: 'multipart/form-data'
            });
            $('#add_form').submit();
        }
    };
    $(function(){
        item_update.init();
    });
    // let item_update = {
    //     maxSize: 5242880,  // 5M
    //     init:function(){
    //         $('#update_btn').click(function(){
    //             var formData = new FormData();
    //
    //             var inputFile = $("input[name='img']");
    //             // console.log(inputFile);
    //             var files = inputFile[0].files;
    //             for(var i=0; i<files.length;i++){
    //                 // 함수 호출(checkExtension)
    //                 if(!item_add.checkExtension(files[i].name, files[i].size)){
    //                     return;
    //                 }
    //             }
    //             item_add.send();
    //
    //         });
    //     },
    //     checkExtension:function(fileName, fileSize){
    //         var reg = new RegExp("(.*?)\.(exe|zip|alz)$");
    //
    //         // 파일크기 제한
    //         // 실제파일의 크기 > 최대 크기
    //         if(fileSize >= this.maxSize){
    //             alert("파일 사이즈 초과");
    //             return false;
    //         }
    //
    //         // 확장자 제한
    //         // 실제파일명의 확장자와 정규식 비교
    //         // 정규식이면
    //         if(reg.test(fileName)){
    //             alert("해당 종류의 파일은 업로드 할 수 없습니다.");
    //             return false;
    //         }
    //         return true;
    //
    //     },
    //     send:function(){
    //         $('#add_form').attr({
    //             method:'post',
    //             action:'/item/addimpl',
    //             enctype: 'multipart/form-data'
    //         });
    //         $('#add_form').submit();
    //     }
    // };
    //
    // $(function(){
    //     item_add.init();
    // });
</script>
<style>
    .medium_img {
        width: 80px;
        height: 80px;
    }
</style>

<div class="container-fluid px-4">
    <p class="page_header_item"><strong>판매상품 관리 화면</strong></p>

    <!-- 판매상품조회 -->
    <div class="card shadow mb-4" style="width:50%">
        <div class="card-header">
            <i class="fas fa-table me-1"></i>
            판매상품 조회
        </div>
        <div class="card-body">

            <!-- Form -->
            <form id="add_form">
                <input type="hidden" name ="item_id" value="${detail.item_id}">
                <div class="row">
                    <div class="col-12">
                        <!-- 카테고리-->
                        <div class="form-group" style="padding-top:15px">
                            <label class="form-label" for="category_id">카테고리:</label>
                            <select class="form-select" id="category_id" name="category_id" value="${detail.category_id}">
                                <option value="100" <c:if test="${detail.category_id eq '100'}">selected</c:if>>꽃다발</option>
                                <option value="200" <c:if test="${detail.category_id eq '200'}">selected</c:if>>꽃</option>
                                <option value="300" <c:if test="${detail.category_id eq '300'}">selected</c:if>>화병</option>
                                <option value="400" <c:if test="${detail.category_id eq '400'}">selected</c:if>>비품</option>
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
                                <option value="red" <c:if test="${detail.flower_color eq 'red'}">selected</c:if>>red</option>
                                <option value="orange" <c:if test="${detail.flower_color eq 'orange'}">selected</c:if>>orange</option>
                                <option value="yellow" <c:if test="${detail.flower_color eq 'yellow'}">selected</c:if>>yellow</option>
                                <option value="green" <c:if test="${detail.flower_color eq 'green'}">selected</c:if>>green</option>
                                <option value="blue" <c:if test="${detail.flower_color eq 'blue'}">selected</c:if>>blue</option>
                                <option value="navy" <c:if test="${detail.flower_color eq 'navy'}">selected</c:if>>navy</option>
                                <option value="purple" <c:if test="${detail.flower_color eq 'purple'}">selected</c:if>>purple</option>
                                <option value="pink" <c:if test="${detail.flower_color eq 'pink'}">selected</c:if>>pink</option>
                                <option value="white"<c:if test="${detail.flower_color eq 'white'}">selected</c:if>>white</option>
                                <option value="etc" <c:if test="${detail.flower_color eq 'etc'}">selected</c:if>>etc</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-12 col-md-4">
                        <!-- 상품종류 -->
                        <div class="form-group" style="padding-top:15px">
                            <label class="form-label" for="flower_type">상품종류:</label>
                            <select class="form-select" id="flower_type" name="flower_type" value="${detail.flower_type}">
                                <option value="감사" <c:if test="${detail.flower_type eq '감사'}">selected</c:if>>감사_꽃다발</option>
                                <option value="축하" <c:if test="${detail.flower_type eq '축하'}">selected</c:if>>축하_꽃다발</option>
                                <option value="사랑" <c:if test="${detail.flower_type eq '사랑'}">selected</c:if>>사랑_꽃다발</option>
                                <option value="장미" <c:if test="${detail.flower_type eq '장미'}">selected</c:if>>장미</option>
                                <option value="작약" <c:if test="${detail.flower_type eq '작약'}">selected</c:if>>작약</option>
                                <option value="카라" <c:if test="${detail.flower_type eq '카라'}">selected</c:if>>카라</option>
                                <option value="프리지아" <c:if test="${detail.flower_type eq '프리지아'}">selected</c:if>>프리지아</option>
                                <option value="거베라" <c:if test="${detail.flower_type eq '거베라'}">selected</c:if>>거베라</option>
                                <option value="수국" <c:if test="${detail.flower_type eq '수국'}">selected</c:if>>수국</option>
                                <option value="해바라기" <c:if test="${detail.flower_type eq '해바라기'}">selected</c:if>>해바라기</option>
                                <option value="백합" <c:if test="${detail.flower_type eq '백합'}">selected</c:if>>백합</option>
                                <option value="라벤더" <c:if test="${detail.flower_type eq '라벤더'}">selected</c:if>>라벤더</option>
                                <option value="리시안셔스" <c:if test="${detail.flower_type eq '리시안셔스'}">selected</c:if>>리시안셔스</option>
                                <option value="유칼립투스" <c:if test="${detail.flower_type eq '유칼립투스'}">selected</c:if>>유칼립투스</option>
                                <option value="아스틸베베" <c:if test="${detail.flower_type eq '아스틸베베'}">selected</c:if>>아스틸베베</option>
                                <option value="청공작초" <c:if test="${detail.flower_type eq '청공작초'}">selected</c:if>>청공작초</option>
                                <option value="투베로사" <c:if test="${detail.flower_type eq '투베로사'}">selected</c:if>>투베로사</option>
                                <option value="스톡크" <c:if test="${detail.flower_type eq '스톡크'}">selected</c:if>>스톡크</option>
                                <option value="기타" <c:if test="${detail.flower_type eq '기타'}">selected</c:if>>기타</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-12 col-md-4">
                        <!-- 상품사이즈 -->
                        <div class="form-group" style="padding-top:15px">
                            <label class="form-label" for="flower_size">상품사이즈:</label>
                            <select class="form-select" id="flower_size" name="flower_size" value="${detail.flower_size}">
                                <option value="L" <c:if test="${detail.flower_size eq 'L'}">selected</c:if>>Large</option>
                                <option value="M" <c:if test="${detail.flower_size eq 'M'}">selected</c:if>>Medium</option>
                                <option value="S" <c:if test="${detail.flower_size eq 'S'}">selected</c:if>>Small</option>
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
                            <input class="form-control form-control-md" style="margin-top:15px" id="img" type="file" name="img">
                            <input type="hidden" name="item_img" value="${detail.item_img}">
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
                            <input class="form-control form-control-md" style="margin-top:15px" id="ilist" type="hidden" name="ilist" value="${ilist}" />
<%--                            <input type="hidden" name="item_img_List" value="${img.item_subimg}">--%>
                        </div>
                    </div>


                    <div class="col-12">
                        <!-- Button -->
                        <div class="form-group"style="padding:15px">
                            <button id="update_btn" type="button" class="btn btn-dark">상품 수정</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

