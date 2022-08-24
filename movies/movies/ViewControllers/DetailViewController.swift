//
//  DetailViewController.swift
//  movies
//
//  Created by Berat Rıdvan Asiltürk on 24.08.2022.
//

import Alamofire
import UIKit

class DetailViewController: UIViewController {

    var detailResponse: DetailResponse?
    var filmId: Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        requestDetail()
    }
    func requestDetail()  {
        
        guard let filmId = filmId else { return }
        let urlString = "https://api.themoviedb.org/3/movie/\(filmId)?api_key=a3c90b475ef6ac1fdf131cd30dda85f0&language=en-US"
        let url = URL(string: urlString)
        AF.request(url!, method: .get).response { result in
            guard let data = result.data else { return }
            let jsonDecoder = JSONDecoder()
            self.detailResponse = try? jsonDecoder.decode(DetailResponse.self, from: data)
            self.prepareUI()
        }
    }
    
    func prepareUI() {
        print(detailResponse)
    }
}
