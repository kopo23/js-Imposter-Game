<meta http-equiv="Content-Type" content="text/html; charset = utf-8">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,javax.sql.*,java.io.*" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%@ page import="java.util.*"%>
<%	
    String name = request.getParameter("name");
	Integer score  = Integer.parseInt(request.getParameter("score"));
	
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript" src="jquery-ui.min.js"></script>
    <link rel="stylesheet" href="Game.css">
</head>
<body>
    <%
    try{
        Class.forName("com.mysql.cj.jdbc.Driver"); 
        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.35.109:3306/kopoctc",                  
                                            "root" , "kopoctc");
        
        Statement stmt = conn.createStatement();
        String QueryTxt ="insert into Game_Score (name, score) values('"+name+"',"+score+");";
        stmt.execute(QueryTxt);
        stmt.close(); 
		conn.close(); 
		
        } catch (Exception e) {
                out.println("Error:"+e);  
        }

    %>

    <script>location.href='ScoreShow.jsp'</script>
</body>
</html>