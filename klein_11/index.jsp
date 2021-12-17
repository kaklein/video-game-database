<!-- 
Katie Klein
CSD 430
December 18, 2021
Assignment 11/12
-->

<!--
This file creates and populates a 'games' table in the video_games database,
then immediately forwards to form.jsp
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection, java.sql.Statement, java.sql.SQLException" %>
<%@page import="beans.DbManager" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/klein_11/css/styles.css" rel="stylesheet" type="text/css"/>

<title>Table creation page</title>
</head>
<body>
<%
	//establish database configuration variables
	String dbName = "video_games";
	String dbUsername = "video_games_user";
	String dbPassword = "pass";
	String dbURL = "jdbc:mysql://localhost:3306/" + dbName; 
	
	// create DbManager object & connect to database
	DbManager dbManager = new DbManager();
	dbManager.setDbURL(dbURL);
	dbManager.setDbUsername(dbUsername);
	dbManager.setDbPassword(dbPassword);
	
	application.setAttribute("dbManager", dbManager); // set application attribute so other files can access database with same configurations
	Connection conn = dbManager.getConnection(); // connect to database
	
	if (conn != null) {
		Statement stmt = conn.createStatement();
		
		// drop table if exists
		try {
			stmt.executeUpdate("DROP TABLE IF EXISTS games");
		} catch (SQLException e) {
			out.println("Exception: " + e);
		}
		
		// create table
		try {
			stmt.executeUpdate("CREATE TABLE IF NOT EXISTS games (" +
				"id INT NOT NULL AUTO_INCREMENT, " +
				"title VARCHAR(100) NOT NULL, " +
				"year INT NOT NULL, " +
				"studio VARCHAR(100) NOT NULL, " +
				"genre VARCHAR(100) NOT NULL, " +
				"rating VARCHAR(15) NOT NULL, " +
				"main_character VARCHAR(100), " +
				"played BOOLEAN, " +
				"console VARCHAR(20), " +
				"PRIMARY KEY (id))"
				);
		} catch (SQLException e) {
			out.println("Could not create table: " + e);
		}
		
		// populate table with data
		try {
			conn.setAutoCommit(false);
			stmt.executeUpdate("INSERT INTO games (title, year, studio, genre, rating, main_character, played, console) " +
					"VALUES ('The Legend of Zelda: Ocarina of Time', 1998, 'Nintendo', 'Action-adventure', 'Everyone', 'Link', 1, 'Nintendo 64')"
				);		
			stmt.executeUpdate("INSERT INTO games (title, year, studio, genre, rating, main_character, played, console) " +
					"VALUES ('Bioshock', 2007, '2K Games', 'Shooter', 'Mature 17+', 'Jack', 1, 'Xbox 360')"
				);	
			stmt.executeUpdate("INSERT INTO games (title, year, studio, genre, rating, main_character, played, console) " +
					"VALUES ('Portal', 2007, 'Valve', 'Puzzle', 'Everyone 10+', 'Chell', 1, 'Xbox 360')"
				);	
			stmt.executeUpdate("INSERT INTO games (title, year, studio, genre, rating, main_character, played, console) " +
					"VALUES ('Doom', 1993, 'id Software', 'Shooter', 'Mature 17+', 'Doom guy', 0, 'PC')"
					);
			stmt.executeUpdate("INSERT INTO games (title, year, studio, genre, rating, main_character, played, console) " +
					"VALUES ('Oregon Trail', 1975, 'MECC', 'Strategy', 'Everyone 10+', 'N/A', 1, 'PC')"
				);	
			stmt.executeUpdate("INSERT INTO games (title, year, studio, genre, rating, main_character, played, console) " +
					"VALUES ('Celeste', 2018, 'Extremely OK Games', 'Platformer', 'Everyone 10+', 'Madeline', 1, 'Nintendo Switch')"
				);
			stmt.executeUpdate("INSERT INTO games (title, year, studio, genre, rating, main_character, played, console) " +
					"VALUES ('Metroid Dread', 2021, 'Nintendo', 'Action-adventure', 'Teen', 'Samus Aran', 0, 'Nintendo Switch')"
				);
		} catch (SQLException e) {
			out.println("Table data population failed: " + e);
		}
		
		try {
			stmt.close();
		}
		finally {
			stmt = null;
		}
		conn.commit(); // commit insert statements
		dbManager.putConnection(conn); // close connection
				
	}
%>

	<!-- forward to main form page -->
	<jsp:forward page="form.jsp"/>
	
</body>
</html>