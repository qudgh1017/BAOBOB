<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="/baobob/resources/reset.css">
<c:set var="projectRes" value="/baobob/resources/" />

<link rel="icon" href="${projectRes}images/lgt/lost/The-Baobab-Tree-4.jpg" type="image/x-icon" />

<!-- 구글챠트 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>google.charts.load('current', {packages:['corechart']});</script>		