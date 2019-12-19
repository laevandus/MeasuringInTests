//
//  ImageLocalStorage.swift
//  MeasuringInTests
//
//  Created by Toomas Vahter on 14.12.2019.
//  Copyright © 2019 Augmented Code. All rights reserved.
//

import Foundation
import UIKit

final class ImageLocalStorage {
    private let folderURL: URL
    
    init(identifier: String) throws {
        let url = try FileManager.default.url(for: .applicationDirectory, in: .localDomainMask, appropriateFor: nil, create: true)
        folderURL = url.appendingPathComponent(identifier)
        try FileManager.default.createDirectory(at: folderURL, withIntermediateDirectories: true, attributes: nil)
    }
    
    func remove(_ filename: String) {
        let url = folderURL.appendingPathComponent(filename)
        try? FileManager.default.removeItem(at: url)
    }
    
    func store(_ image: UIImage, filename: String) {
        let url = folderURL.appendingPathComponent(filename)
        let data = image.jpegData(compressionQuality: 1)
        try! data!.write(to: url, options: .atomicWrite)
    }
    
    func load(withFilename filename: String) -> UIImage? {
        let url = folderURL.appendingPathComponent(filename)
        return UIImage(contentsOfFile: url.path)
    }
}
