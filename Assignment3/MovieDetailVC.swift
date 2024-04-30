//
//  MovieDetailVC.swift
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

class MovieDetailVC: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblIMDBId: UILabel!
    @IBOutlet weak var lblGenre: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
    //var movieIndexAt: Int?
    
    var selectedMovie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Adjust the label frame for top alignment
        //let sizeToFit = CGSize(width: lblDesc.frame.width, height: CGFloat.greatestFiniteMagnitude)
        //let expectedSize = lblDesc.sizeThatFits(sizeToFit)
        //lblDesc.frame.size = expectedSize
        lblDesc.frame = CGRect(x: lblDesc.frame.origin.x, y: lblDesc.frame.origin.y, width: 360, height: 95)
        lblDesc.textAlignment = .justified
        
        //print(self.movieIndexAt ?? 0)
        
        
        
        
        if let selectedMovie = selectedMovie {
                lblTitle.text = selectedMovie.title
                imgPoster.image = UIImage(named: selectedMovie.poster)
                lblYear.text = selectedMovie.year
                lblIMDBId.text = String(selectedMovie.imdbId)
                lblGenre.text = selectedMovie.genre
                lblType.text = selectedMovie.type
                lblDesc.text = selectedMovie.description
            }
        
    }
    

 

}
