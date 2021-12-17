<!-- 
Katie Klein
CSD 430
December 18, 2021
Assignment 11/12
-->

<!--
This page displays a form for users to add a new video game to the database.
When the form is submitted, custom tags are used to handle the submission process.
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tlds/rec.tld" prefix="rec" %>  
<%@page import="java.lang.Boolean" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/klein_11/css/styles.css" rel="stylesheet" type="text/css"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@400;700&family=VT323&display=swap" rel="stylesheet">
<title>Video Games Database</title>
</head>
<body>
	<h1>Video Games Database</h1>
	
	<%
		// on doGet
		if (request.getMethod().equals("GET")) {
	%>
			<!-- Display form -->
			<form action="" method="post">
				<fieldset>
					<legend>Add a Video Game</legend>
					
					<table class="formTable">
						<tr><td><label for="title">Title:</label></td>
							<td><input type="text" id="title" name="title" autofocus></td></tr>
							
						<tr><td><label for="year">Release year:</label></td>
							<td><input type="number" id="year" name="year" min="1958" max="2099" step="1" value="2000"></td></tr>
							
						<tr><td><label for="studio">Game studio:</label></td>
							<td><input type="text" id="studio" name="studio"></td></tr>
							
						<tr><td><label for="genre">Genre:</label></td>
							<td><select id="genre" name="genre">
								<option value="Action-adventure">Action-adventure</option>
								<option value="MMO">MMO</option>
								<option value="Puzzle">Puzzle</option>
								<option value="Role-playing">Role-playing</option>
								<option value="Platformer">Platformer</option>
								<option value="Sandbox">Sandbox</option>
								<option value="Shooter">Shooter</option>
								<option value="Simulation">Simulation</option>
								<option value="Sports">Sports</option>
								<option value="Strategy">Strategy</option>
								</select>
								</td></tr>

						<tr><td><label for="console">Original console:</label></td>
							<td><select id="console" name="console">
								<option value="Atari">Atari</option>
								<option value="NES">NES</option>
								<option value="Nintendo 64">Nintendo 64</option>
								<option value="Nintendo GameCube">Nintendo GameCube</option>
								<option value="Nintendo Switch">Nintendo Switch</option>
								<option value="Nintendo Wii">Nintendo Wii</option>
								<option value="Nintendo Wii U">Nintendo Wii U</option>
								<option value="PC">PC</option>
								<option value="PlayStation">PlayStation</option>
								<option value="PlayStation 2">PlayStation 2</option>
								<option value="PlayStation 3">PlayStation 3</option>
								<option value="PlayStation 4">PlayStation 4</option>
								<option value="PlayStation 5">PlayStatio 5</option>
								<option value="Sega">Sega</option>
								<option value="Xbox">Xbox</option>
								<option value="Xbox 360">Xbox 360</option>
								<option value="Xbox One">Xbox One</option>
								<option value="Xbox Series X/S">Xbox Series X/S</option>
								<option value="Other">Other</option>
							</select>
							</td></tr>	
							
						<tr><td><label for="rating">ESRB rating:</label></td>
							<td><select id="rating" name="rating">
								<option value="Everyone">Everyone</option>
								<option value="Everyone 10+">Everyone 10+</option>
								<option value="Teen">Teen</option>
								<option value="Mature 17+">Mature 17+</option>
								<option value="Adults Only 18+">Adults Only 18+</option>
								<option value="Rating Pending">Rating Pending</option>
							</select>
							</td></tr>							
							
						<tr><td><label for="main-character">Main character:</label></td>
							<td><input type="text" id="mainCharacter" name="mainCharacter"></td></tr>
														
						<tr><td></td><td>
								<input type="checkbox" id="played" name="played" value="Yes" checked/>
								<label for="played" class="not-bold">I have played this game</label>
							</td></tr>																								
					</table>
					
					<input type="submit" value="Save to database" class="button">
					
				</fieldset>
			
			</form>
			
	<%
		}
	%>
	
	<% 
		// on doPost
		if (request.getMethod().equals("POST")) {
			// check whether 'played' box is checked and save value accordingly (1 if true, 0 if false)
			int played = request.getParameter("played") != null ? 1 : 0; 
	%>
			<!-- use custom tag rec:insert insert info from form as new record in database -->				
			<rec:insert 
			  title="<%=request.getParameter(\"title\") %>"
			  year="<%=Integer.parseInt(request.getParameter(\"year\")) %>"
			  studio="<%=request.getParameter(\"studio\") %>"
			  genre="<%=request.getParameter(\"genre\") %>"
			  console="<%=request.getParameter(\"console\") %>"
			  rating="<%=request.getParameter(\"rating\") %>"
			  mainCharacter="<%=request.getParameter(\"mainCharacter\") %>"
			  played="<%=played %>" 
			/>	
						
			<!-- use custom tag to query database and display all records -->
			<rec:display />
			
	<%	
		}	
	%>

			
	
</body>
</html>