//
//  Movie.swift
//  Assignment3
//
//  Created by Riccardo Moncada on 2023-11-08.
//
//
//  Student ID: 129698213
//  Title: Assignment 3
//  Date: Thursday November 16, 2023
//  Course: MAP253 NSA
//  Instructor: Rohit Gaur

import Foundation

class Movie {
    let title: String
    let year: String
    let imdbId: String
    let poster: String
    let description: String
    let genre: String
    let type: String
    
    init(title: String, year: String, imdbId: String, poster: String, description: String, genre: String, type: String) {
        self.title = title
        self.year = year
        self.imdbId = imdbId
        self.poster = poster
        self.description = description
        self.genre = genre
        self.type = type
    }
    
    func toStringMovie() -> String{
        var movieStr: String
        
        movieStr = "Title: \(self.title)" + "\n" +
                    "Year: \(self.year)" + "\n" +
                    "IMDB ID: \(self.imdbId)" + "\n" +
                    "Poster: \(self.poster)" + "\n" +
                    "Description: \(self.description)" + "\n" +
                    "Genre: \(self.genre)" + "\n" +
                    "Type: \(self.type)" + "\n"
        return movieStr
    }
}

extension Movie: Equatable {
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.imdbId == rhs.imdbId // imdbId is a unique identifier for movies
    }
}


