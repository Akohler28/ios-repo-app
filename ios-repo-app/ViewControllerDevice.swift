//
//  ViewControllerDevice.swift
//  ios-repo-app
//
//  Created by Student Account on 10/7/19.
//  Copyright © 2019 Cascadia College. All rights reserved.
//

import UIKit

class ViewControllerDevice: UIViewController{
    
    @IBOutlet weak var deviceNum: UITextField!
    @IBOutlet weak var deviceType: UITextField!
    @IBOutlet weak var resultInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveToAPI(_ sender: Any) {
        //TODO: create a Repository object needed to invoke the API's create method
        let deviceRepo = Repository<Device>(withPath: "http://216.186.69.45/services/device/devices/")
        
        let newDevice = Device()
        newDevice.DeviceNum = deviceNum.text
        newDevice.DeviceType = deviceType.text.map { DeviceType(rawValue: $0) ?? DeviceType.iPad }
        
        deviceRepo.create(a: newDevice)  { (device) in
            if let id = device?.DeviceID, let num = device?.DeviceNum, let type = device?.DeviceType {
                self.resultInfo.text = "Successfully create device \(type) \(num) with id \(id)"
            }
        }
    }
    
    
}
