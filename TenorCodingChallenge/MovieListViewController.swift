//
//  MovieListViewController.swift
//  TenorCodingChallenge
//
//  Created by Cameron Moss on 3/17/17.
//  Copyright © 2017 Cameron Moss. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var segmentCtrl: UISegmentedControl!
    
    @IBOutlet weak var myTableView: UITableView!
    var userMovies = [Movie]()
    var criticMovies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.myTableView.contentInset = UIEdgeInsetsMake(-60, 0, 0, 0);
        if(segmentCtrl.selectedSegmentIndex == 0) {
            userMovies = MovieController.getUserMovies()
            //self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (segmentCtrl.selectedSegmentIndex == 0) {
            return userMovies.count
        } else {
            return criticMovies.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        
        // Configure the cell...
        if (segmentCtrl.selectedSegmentIndex == 0) {
            let movie = userMovies[indexPath.row]
//            cell.name.text = movie.name
//            cell.movieImage.downloadedFrom(link: movie.image)
//            cell.desc.text = movie.desc
            cell.updateWith(movie: movie)
            cell.delegate = self
        } else {
            let movie = criticMovies[indexPath.row]
//            cell.name.text = movie.name
//            cell.movieImage.downloadedFrom(link: movie.image)
//            cell.desc.text = movie.desc
            cell.updateWith(movie: movie)
            cell.delegate = self
        }
        
        return cell
    }
    
    @IBAction func segmentCtrlPressed(_ sender: Any) {
        if (segmentCtrl.selectedSegmentIndex == 0) {
            userMovies = MovieController.getUserMovies()
            self.myTableView.reloadData()
        } else {
            criticMovies = MovieController.getCriticMovies()
            self.myTableView.reloadData()
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showDetail" {
            let detailViewController = segue.destination as! DetailViewController
            if let cell = sender as? MovieTableViewCell, let indexPath = self.myTableView.indexPath(for: cell) {
                if (segmentCtrl.selectedSegmentIndex == 0) {
                    let movie = userMovies[indexPath.row]
                    detailViewController.movie = movie
                } else {
                    let movie = criticMovies[indexPath.row]
                    detailViewController.movie = movie
                }
            }
            
        }
        
    }
    

}

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}

extension MovieListViewController: MovieTableViewCellDelegate {
    
    func favoritePressed(sender: MovieTableViewCell) {
        let indexPath = self.myTableView.indexPath(for: sender)
        if (segmentCtrl.selectedSegmentIndex == 0) {
            var movie = userMovies[(indexPath?.row)!]
            //UserDefaults.standard.setValue(movie.favorite, forKey: "favorite")
            //movie.isFavorite = !movie.isFavorite
            //save to persistent storage
            //sender.updateButton(isFavorite: !movie.isFavorite)
            movie.isFavorite = !movie.isFavorite
            self.myTableView.reloadData()
        } else {
            var movie = criticMovies[(indexPath?.row)!]
            //movie.isFavorite = !movie.isFavorite
            //save to persistent storage
            //UserDefaults.standard.setValue(movie.favorite, forKey: "favorite")
            //movie.updateButton(isFavorite: !movie.isFavorite)
            movie.isFavorite = !movie.isFavorite
            self.myTableView.reloadData()
        }
    }
}
