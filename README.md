# iOS Movie Database Application

This is a movie database application I created to practice local application database management using CoreData.

The app also showcases search bar, swipe functionality and alert popups.

## Features

This app includes the following features:

### Welcome Screen 

A simple yet effective welcome screen that welcomes users to the app.

<p align="center">
  <img src="/screenshots/WelcomeScreen.png" alt="Welcome Screen" style="width:25%;">
</p>

### Main Screen

- **Functionality**: A table view for displaying movie title, year, and poster.
- **Add a Movie**: A "+" button for adding new movies.

<p align="center">
  <img src="/screenshots/FilmListing.png" alt="Film Listing" style="width:25%;">
</p>

- **Search**: A search bar for filtering the list of movies.

<p align="center">
  <img src="/screenshots/SearchFilm.png" alt="Search Film" style="width:25%;">
</p>


### Add a Movie to the Database

- **Functionality**: Provide a form in a new screen or an alert for adding a new movie. This form should collect details like the movie's title, year, imdblD, type, and poster.

<p align="center">
  <img src="/screenshots/AddFilm.png" alt="Add Film" style="width:25%;">
</p>

- **Result**: On submission, create a new Movie object and add it to the local data source.

<p align="center">
  <img src="/screenshots/NewFilmDescription.png" alt="New Film Description" style="width:25%;">
</p>

### Deleting Movies

- **Functionality**: Implement swipe-to-delete functionality in the table view, allowing users to swipe on a movie cell to reveal a delete option.
- **Result**: When the user confirms deletion, remove the Movie object from the local data source and update the table view.

https://github.com/rmondev/iOS-Movie-Database-Application/assets/85075744/36587d49-2b4a-4086-a300-32e5b686eda4

### View Movie Details

- **Functionality**: When a user selects a movie from the table view, navigate to the movie details screen.
- **Result**:Display the selected movie's details on this screen like the movie's title, year, imdblD, type, and poster.

<p align="center">
  <img src="/screenshots/FilmDescription.png" alt="Film Description" style="width:25%;">
</p>


## App Demo Video

See the app in action with this demonstration video:

https://github.com/rmondev/iOS-Movie-Database-Application/assets/85075744/37cc9598-c676-443f-97d5-4f937086d9f4


