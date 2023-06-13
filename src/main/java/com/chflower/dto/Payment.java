package com.chflower.dto;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Payment {
    private int pay_id;
    private int order_id;
    private int subs_id;
    private int pay_opt;
    private int pay_state;
}
