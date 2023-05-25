<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script>
  let register = {
    init: ()=>{
      $('#register_btn').attr('disabled',true);
      $("#register_btn").click( () => {
        register.check();
      });

      //비밀번호 일치여부 확인
      $('#admin_pwd2').keyup( () => {
        let pwd = $("#admin_pwd").val();
        let pwd2 = $("#admin_pwd2").val();
        if(pwd != pwd2) {
          $("#pwderror").html("입력하신 비밀번호가 다릅니다.");
          $("#pwderror").css('color','red');
        } else{
          $("#pwderror").html("입력하신 비밀번호가 일치합니다.");
          $("#pwderror").css('color','blue');
        }

      })
      $('#admin_level').change( () => {
        let id = $("#admin_id").val();
        let pwd = $("#admin_pwd").val();
        let lev = $("#admin_lev").val();
        if(id != '' && pwd != '' && lev != '') {
            let pwd2 = $("#admin_pwd2").val();
          if(pwd == pwd2){
            $('#register_btn').attr('disabled',false);
          };
        };
      });
    },
    check: ()=> {
      // 기존에 있는 id인지 확인
      let id = $("#admin_id").val();
      $.ajax({
        url: '/checkid',
        data: {'id': id},
        success: function (result) {
          if (result == 0) {
            register.send();
          } else {
            alert('이미 존재하는 ID입니다. 다시 입력하세요');
            $("#admin_id").val('');
          }
        }
      });
    },
    // 입력값 form 전송
    send : ()=>{
      $("#register_form").attr({
        'action':'/registerimpl',
        'method':'post'
      });
      $("#register_form").submit();
    }
  };


  $( ()=> {
    register.init();
  });

</script>

    <main>
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-7">
            <div class="card shadow-lg border-0 rounded-lg mt-5">
              <div class="card-header"><h3 class="text-center font-weight-light my-4">노비 등록</h3></div>
              <div class="card-body">

                <form id="register_form">

                  <div class="row mb-3">
                    <div class="col-md-6">
                      <div class="form-floating mb-3 mb-md-0">
                    <input class="form-control" id="admin_id" type="number" name="admin_id" placeholder="노비품번을 만들어주세요"/>
                    <label for="admin_id">품번</label>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-floating mb-3 mb-md-0">
                        <input class="form-control" id="admin_name" type="text" name="admin_name" placeholder="노비이름을 입력하세요" />
                        <label for="admin_name">노비명</label>
                      </div>
                    </div>
                  </div>

                  <div class="row mb-3">
                    <div class="col-md-6">
                      <div class="form-floating mb-3 mb-md-0">
                        <input class="form-control" id="admin_pwd" type="password" name="admin_pwd" placeholder="비밀번호를 입력하세요" />
                        <label for="admin_pwd">비밀번호</label>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-floating mb-3 mb-md-0">
                        <input class="form-control" id="admin_pwd2" type="password" name="admin_pwd2" placeholder="비밀번호를 확인해주세요" />
                        <label for="admin_pwd2">비밀번호 확인</label>
                      </div>
                    </div>
                    <div style="height:10px; font-size:12px; margin-left:50%; color:red;" id="pwderror"></div>
                  </div>

                  <div>
                    <select class="form-select" id="admin_level" name="admin_level">
                      <option id="opt" vlaue="">업무권한</option>
                      <option value="1">상노비</option>
                      <option value="2">중노비</option>
                      <option value="3">하노비</option>
                    </select>
                  </div>
                  <div class="mt-4 mb-0">
                    <div class="d-grid">
                      <button type="button" class="btn btn-primary btn-block" id="register_btn">노비 등록</button>
                    </div>
                  </div>
                </form>

              </div>
              <div class="card-footer text-center py-3">
                <div class="small"><a href="/login">이미 노비입니까? 로그인 하거라</a></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>