//
//  MainScreenVC.swift
//  Assignment3
//
//  Created by Riccardo Moncada on 2023-11-09.
//
//
//  Student ID: 129698213
//  Title: Assignment 3
//  Date: Thursday November 16, 2023
//  Course: MAP253 NSA
//  Instructor: Rohit Gaur

import UIKit

class MainScreenVC: UIViewController {

    @IBOutlet weak var movieTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var filteredMovies: [Movie] = movies
    
    override func viewDidLoad() {
        super.viewDidLoad()

        movieTableView.dataSource = self
        movieTableView.delegate = self
        searchBar.delegate = self
        
    }
    
// MARK: Add a new movie form as alert controller
    
    @IBAction func addMovie(_ sender: Any) {
        let alertController = UIAlertController(
            title: "Add a New Movie ",
            message: nil,
            preferredStyle: .alert)
        
        // add alert form textfields
        alertController.addTextField { textField in textField.placeholder = "Title"}
        alertController.addTextField { textField in textField.placeholder = "Year"}
        alertController.addTextField { textField in textField.placeholder = "IMDB ID"}
        alertController.addTextField { textField in textField.placeholder = "Genre"}
        alertController.addTextField { textField in textField.placeholder = "Type"}
        alertController.addTextField { textField in textField.placeholder = "Description"}
        alertController.addTextField { textField in textField.placeholder = "Poster"}
        
        // add an action to the alert controller
        let submitAction = UIAlertAction(
            title: "Add Movie",
            style: .default) { _ in
            
            // Access the textfields and perform actions
            if let txtTitle = alertController.textFields?[0].text,
               let txtYear = alertController.textFields?[1].text,
               let txtImdbId = alertController.textFields?[2].text,
               let txtGenre = alertController.textFields?[3].text,
               let txtType = alertController.textFields?[4].text,
               let txtDesc = alertController.textFields?[5].text,
               let poster = alertController.textFields?[6].text
            {
                // Create new movie object
                // Append to movies array
                // Reload movie table data
                let newMovie = Movie(
                    title: txtTitle,
                    year: txtYear,
                    imdbId: txtImdbId,
                    poster: poster,
                    description: txtDesc,
                    genre: txtGenre,
                    type: txtType)

                movies.append(newMovie)
                self.filteredMovies = movies
                self.movieTableView.reloadData()
                alertController.dismiss(animated: true, completion: nil)
            }
        }
        
        alertController.addAction(submitAction)
        
        // Add a cancel action
        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: .cancel,
            handler: nil
        )
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

// MARK: Populate tableview and cell with movie info

extension MainScreenVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieTitleCell", for: indexPath) as! MovieTVCell
        
        let movie = self.filteredMovies[indexPath.row]
        
        cell.movieTitle.text = movie.title
        cell.movieYear.text = movie.year
        cell.moviePoster.image = UIImage(named: movie.poster)
        cell.movieGenre.text = movie.genre
        cell.movieType.text = movie.type

        return cell
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredMovies.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

// MARK: Row selection presents corresponding movie detail screen
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailScreen = self.storyboard?.instantiateViewController(withIdentifier: "movieDetailVC") as? MovieDetailVC else {
            print("Could not find screen")
            return
        }
        
        detailScreen.selectedMovie = filteredMovies[indexPath.row]
        
        self.present(detailScreen, animated: true)
 
    }
    
// MARK: Swipe on cell configuration (add info and delete buttons and corresponding actions)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    
        let deleteAction = UIContextualAction(
            style: .destructive,
            title: "",
            handler: {(_, _, success:(Bool) -> Void) in
            self.showDeleteConfirmationAlert(forItemAt: indexPath, tableView: tableView)
            success(true)
        })
        
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = .systemRed
        
        let infoAction = UIContextualAction(
            style: .normal,
            title: "",
            handler: {(_, _, success:(Bool) -> Void) in
            
            // Info button selection presents corresponding movie detail screen
            guard let detailScreen = self.storyboard?.instantiateViewController(withIdentifier: "movieDetailVC") as? MovieDetailVC else {
                print("Could not find screen")
                return
            }
        
                detailScreen.selectedMovie = self.filteredMovies[indexPath.row]
        
            self.present(detailScreen, animated: true)
            success(true)
        })
        
        infoAction.image = UIImage(systemName:"info.circle")
        infoAction.backgroundColor = .systemBlue
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, infoAction])
        swipeConfiguration.performsFirstActionWithFullSwipe = false
        
        return swipeConfiguration
        }
    
// MARK: Delete confirmation from swipe delete selection
    func showDeleteConfirmationAlert(forItemAt indexPath: IndexPath, tableView: UITableView){
        let alertController = UIAlertController(
            title: "Delete Movie",
            message: "Are you sure you want to delete this movie from the database?",
            preferredStyle: .alert
        )
        
        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: .cancel,
            handler: nil
            )
        alertController.addAction(cancelAction)
            

        let deleteAction = UIAlertAction(
            title: "Delete",
            style: .destructive
        )
        { _ in
            print(indexPath.row)
            
            let row = indexPath.row
            let deletedMovie = self.filteredMovies[row] // Get the movie to be deleted
            
            if let indexInMovies = movies.firstIndex(of: deletedMovie) {
                movies.remove(at: indexInMovies) // Remove from the main array
            }
            
            self.filteredMovies.remove(at: row)  // Remove from filteredMovies directly
            self.movieTableView.reloadData()
        }
        alertController.addAction(deleteAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
}

// MARK: Search Bar Configuration

extension MainScreenVC: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredMovies = []
        if searchText == ""{
            filteredMovies = movies
        } else {
            for movie in movies{
                if movie.title.lowercased().contains(searchText.lowercased()){
                    filteredMovies.append(movie)
                }
            }
        }
        self.movieTableView.reloadData()
    }
}


