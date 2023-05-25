package com.kbstar.dto;

import lombok.*;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString

public class Cust {
    @NotEmpty(message = "ID는 필수항목 입니다.")
    @Size(min=4, max=10, message = "ID는 최소 4자리, 최대 10자리 입니다.")
    private String id;
    @NotEmpty(message = "PW는 필수항목 입니다.")
    @Size(min=5, max=20, message = "PW는 최소 5자리, 최대 20자리 입니다.")
    private String pwd;
    @NotEmpty(message = "이름은 필수항목 입니다.")
    @Size(min=2, max=10, message = "이름은 최소 2자리, 최대 10자리 입니다.")
    private String name;
    @NotEmpty(message = "성별은 필수항목 입니다.")
    @Size(min=1, max=1, message = "M또는 F로 입력하세요.")
    private String gender;
    @NotEmpty(message = "나이는 필수항목 입니다.")
    @Size(min=1, max=3, message = "나이를 입력해주세요")
    private Integer age;

}
