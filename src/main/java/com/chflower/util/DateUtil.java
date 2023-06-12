// 5월3일을 선택을 하면 0시까지만 선택됨. 우리는 5월3일 24시까지 데이터를 가져오기 위해서 이 유틸을 추가함
package com.chflower.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
    public static String getDateStr(String str){
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            date = format.parse(str);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        date.setDate(date.getDate()+1);
        String datestr = format.format(date);
        return datestr;
    }
}
