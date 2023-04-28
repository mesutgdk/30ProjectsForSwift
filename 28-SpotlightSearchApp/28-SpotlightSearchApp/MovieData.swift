//
//  MovieData.swift
//  28-SpotlightSearchApp
//
//  Created by Mesut Gedik on 27.04.2023.
//

import Foundation

struct Movie {
    var imageName : String
    var movieTitle : String
    var movieType : String
    var movieDescription : String
    var movieDirector : String
    var movieRating : String
    var movieStars : String
    }

class MovieData {
    var movieFile: [Movie] = [
        Movie(imageName: "django", movieTitle: "The Django", movieType: "Drama  Western", movieDescription: "Django is a freed slave who assists a German bounty humter. Im return for his aid, the Bounty Hunter will help Django get revernge on the cruel Plantation owner in Mississippi, who has kidnapped his wife.", movieDirector: "Quentin Tarantino", movieRating: "8.4", movieStars: "Jamie Foxx  Christoph Walth  Leonardo DiCaprio"),
        Movie(imageName: "dunkirk", movieTitle: "Dunkirk", movieType: "Action  Drama  History", movieDescription: "Allied soldiers from Belgium, the British Commonwealth and Empire, and France are surrounded by the Germaan Army and evacuated during a fierce battle in WWII", movieDirector: "Christopher Nolan", movieRating: "7.8", movieStars: "Fionn Whitehead  Barry Keoghan  Mark Rylance"),
        Movie(imageName: "inception", movieTitle: "Inception", movieType: "Action  Adventure  Sci-Fi", movieDescription: "A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of plating an idea into the mind of a C.E.O, but his tragic past may doom the project and his team to disaster.", movieDirector: "Christopher Nolan", movieRating: "8.8", movieStars: "Leonardo DiCaprio  Joseph Gordo-Levitt  Elliot Page"),
        Movie(imageName: "interstellar", movieTitle: "Interstellar", movieType: "Advanture  Drama  Sci-Fi", movieDescription: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.", movieDirector: "Christopher Nolan", movieRating: "8.6", movieStars: "Matthew McConaughey  Anne Hathaway  Jessica Chastain"),
        Movie(imageName: "joker", movieTitle: "Joker", movieType: "Chrime  Drama  Thriller", movieDescription: "The rise of Arthur Fleck, from aspiring stand-up comedian and pariah to Gotham's clown prince and leader of the revulation.", movieDirector: "Todd Philips", movieRating: "8.4", movieStars: "Joaquin Phoenix  Robert De Niro  Zazie Beetz"),
        Movie(imageName: "matrix", movieTitle: "Matrix", movieType: "Action  Sci-Fi", movieDescription: "When a beautiful stranger leads computer hacker Neo to a forbidding underworld, he discovers the scocking truth-the life he knows is the elaborate deception of an evil cyber-intelligence", movieDirector: "Lana Wachowski  Lilly Wachowcki", movieRating: "8.7", movieStars: "Keanu Reeves  Laurence Fishburne  Carrie-Anne Moss"),
        Movie(imageName: "prestij", movieTitle: "The Prestige", movieType: "Drama  Mystery  Sci-Fi", movieDescription: "After a tagic accident, two stage magicians in 1890s London engage in a battle to create the ultimate illusion while ascrificing everything they have to outwit each other.", movieDirector: "Christopher Nolan", movieRating: "8.5", movieStars: "Christian Bale  Hugh Jackman  Scarlett Johansson")
        
    ]
}
