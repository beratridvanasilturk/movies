//
//  FilmsViewController.swift
//  movies
//
//  Created by Berat Rıdvan Asiltürk on 24.08.2022.
//

import UIKit

class FilmsViewController: UIViewController {

    @IBOutlet weak var filmsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filmsTableView.delegate = self
        filmsTableView.dataSource = self
        
    }
    
}

extension FilmsViewController: UITableViewDelegate {
    
}

extension FilmsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmsCell", for: indexPath) as! FilmTableViewCell
        
        
        let imageName = ["a","b","c","d","e","f","g","h","j","theGodfather"].randomElement() ?? ""
        
        cell.filmImageView?.image = UIImage(named: imageName)
        
        
        return cell
    }
    
    
}
