//
//  PocketMonViewController.swift
//  Week7
//
//  Created by dev on 2021/01/27.
//

import UIKit

class PocketMonViewController: UIViewController {
    
    // MARK: - properties
    private var pocketmonImages: [UIImage] = {
        var pocketmonImages: [UIImage] = []
        for index in 1...151 {
            if let image = UIImage(named: "\(index)") {
                pocketmonImages.append(image)
            }
        }
        return pocketmonImages
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension PocketMonViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pocketmonImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PocketmonCollectionViewCell", for: indexPath) as? PocketmonCollectionViewCell else { return .init() }
        cell.pocketmonImageView.image = pocketmonImages[indexPath.item]
        return cell
    }
    
    
}
