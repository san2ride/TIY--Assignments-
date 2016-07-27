//
//  PosterViewController.swift
//  MovieAppSwift
//
//  Created by don't touch me on 6/15/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

class PosterViewController: UIViewController {
    
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var theMovie: Movie?
    

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let muv = self.theMovie {
            self.titleLabel?.text = muv.title
            self.posterView?.image = UIImage(named: muv.posterPath)
        }
        
        
    }

       
        
    }

