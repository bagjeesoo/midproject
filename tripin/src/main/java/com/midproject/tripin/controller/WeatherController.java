package com.midproject.tripin.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

@Controller
public class WeatherController {
	
	@RequestMapping("weather.do")
    public void getCurrentWeather(Model model) throws Exception {
		String serviceKey = "zN45JM7OAXI87vMwdJTfpW5sL25TQ6E1AQ5RZ6lYAGahXZg2Aqeu9I04fGg/7Oyc5x21dHHMGT9tRRVMePPLpA==";
        String baseDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        String baseTime = getRecentBaseTime(); // 가장 가까운 정각
        
        List<Map<String, String>> locations = Arrays.asList(
                Map.of("name", "서울", "nx", "60", "ny", "127"),
                Map.of("name", "부산", "nx", "98", "ny", "76"),
                Map.of("name", "강원", "nx", "73", "ny", "134"),
                Map.of("name", "인천", "nx", "55", "ny", "124"),
                Map.of("name", "대구", "nx", "89", "ny", "90"),
                Map.of("name", "울산", "nx", "102", "ny", "84"),
                Map.of("name", "광주", "nx", "58", "ny", "74"),
                Map.of("name", "제주", "nx", "52", "ny", "38")
          );
        
        // ResTemplate
        RestTemplate restTemplate = new RestTemplate();
        List<Map<String, String>> weatherList = new ArrayList<>();
        
        for(Map<String, String> loc : locations) {
            String nx = loc.get("nx");
            String ny = loc.get("ny");
            String regionName = loc.get("name");
            
            String url = "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst"
                    + "?serviceKey=" + serviceKey
                    + "&numOfRows=10&pageNo=1&dataType=JSON"
                    + "&base_date=" + baseDate
                    + "&base_time=" + baseTime
                    + "&nx=" + nx + "&ny=" + ny;
            
            String result = restTemplate.getForObject(url, String.class);
            JSONObject json = new JSONObject(result);
            JSONArray items = json.getJSONObject("response")
                    .getJSONObject("body")
                    .getJSONObject("items")
                    .getJSONArray("item");
            
         // 현재 온도(T1H), 습도(REH), 하늘 상태(SKY), 강수형태(PTY) 가져오기
            Map<String, String> weather = new HashMap<String, String>();
            weather.put("region", regionName);
            
            for (int i = 0; i < items.length(); i++) {
                JSONObject item = items.getJSONObject(i);
                String category = item.getString("category");
                String value = item.get("obsrValue").toString();
                
                switch (category) {
                case "T1H": weather.put("temp", value); break;     // 기온
                case "REH": weather.put("humidity", value); break; // 습도
                case "PTY": weather.put("pty", getPtyText(value)); break; // 
                }
            }
            weatherList.add(weather);
        }

        
        model.addAttribute("weatherList", weatherList);
    }

    private String getRecentBaseTime() {
        LocalTime now = LocalTime.now();
        int hour = now.getHour();
        if (now.getMinute() < 45) hour -= 1;
        return String.format("%02d00", hour);
    }
    
    private String getPtyText(String code) {        
        if(code.equals("0")) return "맑음";
        else if(code.equals("1")) return "비";
        else if(code.equals("2")) return "비/눈";
        else if(code.equals("3")) return "눈";
        else if(code.equals("4")) return "소나기";
        else return "정보 없음";
    }
    
   
    
	
}
