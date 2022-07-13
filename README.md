# README

## Quickstart:

0. Ruby version is 2.6.3
1. Install depedencies: `bundle` & `yarn install`
2. Start postgres: `docker-compose up` or `sudo docker-compose up`
3. Create db: `rails db:create`
4. Run the migrations: `rails db:migrate`
5. Seed db: `rails db:seed`


## General information:

A customer requested an imdb-like page where people could rate and discuss on movies.
As a first deliverable, application should just support the ability to add/edit/delete movies
as well as mass import movies via a file (sample file can be found at resources/movies.json).
Each movie is described by genres, runtime, ratings, cast, directors and writers.
Moreover, there should be a page for each "participant" (cast, writer or director) displaying the movies he/she got involved, as well as stats like average ratings etc.

A colleague of yours implemented the first deliverable. It is your job to review the code before the launch. 

Your task is:

- To provide a written code review on the project. Comment on correctness, performance, coding style and anything else you think may be wrong with it.

- ~~To rewrite parts of the project (if needed) so that you improve negative points you found in the previous task. Please keep in mind that the quality of the code has to be what you'd consider _production ready_.~~
