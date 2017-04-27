//
//  MovieDetailsViewController.swift
//  Movies
//
//  Created by Banijyot Uppal on 4/21/17.
//  Copyright © 2017 Banijyot Uppal. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var overviewTextView: UITextView!

    var viewModel: MovieDetailsViewModel? {
        didSet {
            updateUIFromViewModel()
        }
    }

    // MARK : - Private functions

    private func updateUIFromViewModel() {
        guard let viewModel = viewModel else {
            fatalError("We should have a view model here.")
        }
        overviewTextView.text = viewModel.overviewText
        navigationItem.title = viewModel.navigationTitleText
    }

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
