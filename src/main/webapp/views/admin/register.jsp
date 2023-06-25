<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script>
  let register = {
    init: ()=>{
      $('#register_btn').attr('disabled',true);
      $('#checkEmail').attr('disabled',true);
      $("#register_btn").click( () => {
            register.send();
      });

      //비밀번호 일치여부 확인
      $('#admin_pwd2').keyup(() => {
        let pwd = $("#admin_pwd").val();
        let pwd2 = $("#admin_pwd2").val();
        if(pwd != pwd2) {
          $("#pwderror").html("입력하신 비밀번호가 다릅니다.");
          $("#pwderror").css('color','red');
        } else{
          $("#pwderror").html("입력하신 비밀번호가 일치합니다.");
          $("#pwderror").css('color','blue');
        }
      });

        $('#admin_email').keyup( () => {
            let id = $("#admin_id").val();
            let pwd = $("#admin_pwd").val();
            let lev = $("#admin_lev").val();
            let email = $("#admin_email").val();
            if(id != '' && pwd != '' && lev != '' && email != '') {
                let pwd2 = $("#admin_pwd2").val();
                if(pwd == pwd2){
                    $('#checkEmail').attr('disabled',false);
                    }
                }
            });

        //인증번호 이메일 발송
        $('#checkEmail').click(function() {
            let email = $("#admin_email").val();
                if(email == ''){
                  $('#checkEmail').attr('disabled',true)
                    toastr.error("이메일을 입력해주세요")
                }
            var email_txt = $('#admin_email').val()
            $.ajax({
                // type : 'POST',
                url : '/mailConfirm',
                data : {"email" : email_txt},
                success : function(data){
                    toastr.success("해당 이메일로 인증번호 발송이 완료되었습니다. \n 확인부탁드립니다.")
                    console.log("data : "+data);
                    chkEmailConfirm(data, $('#emailconfirm'), $('#emailconfirmTxt'));
                }
            })
        })

        // 이메일 인증번호 체크 함수
        function chkEmailConfirm(data){
            $('#emailconfirm').on("keyup", function(){
                if (data != $('#emailconfirm').val()){
                    emconfirmchk = false;
                    $('#emailconfirmTxt').html("<span id='emconfirmchk'>인증번호가 잘못되었습니다.</span>")
                    $("#register_btn").attr("disabled", true);
                    $("#emconfirmchk").css({
                        "color" : "#FA3E3E",
                        "font-weight" : "bold",
                        "font-size" : "10px"
                    })
                } else {
                    emconfirmchk = true;
                    $('#emailconfirmTxt').html("<span id='emconfirmchk'>인증번호 확인 완료</span>")
                    $("#register_btn").attr("disabled", false);
                    $("#emconfirmchk").css({
                        "color" : "#0D6EFD",
                        "font-weight" : "bold",
                        "font-size" : "10px"
                    })
                }
            })
        }
    },

    // ID를 채번되어져서 만들기때문에 체크할필요 없어서 아래 내용삭제
    // check: ()=> {
    //   // 기존에 있는 id인지 확인
    //   let id = $("#admin_id").val();
    //   $.ajax({
    //     url: '/checkid',
    //     data: {'id': id},
    //     success: function (result) {
    //       if (result == 0) {
    //         register.send();
    //       } else {
    //         alert('이미 존재하는 ID입니다. 다시 입력하세요');
    //         $("#admin_id").val('');
    //       }
    //     }
    //   });
    // },

    // 입력값 form 전송
    send : ()=>{
      $("#register_form").attr({
        'action':'/admin/registerimpl',
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
              <div class="card-header"><h3 class="text-center font-weight-light my-4">직원 등록</h3></div>
              <div class="card-body">
                <div id="container">
                <form id="register_form">

                  <div class="row mb-3">
<%--                    시쿼스값으로 admin_id를 생성하므로 id 입력값은 불필요--%>
<%--                    <div class="col-md-6">--%>
<%--                      <div class="form-floating mb-3 mb-md-0">--%>
<%--                    <input class="form-control" id="admin_id" type="number" name="admin_id" placeholder="노비번호를 만들어주세요"/>--%>
<%--                    <label for="admin_id">노비번호</label>--%>
<%--                      </div>--%>
<%--                    </div>--%>
                    <div class="col-md-6">
                      <div class="form-floating mb-3 mb-md-0">
                        <input class="form-control" id="admin_name" type="text" name="admin_name" placeholder="직원이름을 입력하세요" />
                        <label for="admin_name">직원명</label>
                      </div>
                    </div>
                    <div class="col-md-6">
                        <select class="form-select" id="admin_level" name="admin_level">
                            <option id="opt" vlaue="">업무권한</option>
                            <option value="1">Level: 1</option>
                            <option value="2">Level: 2</option>
                            <option value="3">Level: 3</option>
                        </select>
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

                <div class="row mb-3">
                    <div class="col-md-6">
                        <div class="form-floating mb-3 mb-md-0">
                            <input class="form-control" id="admin_email" type="text" name="admin_email" placeholder="이메일을 입력하세요" />
                            <label for="admin_email">E-Mail</label>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <button class="btn btn-primary btn-block" type="button" id="checkEmail">인증번호 받기</button>
                    </div>
                    <div class="form-group last mb-4 check_input col-md-4">
                        <label for="emailconfirm" id="emailconfirmTxt"></label>
                        <input type="text" class="form-control" id="emailconfirm" placeholder="인증번호를 입력해주세요">
                    </div>


                </div>

                  <div class="mt-4 mb-0">
                    <div class="d-grid">
                      <button type="button" class="btn btn-primary btn-block" id="register_btn">직원 등록</button>
                    </div>
                  </div>
                </form>
                </div>
              </div>
              <div class="card-footer text-center py-3">
                <div class="small"><a href="/admin/login">이미 직원입니까? 로그인으로 이동</a></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>