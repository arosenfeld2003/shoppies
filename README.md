# README

I created this web app for the Shopify Web Developer Intern Challenge (Winter - 2021).  Users can search the OMDB database for their favorite movies, and nominate up to five for a Shoppie award.

The OMDB API allows for query by specific id/title, as well as a broader query by string matching each word in a title (returning the first ten results).  

For our purposes, the initial search is a string query to allow the user to choose from a list of matching results. The view shows each movie title, and a button to nominate (if the film is not already nominated).  

When the user nominates a movie from the search results list, we make another OMDB API query by that specific title, which gives us more information to display on the nominations view. Nominated films show the title, year, studio, awards, and a plot summary, all obtained from the OMDB title query.  The movie poster (if available) is displayed on the views for both types of query.

I chose to store the nominations in a database, using jsonb to store a hash (the result of the OMDB title query) on each nomination record.  Since I used Rails to build this app, it seemed logical to follow the conventions of the MVC model, and to deploy on Heroku I decided on postgreSQL rather than SQLite for the database.  To limit nominations to five, we just check the number of records in the databse.  Once there are five, the user cannot make more nominations until deleting one or more records.

I enjoyed the process of building this app, and I hope you have fun nominating some of your favorite movies for the Shoppies!
