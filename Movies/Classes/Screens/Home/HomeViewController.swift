//
//  HomeViewController.swift
//  Movies
//
//  Created by Banijyot Uppal on 4/21/17.
//  Copyright © 2017 Banijyot Uppal. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    fileprivate let moviesTableViewCellIdentifier = "MoviesTableViewCell"
    let searchController = UISearchController(searchResultsController: nil)

    var viewModel: HomeViewModel? {
        didSet {

        }
    }

    private func setUpUI() {
        homeTableView.backgroundColor = UIColor.lightGray
        homeTableView.estimatedRowHeight = 100.0
        homeTableView.rowHeight = UITableViewAutomaticDimension
    }

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup the Search Controller
        searchController.searchBar.delegate = self
        definesPresentationContext = true
        searchController.dimsBackgroundDuringPresentation = false

        homeTableView.tableHeaderView = searchController.searchBar

        setUpUI()
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.moviesCellViewModelCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel else {
            return UITableViewCell()
        }
        let moviesCell = tableView.dequeueReusableCell(withIdentifier: moviesTableViewCellIdentifier) as! MoviesTableViewCell
        moviesCell.viewModel = viewModel.viewModelForCellAtIndex((indexPath as NSIndexPath).row)
        return moviesCell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else { return }

        let movieDetailsViewModel = viewModel.movieDetailsViewModel(row: indexPath.row)

        let movieDetailsViewController = Constants.mainStoryboard.instantiateViewController(withIdentifier: Constants.StoryboardIdentifiers.movieDetailsStoryboardIdentifier) as! MovieDetailsViewController
        self.navigationController?.pushViewController(movieDetailsViewController, animated: true)
        movieDetailsViewController.loadViewIfNeeded()
        movieDetailsViewController.viewModel = movieDetailsViewModel
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let queryText = searchBar.text else {
            return
        }
        viewModel?.didSearchForMovie(query: queryText)
    }
}

extension HomeViewController: HomeViewControllerPresenter {
    func presentTableViewUpdates() {
        homeTableView.reloadData()
    }

}
