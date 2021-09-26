//
//  MoviesViewController.swift
//  SearchMovies
//
//  Created by Demas, Hana Belete on 9/21/21.
//

import UIKit

class MoviesViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var noResultsLabel: UILabel!
    @IBOutlet weak var moviesTableView: UITableView!
    let moviesTableViewReusableId = "MovieTableViewCell"
    
    private var moviesManager: MoviesManagerProtocol = MoviesListManager(session: URLSession.shared)
    var movies = [SearchMovie]()
    
    // MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviesTableView.register(UINib(nibName: moviesTableViewReusableId, bundle: Bundle.main), forCellReuseIdentifier: moviesTableViewReusableId)
        self.moviesTableView.rowHeight = UITableView.automaticDimension
        self.moviesTableView.estimatedRowHeight = 220
        self.moviesTableView.separatorColor = UIColor.oviaYellow()
        
        self.searchBar.placeholder = "Search Movies"
        
        self.moviesTableView.isHidden = true
        self.noResultsLabel.isHidden = true
        
        self.setupNavigation()
    }
    
    private func setupNavigation() {
        self.navigationController?.navigationBar.barTintColor =  UIColor.oviaYellow()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        self.title = "Search Movies"
    }
    
    public static func vc(moviesManager:MoviesManagerProtocol =  MoviesListManager(session: URLSession.shared)) ->  MoviesViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Movies") as! MoviesViewController
        vc.moviesManager = moviesManager
        return vc
    }
}

// MARK: UITableview data source and delegate implementation
extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.moviesTableViewReusableId, for: indexPath) as! MovieTableViewCell
        cell.update(movie: movies[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
}

// MARK: Searchbar delegate implementation
extension MoviesViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let text = searchBar.text ?? ""
        searchBar.resignFirstResponder()
        moviesManager.fetchMovies(searchTerm: text, successHandler: {(movies: Movies) in
            DispatchQueue.main.async {
                self.moviesTableView.isHidden = false
                self.movies = movies.search
                self.moviesTableView.reloadData()
                self.noResultsLabel.isHidden = true
            }
        }, errorHandler: { (error) in
            DispatchQueue.main.async {
                self.moviesTableView.isHidden = true
                self.noResultsLabel.isHidden = false
                self.noResultsLabel.text = "Movie not found"
            }
        })
    }
}

