package com.chflower.chart;

import com.chflower.dto.*;
import com.chflower.service.*;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import java.util.Date;
import java.util.List;

@Slf4j
@SpringBootTest
class genderTest {
    @Autowired
    ChartService service;
    @Test
    void contextLoads() throws ParseException {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date1 = null;
        Date date2 = null;

        date1 = dateFormat.parse("2023-06-01");
        date2 = dateFormat.parse("2023-06-02");

        log.info("date1={}", date1);
        log.info("date2={}", date2);

        Chart chart = new Chart(date1, date2);
        int jo;

        try {
            jo = service.mantotalsales(chart);
            log.info("------------------------------------------------------------------");
            log.info("jo={}", jo); // jo 값 로그 출력
            log.info("-------------------------------------------------------------------");
        } catch (Exception e) {
            log.info("------------------------------------------------------------------");
            log.info("오류");
            log.info("------------------------------------------------------------------");
        }
    }

}
