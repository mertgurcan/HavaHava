//
//  WeatherDataModel.swift
//  HavaHava
//
//  Created by Mert Gürcan on 23.07.2018.
//  Copyright © 2018 Mert Gürcan. All rights reserved.
//

import Foundation
import UIKit

class WeatherDataModel {

    var temperature : Int = 0
    var city : String = ""
    var hourly = [[String]](repeating: [], count: 4)
    var humidity : Int = 0
    var wind : Int = 0
    var daily = [[String]](repeating: [], count: 5)
    

}
