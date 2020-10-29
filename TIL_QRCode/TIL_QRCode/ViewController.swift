//
//  ViewController.swift
//  TIL_QRCode
//
//  Created by ㅇ오ㅇ on 2020/10/29.
//

import UIKit
import WebKit
import SnapKit
import AVFoundation
import QRCodeReader

class ViewController: UIViewController, QRCodeReaderViewControllerDelegate {
    
    private var web = WKWebView()
    private let button = UIButton()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setConstraints()
    }
    
    fileprivate func setUI() {
        view.backgroundColor = .systemBackground
        
        [web, button].forEach {
            view.addSubview($0)
        }

        web.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        button.backgroundColor = .white
        button.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(100)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
            $0.width.equalTo(100)
        }
    }
    
    fileprivate func setConstraints() {
        
        guard let url = URL(string: "https://www.naver.com") else { return }
        let urlRequest = URLRequest(url: url)
        web.load(urlRequest)
        
        button.setTitle("QRcode", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.cyan.cgColor
        
        button.addTarget(self, action: #selector(setQRScan), for: .touchUpInside)
    }
    
    @objc
    fileprivate func setQRScan() {
        readerVC.delegate = self

        readerVC.completionBlock = { (result: QRCodeReaderResult?) in
          
          guard let scandleURL = result?.value else { return }
          let scandleURLString = URL(string: scandleURL)
          self.web.load(URLRequest(url: scandleURLString!))
          
          
        }

        readerVC.modalPresentationStyle = .formSheet
       
        present(readerVC, animated: true, completion: nil)
    }
    
    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
        reader.stopScanning()

        dismiss(animated: true, completion: nil)
    }
    
    func readerDidCancel(_ reader: QRCodeReaderViewController) {
        reader.stopScanning()
        
        dismiss(animated: true, completion: nil)
    }
}

