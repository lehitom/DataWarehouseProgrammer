## Objective

Your assignment explores the included "The Office" dataset, in the database table named "the_office_dialog". Your task is to create new tables populated with reporting data on the dataset using SQL scripts. The database is Postgres.

## Brief

Everyone loves "The Office," a popular show that aired from 2005 to 2013. While doing research, you stumbled across this dataset, with the lines of all the episodes. You decide to explore the dataset and answer some questions by storing the results in new tables that could easily be used by a BI or reporting tool.

## Tasks

Your first task is to create new database tables using deployment scripts for your report data. You will work with these tables for the rest of the challenge. It is up to you how to structure/name/index/test/document the tables, and how many tables to make.

We want you to create tables that can provide pre-computed data and answer for the following questions:

- For all data, What are the names of the characters? How many characters are there?
SELECT * FROM the_office_speakers;
SELECT count(*) FROM the_office_speakers;
- For each season, which character has the most lines?
SELECT DISTINCT ON (season) season, speaker, lines FROM the_office_count;
- For each season, what is the number of times a "That's what she said" joke comes up?
SELECT * FROM the_office_twss ORDER BY season asc;
- For each season, what is the average percent of lines each character contributed per episode?
- For each character, what is the average number of words per line?
- For each character, what is the most common word?
- For each character, what is the number of episodes where the character does not have a line?

You are *not* required to complete all of these tasks -- if you have exhausted the time you wish to spend on this assessment please submit what you have. The goal is to get a reasonable representation of your work skills.

## Instructions

STEP 1: Create your tables/functions by adding new deployments to the existing ones in the `deploy` folder. Add deployments using the `sqitch add` command as follows:
```
sqitch add <deployment_name> -n "<description>"
```
- Set `<deployment_name>` as a filename but without the `.sql` extension.
- Set `<description>` as a brief sentence describing the deployment (like to commit message).
- After running the command, new `.sql` files will be added to the `deploy`, `revert`, and `verify` folders.

STEP 2: Edit the new `.sql` files with your SQL code to make the tables and queries/functions for populating them.
- The `deploy` script is the SQL that will create your changes. You typically make tables, functions, insert data, etc.
- The `revert` script is the SQL that will remove your changes if the command `sqitch revert --to <previous_deployment>` is run. It should do the opposite of your deploy script (e.g. drop the table/function that was just created or delete data that was just added).
- The `verify` script is SQL that can test/verify your changes. Any database changes/inserts/updates made in this script will be rolled and will not permanently change the database.
- You can look at the 2 existing deployments for reference.

STEP 3: Deploy your changes by running:
```
sqitch deploy
```
- The deploy script will be automatically run, followed by the verify script.
- If no errors occur, your deployment will be persisted in the database.
- If errors occur, you deployment will not be applied to the database and the deployment will be cancelled.

STEP 4: Repeat steps 1-3 as needed. It can help to not make a single deployment too large. You can check the current deployment status by running:
```
sqitch status
```

Please organize, design, test, and document your code as if it were going into production.

All the best and happy coding,
 
The Home Care Pulse Team 