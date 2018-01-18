//
//  ViewController.swift
//  QR-Swift
//
//  Created by Simon Persson on 2018-01-18.
//  Copyright © 2018 Simon Persson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var qrImageView: UIImageView!
    
    func generateQRCode() {
        // String to become QR code.
        let qrString = "Hello world!"
        
        let data = qrString.data(using: .ascii, allowLossyConversion: false)
        let filter = CIFilter(name: "CIQRCodeGenerator")
        filter?.setValue(data, forKey: "inputMessage")
        
        // Make QR code clearer.
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        
        let output = UIImage(ciImage: (filter?.outputImage)!.transformed(by: transform))
        
        // Assign QR code to UIImageView.
        qrImageView.image = output
    }

    override func viewDidLoad() {
        generateQRCode()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
