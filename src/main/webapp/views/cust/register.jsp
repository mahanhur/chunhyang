<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script>

  let register_form = {
    init:function(){
      $('#register_btn').addClass('disabled', true);
      $('#register_btn').click(function(){
        register_form.send();
      });
      $('#cust_name').keyup(function (){
        var cust_id = $('#cust_id').val();
        var cust_name = $('#cust_name').val();
        var cust_pwd = $('#cust_pwd').val();`1`

        if(cust_id != '' && cust_name != '' && cust_pwd != ''){
          $('#register_btn').removeClass('disabled');
        }
      });

      //id 4자리 이상. 중복체크
      $('#cust_id').keyup(function (){
        var txt_id = $(this).val();
        if (txt_id.length <= 3){
          $('#check_id').html('ID는 영문소문자, 숫자 4자리이상 입니다.');
          $('#check_id').css('color','red');
          return;
        }
        $.ajax({
          url:'/custcheckid',
          data:{'cust_id':txt_id},
          success:function(result){
            if(result == 0){
              $('#check_id').html('사용가능한 ID입니다.');
              $('#check_id').css('color','rgb(0, 0, 255)');
              $('#cust_pwd').focus();
            }else{
              $('#check_id').html('이미 사용중인 ID입니다.');
              $('#check_id').css('color','rgb(255, 0, 0)');

            }
          }
        });
      });

      // ID 입력 필드에 영어가 들어오면 무조건 소문자로 변환
      // ID에는 한글 입력 안됨
      $('#cust_id').on('input', function(){
        var value = $(this).val();
        value = value.toLowerCase();
        value = value.replace(/[ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
        $(this).val(value);
      });


      // Phone, Age 입력 필드에 숫자만 입력되도록 제한
      $('#phone, #age').on('input', function(){
        var value = $(this).val();
        value = value.replace(/[^0-9]/g, ''); // 비 숫자 문자 제거
        $(this).val(value);
      });

    },
    send:function(){
      var cust_id = $('#cust_id').val();
      var cust_name = $('#cust_name').val();
      var cust_pwd = $('#cust_pwd').val();

      // Check if ID가 빨간색인 경우 전송 안됨
      if ($('#check_id').css('color') == 'rgb(255, 0, 0)') {
        $('#register_btn').addClass('disabled');
        return;
      }
      if(cust_name == ''){
        $('#cust_name').focus();
        return;
      }
      if(cust_pwd == ''){
        $('#cust_pwd').focus();
        return;
      } //공백일 땐 서버로 전송안된다
      $('#register_form').attr({
        'action':'/cust/registerimpl',
        'method':'post'
      });
      $('#register_form').submit();
    }
  };

  $(function(){
    register_form.init();
  });
</script>

    <main>
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-7">
            <div class="card shadow-lg border-0 rounded-lg mt-5">
              <div class="card-header"><h3 class="text-center font-weight-light my-4">회원 등록</h3></div>
              <div class="card-body">
                <div id="container">
                <form id="register_form">

                  <div class="row mb-3">
                    <div class="col-md-6">
                      <div class="form-floating mb-3 mb-md-0">
                        <input class="form-control" id="cust_id" type="text" name="cust_id" placeholder="아이디를 입력하세요" />
                        <label for="cust_id">ID</label>
                      </div>
                    </div>
                  </div>
                  <div style="font-size:12px" id="check_id"></div>

                  <div class="row mb-3">
                    <div class="col-md-6">
                      <div class="form-floating mb-3 mb-md-0">
                        <input class="form-control" id="cust_name" type="text" name="cust_name" placeholder="이름을 입력하세요" />
                        <label for="cust_name">회원명</label>
                      </div>
                    </div>
                  </div>

                  <div class="row mb-3">
                    <div class="col-md-6">
                      <div class="form-floating mb-3 mb-md-0">
                        <input class="form-control" id="cust_pwd" type="password" name="cust_pwd" placeholder="비밀번호를 입력하세요" />
                        <label for="cust_pwd">비밀번호</label>
                      </div>
                    </div>
                  </div>

                  <div class="row mb-3">
                    <div class="col-md-6">
                      <div class="form-floating mb-3 mb-md-0">
                        <input class="form-control" id="phone" type="text" name="phone" placeholder="연락처를 입력하세요" />
                        <label for="phone">연락처</label>
                      </div>
                    </div>
                  </div>

                  <div class="row mb-3">
                    <div class="col-md-6">
                      <div class="form-floating mb-3 mb-md-0">
                        <input class="form-control" id="age" type="number" name="age" placeholder="나이를 입력하세요" />
                        <label for="age">나이</label>
                      </div>
                    </div>
                  </div>

                  <div class="row mb-3">
                    <div class="col-md-6">
                      <div class="form-floating mb-3 mb-md-0">
                        <input class="form-control" id="email" type="email" name="email" placeholder="이메일을 입력하세요" />
                        <label for="age">이메일</label>
                      </div>
                    </div>
                  </div>

                  <div class="mt-4 mb-0">
                    <div class="d-grid">
                      <button type="button" class="btn btn-primary btn-block" id="register_btn">회원 등록</button>
                    </div>
                  </div>

                </form>
                </div>
              </div>

            </div>
          </div>
        </div>
      </div>
    </main>