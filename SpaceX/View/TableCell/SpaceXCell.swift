//
//  SpaceXCell.swift
//  SpaceX
//
//  Created by yaswanth reddy on 5/28/26.
//

import UIKit

class SpaceXCell: UITableViewCell {

    @IBOutlet weak var rocketImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var about: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //MARK: - Load the Rocket Data to Cell
    func loadRocketData(spacex: Spacex){
        name.text = spacex.name
        date.text = spacex.date
        price.text = spacex.price
        about.text = spacex.country
        rocketImage.image = UIImage(named: spacex.image.first ?? "logo")
    }

}
