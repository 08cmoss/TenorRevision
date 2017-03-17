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
    @IBOutlet weak var favorite: UIImageView!
    
    var movie: Movie?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //self.navigationItem.leftBarButtonItem?.title = "Back"
        if let movie = movie {
        updateWith(movie: movie)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func favoritePressed(_ sender: Any) {
        
    }
    
    func updateWith(movie: Movie) {
        movieTitle.text = movie.name
        longDesc.text = movie.longDesc
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
