//
//  FilmsViewController.swift
//  movies
//
//  Created by Berat Rıdvan Asiltürk on 24.08.2022.
//

import Alamofire
import UIKit
import Kingfisher

class FilmsViewController: UIViewController {

    @IBOutlet weak var filmsTableView: UITableView!

    var response: Response?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filmsTableView.delegate = self
        filmsTableView.dataSource = self
        
        requestFilmList()
        
    }
    
    func requestFilmList() {
        
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=a3c90b475ef6ac1fdf131cd30dda85f0"
        let url = URL(string: urlString)!
        
        AF.request(url, method: .get).response { result in
            guard let data = result.data else { return }
            let jsonDecoder = JSONDecoder()
            self.response = try? jsonDecoder.decode(Response.self, from: data)
            print(self.response)
            self.filmsTableView.reloadData()
        }
    }
    
}

extension FilmsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = response?.results?[indexPath.row]
        let selectedId = selectedItem?.id
        let destination = DetailViewController()
        destination.filmId = selectedId
        show(destination, sender: nil)
        
        print(selectedId)
    }
}

extension FilmsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return response?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmsCell", for: indexPath) as! FilmTableViewCell
        let model = response?.results?[indexPath.row]
        let urlString = "https://image.tmdb.org/t/p/w500/\(model?.backdrop_path ?? "")"
        let url = URL(string: urlString)!
        cell.filmImageView?.kf.setImage(with: url)
        
        cell.descriptionLabel?.text = model?.overview
        cell.titleLabel?.text = model?.title
        cell.imdbLabel?.text = "\(model?.vote_average ?? 0 )"
        
        return cell
    }
}
