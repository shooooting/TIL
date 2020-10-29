//
//  ViewController.swift
//  QRCode
//
//  Created by ㅇ오ㅇ on 2020/10/29.
//

import UIKit
import WebKit
import AVFoundation
import QRCodeReader

class MainViewController: UIViewController, QRCodeReaderViewControllerDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var qrCodeButton: UIButton!
    
    // QR코드리더 뷰컨을 만든다.
    // Good practice: create the reader lazily to avoid cpu overload during the
    // initialization and each time we need to scan a QRCode
    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
            
            // Configure the view controller (optional)
            $0.showTorchButton        = false
            $0.showSwitchCameraButton = false
            $0.showCancelButton       = false
            $0.showOverlayView        = true
            $0.rectOfInterest         = CGRect(x: 0.2, y: 0.2, width: 0.6, height: 0.6)
        }
        
        return QRCodeReaderViewController(builder: builder)
    }()
    
    // MARK: - override method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.naver.com")
        let requestObj = URLRequest(url: url!)
        webView.load(requestObj)
        
        qrCodeButton.layer.borderWidth = 1
        qrCodeButton.layer.borderColor = UIColor.blue.cgColor
        qrCodeButton.layer.cornerRadius = 10
        
        qrCodeButton.addTarget(self, action: #selector(qrCodeLaunch), for: .touchUpInside)
    }
    
    // MARK: - fileprivate method
    @objc
    fileprivate func qrCodeLaunch() {
        // Retrieve the QRCode content
          // By using the delegate pattern
          readerVC.delegate = self

          // Or by using the closure pattern
          readerVC.completionBlock = { (result: QRCodeReaderResult?) in
            print(result) // qr코드에 따른 결과
            
            guard let scandleURL = result?.value else { return }
            let scandleURLString = URL(string: scandleURL)
            self.webView.load(URLRequest(url: scandleURLString!))
            
            
          }

          // Presents the readerVC as modal form sheet
          readerVC.modalPresentationStyle = .formSheet
         
          present(readerVC, animated: true, completion: nil)
    }
    
    // MARK: - QRcode Reader delegate method
    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
        reader.stopScanning()

        dismiss(animated: true, completion: nil)
    }
    
    func readerDidCancel(_ reader: QRCodeReaderViewController) {
        reader.stopScanning()
        
        dismiss(animated: true, completion: nil)
    }
    
}

