//
//  MovieTableViewCell.swift
//  SearchMovies
//
//  Created by Demas, Hana Belete on 9/24/21.
//

import UIKit
import Cosmos

class MovieTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.autoresizingMask = .flexibleHeight
        ratingView.settings.starMargin = 5
        ratingView.settings.updateOnTouch = false
        ratingView.settings.fillMode = .precise
    }
    
    func update(movie: SearchMovie) {
        titleLabel.text = movie.title
        titleLabel.textColor = UIColor.oviaGray()
        posterImageView.loadImageUsingCacheWithURLString(movie.poster, placeHolder: UIImage(named: "placholder"))
        ratingView.loadRatingWith(imdbID: movie.imdbID)
    }
}
