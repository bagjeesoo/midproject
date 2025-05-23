package a;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class WeatherController {

    private String serviceKey = "zN45JM7OAXI87vMwdJTfpW5sL25TQ6E1AQ5RZ6lYAGahXZg2Aqeu9I04fGg/7Oyc5x21dHHMGT9tRRVMePPLpA=="; // 반드시 인코딩!

    @GetMapping("/weather/now")
    public ResponseEntity<String> getCurrentWeather() {
        try {
            String baseDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
            String baseTime = "0600"; // 오전 6시 기준 (필요 시 변경)
            String nx = "60"; // 예시 좌표 (서울시 중구)
            String ny = "127";

            String apiUrl = "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst" +
                    "?serviceKey=" + serviceKey +
                    "&pageNo=1&numOfRows=10&dataType=JSON" +
                    "&base_date=" + baseDate +
                    "&base_time=" + baseTime +
                    "&nx=" + nx +
                    "&ny=" + ny;

            RestTemplate restTemplate = new RestTemplate();
            String response = restTemplate.getForObject(apiUrl, String.class);

            return ResponseEntity.ok(response);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("에러 발생: " + e.getMessage());
        }
    }
}

