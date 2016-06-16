//
//  MovieTableViewController.swift
//  MovieAppSwift
//
//  Created by don't touch me on 6/15/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {

    typealias JSONDictionary = [String:AnyObject]
    typealias JSONArray = [JSONDictionary]
    var moviesArray = [Movie]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let filePath = NSBundle.mainBundle().URLForResource("popular", withExtension: "json") {
            
            if let data = NSData(contentsOfURL: filePath) {
                
                do {
                    if let jsonDict = try
                        NSJSONSerialization.JSONObjectWithData(data, options: []) as?
                        JSONDictionary {
                        
                        
                        print(jsonDict)
                        
                        if let resultsArray = jsonDict["results"] as? JSONArray {
                            
                            for dict in resultsArray {
                                
                                
                                let theMovie = Movie()
                                
                                if let posterPath = dict["poster_path"] as? String {
                                    theMovie.posterPath = posterPath
                                } else {
                                    print("Could not parse the poster path")
                                }
                                
                                if let adult = dict["adult"] as? Bool {
                                    theMovie.adult = adult
                                } else {
                                    print("Could not parse the adult")
                                }
                                
                                if let overview = dict["overview"] as? String {
                                    theMovie.overview = overview
                                } else {
                                    print("Could not parse overview string")
                                }
                                
                                if let releaseDate = dict["releaseDate"] as? String {
                                    theMovie.releaseDate = releaseDate
                                } else {
                                    print("Could not parse the releaseDate")
                                }
                                
                                if let muviId = dict["muviId"] as? NSInteger {
                                    theMovie.muviId = muviId
                                } else {
                                    print("Could not parse muviId string")
                                }
                                
                                if let originalTitle = dict["originalTitle"] as? String {
                                    theMovie.originalTitle = originalTitle
                                } else {
                                    print("Could not parse the originalTitle")
                                }
                                
                                if let originalLanguage = dict["originalLanguage"] as? String {
                                    theMovie.originalLanguage = originalLanguage
                                } else {
                                    print("Could not parse originalLanguage string")
                                }
                                
                                if let title = dict["original_title"] as? String {
                                    theMovie.title = title
                                } else {
                                    print("Could not parse title string")
                                }
                                
                                if let backdropPath = dict["backdropPath"] as? String {
                                    theMovie.backdropPath = backdropPath
                                } else {
                                    print("Could not parse title string")
                                }
                                
                                if let popularity = dict["popularity"] as? Double {
                                    theMovie.popularity = popularity
                                } else {
                                    print("Could not parse the popularity")
                                }
                                
                                if let voteCount = dict["voteCount"] as? NSInteger {
                                    theMovie.voteCount = voteCount
                                } else {
                                    print("Could not parse voteCount string")
                                }
                                
                                if let video = dict["video"] as? Bool {
                                    theMovie.video = video
                                } else {
                                    print("Could not parse the video")
                                }
                                
                                if let voteAverage = dict["voteAverage"] as? Double {
                                    theMovie.voteAverage = voteAverage
                                } else {
                                    print("Could not parse the poster path")
                                }
                                
                                moviesArray.append(theMovie)
                            }
                        }
                    }
                } catch {
                    print("Something went wrong parsing the data")
                }
            }
            
            for theMovie in moviesArray {
                print(theMovie.title)
            }
        }
        
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
       
        return 13
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.moviesArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! PosterViewController
        
        let movie = moviesArray[indexPath.row]
        
        cell.titleLabel.text = movie.name
        
        cell.posterView.image = UIImage(named: movie.imageName)


        return cell
    }
 
 
 
 
}
