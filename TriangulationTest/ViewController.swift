//
//  ViewController.swift
//  TriangulationTest
//
//  Created by Martin on 08/02/2017.
//  Copyright © 2017 Martin. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    
    @IBOutlet weak var labelOne: UILabel!
    var C1:Double?,C2:Double?,C3:Double?
    let yMax:Double = 4.20
    let xMax:Double = 3.60
    let beaconManager = ESTBeaconManager()
    let locationManager = CLLocationManager()
    let beaconRegion = CLBeaconRegion(
        proximityUUID: UUID(uuidString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!,
        identifier: "ranged region")
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startMonitoring(for: beaconRegion)
        locationManager.startRangingBeacons(in: beaconRegion)
    }
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        for beacon in beacons {
            let key = "\(beacon.major):\(beacon.minor)"
            switch key {
            case "1:1":
                C1 = pow(10.0,((-58 - Double((beacon.rssi))) / (10.0 * 2.0)))
            case "1:2":
                C2 = pow(10.0,((-58 - Double((beacon.rssi))) / (10.0 * 2.0)))
            case "2:1":
                C3 = pow(10.0,((-58 - Double((beacon.rssi))) / (10.0 * 2.0)))
            default:
                break
            }
        }
        let point1 = Point(position: (xCoord: 0.0, yCoord: 0.0, zCoord: nil), distance: C1!)
        let point2 = Point(position: (xCoord: 0.0, yCoord: yMax, zCoord: nil), distance: C2!)
        let point3 = Point(position: (xCoord: xMax, yCoord: 0.0, zCoord: nil), distance: C3!)
        labelOne.text = String(describing:trilateration(point1: point1, point2: point2, point3: point3))
    }
}


