//
//  SmileTableViewCell.swift
//  movies
//
//  Created by Berat Rıdvan Asiltürk on 26.08.2022.
//

import UIKit

class SmileTableViewCell: UITableViewCell {

    @IBOutlet weak var smileImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
