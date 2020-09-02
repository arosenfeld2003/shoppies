# README

### Check It Out Live: [SHOPPIES!](https://powerful-plateau-02315.herokuapp.com/welcome/index/)

I created this web app for the Shopify Web Developer Intern Challenge.  Users can search the OMDB database for their favorite movies, and nominate up to five for a Shoppie award.

###### Process
The OMDB API allows for query by specific id/title, as well as a broader query by string matching each word in a title (returning the first ten results).  

For our purposes, the initial search is a string query, which allows the user to choose from a list of matching results. The view shows each movie title, and a button to nominate (if the film is not already nominated).  

When the user nominates a movie from the search results list, we make another OMDB API query by that specific title, which gives us more information to display on the nominations view.  The API key for querying OMDB is stored in an ENV variable (or a Config variable on Heroku).

Nominated films show the title, year, studio, awards, and a plot summary, all obtained from the OMDB title query.  The movie poster (if available) is displayed on the views for both types of query.

I decided to add a 'services' directory to the app, where I define a class 'imdb_service' to handle the API queries.  The service also includes error handling, which is additionally done in the Search controller. If there is an invalid request, we display the specific error code and a brief message.  If I were to continue working on this project, I would definitely consider creating a Ruby Gem to handle all aspects of the API query.

The nominations are stored in a database (postreSQL for Heroku deploy), using jsonb to store a hash (the result of the OMDB title query) on each nomination record.  The project specifices limiting nominations to five, which is verified simply by checking the number of records in the database.  Once there are five, the user cannot make more nominations until deleting one or more records.  A banner display alerts the user that nominations are closed, and the views do not offer an option to nominate another movie.

I enjoyed the process of building this app, and I hope you have fun nominating some of your favorite movies for the Shoppies!
