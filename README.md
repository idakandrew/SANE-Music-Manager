# SANE-Music-Manager
This repository contains a sample of the PostgreSQL statements and queries which were used to build, populate, and search our music database. 

Project built in collaboration with Eric Jean, Syed Manal and Neel Raj. 
## Initialization Statements
Used to create and link tables in the first steps of our project.
## Population Statements
Used to back-populate our database with randomly generated and linked data for testing purposes.
## Retrieval Queries
Used to search for and return songs and their respective data when users interact with the frontend GUI.
## Analytic Queries
Used to generate and collate analytic data for internal use. 
## Reccomendation Query
This query underwent a lot of iterations, primarily because the complexity of erlier iterations kept getting out of hand. Our original approaches
involved matching user preferences with platform-wide trends, but we eventually scaled back to focus purely on individual users. The current
iteration generates reccomendations based on a user's listening history, both what they have and have not listened to. 
