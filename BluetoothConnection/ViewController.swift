//
//  ViewController.swift
//  BluetoothConnection
//
//  Created by Ramill Ibragimov on 16.05.2021.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, CBCentralManagerDelegate, CBPeripheralDelegate {

    var manager: CBCentralManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        
        print("NAME: \(String(describing: peripheral.name))")
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        
        var msg = ""
        switch (central.state) {
        case .poweredOff:
            msg = "BT off"
        case .poweredOn:
            msg = "BT on"
            manager.scanForPeripherals(withServices: nil, options: nil)
        case .unsupported:
            msg = "BT unsupported"
        default:
            break
        }
        print("STATE: \(msg)")
    }

}

