//
//  DenemeViewController.swift
//  movies
//
//  Created by Berat Rıdvan Asiltürk on 24.08.2022.
//

import UIKit

class DenemeViewController: UIViewController {

    @IBOutlet weak var denemeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        denemeTableView.delegate = self
        denemeTableView.dataSource = self

    }
    
}

extension DenemeViewController: UITableViewDelegate {

}
extension DenemeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "denemeCell", for: indexPath)
        return cell
    }
}
