# Video Games Database 🎮
<p><b>This is a dynamic web application using Jakarta EE where users can add data about video games to a MySQL database.</b></p>
<p><i>This project was created for a university course on Server-Side Development with Jakarta EE.</i></p>

## ▶️ Languages/Features:
<ul>
  <li>Java</li>
  <ul>
    <li>JDBC connection</li>
    <li>Java beans</li>
  </ul>
  <li>JSPs</li>
  <ul><li>Custom tags</li></ul>
  <li>CSS</li>
  <li>MySQL</li>
  <li>Run on Apache Tomcat server</li>
</ul>

## ▶️ What it looks like
<p>The app first displays a form which users can submit.</p>
<img width="600" alt="filling-out-form-screenshot" src="https://user-images.githubusercontent.com/71147550/146605734-964330f8-b239-4cad-94d7-599ef25722b4.png">

<br>

<p>Upon submission, all data in the database is displayed, ordered alphabetically by game title.</p>
<p>An 'Add another game' button is available which takes users back to the form which can be submitted again.</p>
<img width="900" alt="database-display-screenshot" src="https://user-images.githubusercontent.com/71147550/146605748-4122c1fa-bf2d-42ee-b563-81966560cd3c.png">

<br>

## ▶️ How to use it
<ol>
  <li>Run the klein_db_init.sql file in MySQL to initialize a local database
    <ul><li>One way is to open a terminal, access MySQL using your root user/password information, and type "source klein_db_init.sql"</li></ul>
  </li>
  <li>Import the klein_11.war file into your IDE (I used Eclipse)</li>
  <li>Ensure you have a Tomcat server version 9.0 set up
    <ul><li>This project is optimized for Tomcat 9.0. If you want to use Tomcat 10.0, some of the imports in the files will need to be changed from javax to jakarta</li></ul>
  </li>
  <li>Run the index.jsp file on your Tomcat 9.0 server from within your IDE, or go to a browser and type the URL to access it (e.g. http://localhost:8080/klein_11/index.jsp)</li>
</ol>

<br>
<p>
  *Please note, in accordance with the requirements of this assignment, index.jsp first populates the database with several hardcoded record insertions. Delete these insert statements from index.jsp if you wish to start with an empty data set.
</p>
<br>

