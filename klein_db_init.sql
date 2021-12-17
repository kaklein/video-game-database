/* This file creates a video_games database with a specific user
 * (does not create any tables)
 * 
 * -> Run this MySQL file prior to testing the klein_11 application.
 * 
 * */

DROP DATABASE IF EXISTS video_games;
CREATE DATABASE video_games;

DROP USER IF EXISTS 'video_games_user'@'localhost';
CREATE USER 'video_games_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'pass';
GRANT ALL PRIVILEGES ON video_games.* TO 'video_games_user'@'localhost';