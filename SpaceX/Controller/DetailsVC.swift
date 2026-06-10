//
//  DetailsVC.swift
//  SpaceX
//
//  Created by yaswanth reddy on 5/29/26.
//

import UIKit

class DetailsVC: UIViewController {
// MARK: - Mapping labels
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var firstFlight: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var sucessRate: UILabel!
    @IBOutlet weak var rocketName: UILabel!
    @IBOutlet weak var mass: UILabel!
    @IBOutlet weak var about: UILabel!
    var rocketData: Spacex?
    override func viewDidLoad() {
        super.viewDidLoad()
        loadRocketData()
    }
    
// MARK: - Load Rocket Data
    func loadRocketData(){
        guard let launchData = rocketData else{
            return
        }
        firstFlight.text = "Frist Flight: \(launchData.firstFlight)"
        image.image = UIImage(named: launchData.image.first ?? "logo")
        country.text = "Country: \(launchData.country)"
        sucessRate.text = "Success Rate: \(launchData.successRate)"
        rocketName.text = "RocketNmae: \(launchData.rocketName)"
        mass.text =  "Mass: \(launchData.mass)"
        about.text = "Description: \(launchData.description)"
        
    }

}
