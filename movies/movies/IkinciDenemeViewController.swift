//
//  IkinciDenemeViewController.swift
//  movies
//
//  Created by Berat Rıdvan Asiltürk on 24.08.2022.
//

import UIKit

class IkinciDenemeViewController: UIViewController {

    @IBOutlet weak var ikinciDeneme: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        ikinciDeneme.dataSource = self
        ikinciDeneme.delegate = self
    }
    

}
extension IkinciDenemeViewController: UITableViewDelegate {
    
}
extension IkinciDenemeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ikinciDenemeCell", for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
}
