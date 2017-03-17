//
//  MovieTableViewCell.swift
//  TenorCodingChallenge
//
//  Created by Cameron Moss on 3/16/17.
//  Copyright © 2017 Cameron Moss. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var desc: UITextView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func favoritePressed(_ sender: Any) {
        print("favorite has been pressed")
    }

}
