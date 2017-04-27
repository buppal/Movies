//
//  MoviesTableViewCell.swift
//  Movies
//
//  Created by Banijyot Uppal on 4/21/17.
//  Copyright © 2017 Banijyot Uppal. All rights reserved.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {

    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!

    var viewModel: MoviesTableViewCellViewModel? {
        didSet {
            updateUIFromViewModel()
        }
    }

    // MARK: - Initializers

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Private functions

    private func updateUIFromViewModel() {
        guard let viewModel = viewModel else {
            fatalError("We should have a view model here.")
        }
        movieTitleLabel.text = viewModel.title
        movieRatingLabel.text = viewModel.voteAverage
        movieOverviewLabel.text = viewModel.overview
    }
}
