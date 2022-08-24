//
//  FilmsViewController.swift
//  movies
//
//  Created by Berat Rıdvan Asiltürk on 24.08.2022.
//

import UIKit
import Kingfisher

class FilmsViewController: UIViewController {

    @IBOutlet weak var filmsTableView: UITableView!

    let films = [
        "https://i.pinimg.com/736x/6c/e6/7f/6ce67f7b4fe02b66dc06187ed658000f--serena--bradley-cooper.jpg",
        "https://www.hdmekani.com/rsm/images/56308041452025876161.jpg",
        "https://tr.web.img2.acsta.net/medias/nmedia/18/89/83/45/20175397.jpg",
        "https://cdn-0.tvprofil.com/img/covers/img266041-tv2457493.jpg",
        "https://pbs.twimg.com/media/CMX5xkRWgAAEggJ.png:large"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filmsTableView.delegate = self
        filmsTableView.dataSource = self
        
    }
    
}

extension FilmsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}

extension FilmsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmsCell", for: indexPath) as! FilmTableViewCell
        
        let url = URL(string: films[indexPath.row])!
        cell.filmImageView?.kf.setImage(with: url)
        
        return cell
    }
}
