//
//  DetailViewController.swift
//  TenorCodingChallenge
//
//  Created by Cameron Moss on 3/16/17.
//  Copyright © 2017 Cameron Moss. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var longDesc: UITextView!
    @IBOutlet weak var favoriteBtn: UIButton!
    
    var movie: Movie?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let movie = movie {
        updateWith(movie: movie)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func favoritePressed(_ sender: Any) {
        print("detail favorite pressed")
        //change tableview heart as well
        
        
    }
    
    func updateWith(movie: Movie) {
        movieTitle.text = movie.name
        longDesc.text = movie.longDesc
        if (movie.isFavorite) {
            favoriteBtn.setImage(UIImage(named: "heart_filled_outline"), for: .normal)
        } else {
            favoriteBtn.setImage(UIImage(named: "heartUnfilled"), for: .normal)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

