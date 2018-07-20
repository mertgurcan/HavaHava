//
//  MainScreen.swift
//  HavaHava
//
//  Created by Mert Gürcan on 11.06.2018.
//  Copyright © 2018 Mert Gürcan. All rights reserved.
//

import UIKit
import CoreLocation

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
        
    }
    
    
        override var prefersStatusBarHidden: Bool{
            return true
        }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    // Screen width.
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    // Screen height.
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let firstWeatherCell = tableView.dequeueReusableCell(withIdentifier: "FirstWeatherCell") as! FirstWeatherCell
            return firstWeatherCell
        }
        else if indexPath.row == 1{
            let secondWeatherCell = tableView.dequeueReusableCell(withIdentifier: "SecondWeatherCell") as! SecondWeatherCell
            return secondWeatherCell
        }
        else if indexPath.row == 2{
            let thirdWeatherCell = tableView.dequeueReusableCell(withIdentifier: "ThirdWeatherCell") as! ThirdWeatherCell
            return thirdWeatherCell
        }
        else if indexPath.row == 3 {
            let fourthWeatherCell = tableView.dequeueReusableCell(withIdentifier: "FourthWeatherCell") as! FourthWeatherCell
            return fourthWeatherCell
        }
        
        let firstWeatherCell = tableView.dequeueReusableCell(withIdentifier: "FirstWeatherCell") as! FirstWeatherCell
        return firstWeatherCell
        
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
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
