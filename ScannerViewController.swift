//
//  ScannerViewController.swift
//  ClothesList
//
//  Created by Ladislav Szolik on 09.09.17.
//  Copyright © 2017 Ladislav Szolik. All rights reserved.
//

import UIKit
import AVFoundation

class ScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
   
    var video = AVCaptureVideoPreviewLayer()
    
    var qrcode:String?
    
    var session:AVCaptureSession!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        //Creating session
        self.session = AVCaptureSession()
        
        //Define capture devcie
        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        do
        {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            session.addInput(input)
        }
        catch
        {
            print ("ERROR")
        }
        
        let output = AVCaptureMetadataOutput()
        self.session.addOutput(output)
        
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        
        output.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
        
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = view.layer.bounds
        view.layer.addSublayer(video)
        
        self.session.startRunning()
    }
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        
        if metadataObjects != nil && metadataObjects.count != 0
        {
            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject
            {
                if object.type == AVMetadataObjectTypeQRCode
                {
                    qrcode = object.stringValue
                    
                    self.performSegue(withIdentifier: "unwindToNewClothes", sender: self)
                    
                }
            }
        }
        session.stopRunning()
    }

   

    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        
        //Here I need to create the new clothes
    }
    
}
