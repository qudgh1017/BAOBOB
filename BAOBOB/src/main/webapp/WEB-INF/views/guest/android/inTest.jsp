<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="ex.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	String returns = "";
	String type = request.getParameter("type");
	String vision = request.getParameter("vision_write");
%>

<%
	if(type == null) {
		return;
	} else if(type.equals("vision_write")) {
		System.out.println("값 받음  " + vision);
		
		Vision_Write vision_board = Vision_Write.getWrite();
		
	}
%>