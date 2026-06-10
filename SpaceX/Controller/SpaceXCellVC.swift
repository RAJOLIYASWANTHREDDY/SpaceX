//
//  SpaceXCellVC.swift
//  SpaceX
//
//  Created by yaswanth reddy on 5/28/26.
//

import UIKit

// MARK: - Protocol

//protocol SpaceXDataLoad{
//    func createData() -> [Spacex]
//}

var isInternetAvailable = false
var objNetworkManager: NetworkProtocol?

// MARK: - SpaceXCellVC

class SpaceXCellVC: UIViewController {
    
    @IBOutlet weak var spacexTable: UITableView!
    var spacexData1: [Spacex] = []
    var networkManager: NetworkProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spacexTable.dataSource = self
        spacexTable.delegate = self
        
        if isInternetAvailable {
            objNetworkManager = NetworkManager.sharedInstance
        } else {
            objNetworkManager = MockNetworkManager.sharedInstance
        }
        
        spacexData1 = objNetworkManager?.getDataFromServer(for: "www.nwt.com") ?? []
    }
}

// MARK: - UITableViewDataSource

extension SpaceXCellVC: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spacexData1.count
    }

    func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "SpaceXCell",for: indexPath) as! SpaceXCell
//        let spacex = spacexData1[indexPath.row]
        cell.loadRocketData(spacex: spacexData1[indexPath.row])
        return cell
    }
}


// MARK: - UITableViewDelegate

extension SpaceXCellVC: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let destination = self.storyboard?.instantiateViewController(
            withIdentifier: "DetailsVC") as? DetailsVC

        if let detailVC = destination {
            detailVC.title = spacexData1[indexPath.row].name
            detailVC.rocketData = spacexData1[indexPath.row]
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}

// MARK: - SpaceXDataLoad

//extension SpaceXCellVC: SpaceXDataLoad{
//    func createData() -> [Spacex] {
//        var spacexData: [Spacex] = []
//        let spacex1 = Spacex(
//                name: "Falcon 9",
//                date: "06-04-10",
//                price: "$67 million",
//                country: "United States",
//                firstFlight: "2010-06-04",
//                successRate: "99%",
//                rocketName: "Falcon 9",
//                mass: "1,207,920 lb",
//                description: "Falcon 9 is a reusable two-stage rocket designed and manufactured by SpaceX for reliable and safe transport of satellites and spacecraft into orbit.",
//                image: ["rocket head", "rocker launch"]
//            )
//
//            let spacex2 = Spacex(
//                name: "Falcon Heavy",
//                date: "02-06-18",
//                price: "$97 million",
//                country: "United States",
//                firstFlight: "2018-02-06",
//                successRate: "100%",
//                rocketName: "Falcon Heavy",
//                mass: "3,125,735 lb",
//                description: "With the ability to lift into orbit over 54 metric tons (119,000 lb), a mass equivalent to a 737 jetliner loaded with passengers, crew, luggage and fuel, Falcon Heavy can lift more than twice the payload of the next closest operational vehicle, the Delta IV Heavy, at one-third the cost.",
//                image: ["rocket launch", "rocker launch"]
//            )
//
//            let spacex3 = Spacex(
//                name: "Starship",
//                date: "04-20-23",
//                price: "$2 million estimated future launch cost",
//                country: "United States",
//                firstFlight: "2023-04-20",
//                successRate: "In development",
//                rocketName: "Starship",
//                mass: "11,000,000 lb",
//                description: "Starship is a fully reusable spacecraft and launch system designed by SpaceX for missions to Earth orbit, the Moon, Mars, and beyond.",
//                image: ["rocket head", "rocker launch"]
//            )
//
//            let spacex4 = Spacex(
//                name: "Dragon",
//                date: "12-08-10",
//                price: "$55 million",
//                country: "United States",
//                firstFlight: "2010-12-08",
//                successRate: "High",
//                rocketName: "Dragon",
//                mass: "13,228 lb",
//                description: "Dragon is a reusable spacecraft developed by SpaceX to deliver cargo to the International Space Station and return cargo back to Earth.",
//                image: ["rocket launch", "rocker launch"]
//            )
//
//            let spacex5 = Spacex(
//                name: "Crew Dragon",
//                date: "05-30-20",
//                price: "$55 million per seat estimated",
//                country: "United States",
//                firstFlight: "2020-05-30",
//                successRate: "High",
//                rocketName: "Crew Dragon",
//                mass: "26,577 lb",
//                description: "Crew Dragon is a reusable spacecraft designed by SpaceX to transport astronauts to the International Space Station and other destinations in orbit.",
//                image: ["rocket head", "rocker launch"]
//            )
//            spacexData.append(spacex1)
//            spacexData.append(spacex2)
//            spacexData.append(spacex3)
//            spacexData.append(spacex4)
//            spacexData.append(spacex5)
//        return spacexData
//            
//        }
//}


//extension SpaceXCell: NetworkProtocol{
//    func getDataFromServer(for url: String) -> [Spacex?] {
//        if isInternetAvailable {
//            objNetworkManager = NetworkManager.sharedInstance
//        }
//        else {
//            objNetworkManager = MockNetworkManager.sharedInstance
//        }
//        return objNetworkManager?.getDataFromServer(for: "www.nwt.com") ?? []
//    }
//    
//    
//}
 
