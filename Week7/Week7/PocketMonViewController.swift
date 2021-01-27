//
//  PocketMonViewController.swift
//  Week7
//
//  Created by dev on 2021/01/27.
//

import UIKit

class PocketMonViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - properties
    private var rowItemCount: CGFloat = 4
    private var pocketmonImages: [UIImage] = {
        var pocketmonImages: [UIImage] = []
        for index in 1...151 {
            if let image = UIImage(named: "\(index)") {
                pocketmonImages.append(image)
            }
        }
        return pocketmonImages
    }()

    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFlowLayout()
    }
    
    private func setFlowLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 10
        flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        
        let itemWidth = (UIScreen.main.bounds.width - (10 * (rowItemCount - 1))) / rowItemCount
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        collectionView.collectionViewLayout = flowLayout
    }
}

// MARK: - UICollectionViewDelegate
extension PocketMonViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension PocketMonViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pocketmonImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PocketmonCollectionViewCell", for: indexPath) as? PocketmonCollectionViewCell else { return .init() }
        cell.pocketmonImageView.image = pocketmonImages[indexPath.item]
        return cell
    }
}
