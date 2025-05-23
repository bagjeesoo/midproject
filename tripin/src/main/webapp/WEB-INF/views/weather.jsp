<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 페이지</title>

<link rel="stylesheet" href="resources/css/weather.css">
</head>
<body>

<h2>오늘의 날씨</h2>


<div class="weather-container">
    <c:forEach var="weather" items="${weatherList}">
        <div class="weather-card">
            <h3>${weather.region}</h3>
            <p>기온: ${weather.temp}℃</p>
            <p>습도: ${weather.humidity}%</p>
            <p>날씨: ${weather.pty}</p>
        </div>
    </c:forEach>
</div>


<c:if test="${not empty error}">
    <p style="color:red;">${error}</p>
</c:if>

</body>
</html>