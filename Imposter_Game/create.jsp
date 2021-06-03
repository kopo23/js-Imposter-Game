<meta http-equiv="Content-Type" content="text/html; charset = utf-8">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,javax.sql.*,java.io.*" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>
    <%
	  try{
		Class.forName("com.mysql.cj.jdbc.Driver"); 
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.35.109:3306/kopoctc",                  
											"root" , "kopoctc");
		
		Statement stmt = conn.createStatement();
		//String QueryTxt = String.format("drop table if exists Game_Score;");
        String QueryTxt = String.format("create table Game_Score (name varchar(250), score int, num int not null primary key auto_increment);");
        
		stmt.execute(QueryTxt);
		
		stmt.close(); 
		conn.close(); 
		
	  } catch (Exception e) {
			out.println("Error:"+e);  
	  }

      out.println("<div>done</div>");
   %>
   
</body>
</html>