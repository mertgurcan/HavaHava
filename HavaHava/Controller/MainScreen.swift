//
//  MainScreen.swift
//  HavaHava
//
//  Created by Mert Gürcan on 11.06.2018.
//  Copyright © 2018 Mert Gürcan. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class MainScreen: UIViewController , UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
       
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    // MARK: - Screen
    // Screen width.
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    // Screen height.
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    // MARK: - Tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let firstWeatherCell = tableView.dequeueReusableCell(withIdentifier: "FirstWeatherCell")
            return firstWeatherCell!
        }
        else if indexPath.row == 1{
            let secondWeatherCell = tableView.dequeueReusableCell(withIdentifier: "SecondWeatherCell") 
            return secondWeatherCell!
        }
        else if indexPath.row == 2{
            let thirdWeatherCell = tableView.dequeueReusableCell(withIdentifier: "ThirdWeatherCell")
            return thirdWeatherCell!
        }
        else if indexPath.row == 3 {
            let fourthWeatherCell = tableView.dequeueReusableCell(withIdentifier: "FourthWeatherCell")
            return fourthWeatherCell!
        }
        
        let firstWeatherCell = tableView.dequeueReusableCell(withIdentifier: "FirstWeatherCell")
        return firstWeatherCell!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if indexPath.row == 0{
                return screenHeight*0.85
            }
            else if indexPath.row == 1{
                return screenHeight*0.25
            }
            else if indexPath.row == 2{
                return screenHeight*0.25
            }
            else if indexPath.row == 3{
                return screenHeight*0.6
            }
        return 10
    }

    // MARK: - Location
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
     
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
        }
        
        getWeather(lat: String(location.coordinate.latitude), lon: String(location.coordinate.longitude))
        
    }
    
    // MARK: - Weather
   
   
    func getWeather(lat: String, lon: String){
        
        let url_string = Connections.init().WEATHER_URL + "\(Connections.init().WEATHER_APP_ID)/\(lat),\(lon)"
        
        Alamofire.request(url_string, method: .get).responseJSON{
            response in
            if response.result.isSuccess{
                let weatherResult: JSON = JSON(response.result.value!)
                
                Alamofire.request(Connections.init().LOC_URL + "q=\(lat)+\(lon)&key=\(Connections.init().LOC_APP_ID)").responseJSON{
                    response in
                    if response.result.isSuccess{
                        let locResult: JSON = JSON(response.result.value!)
                        print(locResult)
                        print(weatherResult)
                    }
                    else{
                        print("Error \(String(describing: response.result.error)) occured")
                    }
                }
            }
            else{
                print("Error \(String(describing: response.result.error)) occured")
            }
        }
        
        
    }
    
    // MARK: - 
}
