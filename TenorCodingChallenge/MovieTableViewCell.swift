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
    @IBOutlet weak var favoriteBtn: UIButton!
    
    var delegate: MovieTableViewCellDelegate?

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
        if let delegate = delegate {
            delegate.favoritePressed(sender: self)
        }
    }
    
    func updateButton(isFavorite: Bool) {
        if isFavorite {
            favoriteBtn.setImage(UIImage(named: "heart_filled_outline"), for: .normal)
        } else {
            favoriteBtn.setImage(UIImage(named: "heartUnfilled"), for: .normal)
        }
    }

}

protocol MovieTableViewCellDelegate {
    
    func favoritePressed(sender: MovieTableViewCell)
    
}

extension MovieTableViewCell {
    
    func updateWith(movie: Movie) {
        name.text = movie.name
        movieImage.downloadedFrom(link: movie.image)
        desc.text = movie.desc
        updateButton(isFavorite: movie.isFavorite)
    }
    
}
