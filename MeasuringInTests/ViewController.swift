//
//  ViewController.swift
//  MeasuringInTests
//
//  Created by Toomas Vahter on 14.12.2019.
//  Copyright © 2019 Augmented Code. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    private let imageStorage: ImageLocalStorage = {
        return try! ImageLocalStorage(identifier: "Background")
    }()
    
    @IBOutlet weak var originalImageView: UIImageView!
    @IBOutlet weak var processedImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "Image")!
        originalImageView.image = image
    }
    
    @IBAction func process(_ sender: Any) {
        let image = UIImage(named: "Image")!
        imageStorage.store(image, filename: "original")
        
        let processedImage = ImageProcessor.processImage(image)
        imageStorage.store(image, filename: "processed")
        processedImageView.image = processedImage
    }
}
