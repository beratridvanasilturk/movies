//
//  SmileViewController.swift
//  movies
//
//  Created by Berat Rıdvan Asiltürk on 26.08.2022.
//

import UIKit

class SmileViewController: UIViewController {

    @IBOutlet weak var smileUiTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

    smileUiTableView.delegate = self
    smileUiTableView.dataSource = self

    }
}

extension SmileViewController: UITableViewDelegate {

}

extension SmileViewController: UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 22
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "smileCell", for: indexPath)
        return cell
    }
}
