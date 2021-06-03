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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript" src="jquery-ui.min.js"></script>
    <link rel="stylesheet" href="Game.css">
</head>
<body>
    <script>
        $(function(){
            $("#cover").css("background", "url('Sets/cover1.jpg')");
            $("#cover").fadeIn(1000);
        });
    </script>
    <div id="container">
        <div class = "maincontent">
        <div><h2>Score Table</h2></div>
        <table id = "ScoreTable">
            <tr>
                <td>Ranking</td>
                <td>Name</td>
                <td>Score</td>
            </tr>
    <%
    try{
        Class.forName("com.mysql.cj.jdbc.Driver"); 
        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.35.109:3306/kopoctc",                  
                                            "root" , "kopoctc");
        
        Statement stmt = conn.createStatement();
        int count = 0;
        String QueryTxt ="select * from Game_Score order by score desc limit 5;";
        ResultSet rset = stmt.executeQuery(QueryTxt);
        
        while (rset.next()) { 
            count ++;
           %>
            <tr>
                <td><%=count%></td>
                <td><%=rset.getString(1)%></td>
                <td><%=rset.getString(2)%></td>
            </tr>
           <%
        }
        rset.close();
        stmt.close(); 
        conn.close(); 
        
        } catch (Exception e) {
              out.println("Error"+"<br>");  
              out.println(e);
        }

    %>
            </table>
            <button id = "StartBtn" onclick = 'location.href="Game1.html"'>Home</button>
            <div>Created by ChanHyeok(Kopo23)</div>
        </div>
        <div id = "cover" class ="cover"></div>
    </div>
</body>
</html>