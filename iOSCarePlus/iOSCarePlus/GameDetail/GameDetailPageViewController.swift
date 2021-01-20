//
//  GameDetailPageViewController.swift
//  iOSCarePlus
//
//  Created by JHKim on 2021/01/20.
//

import UIKit

class GameDetailPageViewController: UIPageViewController {
    // MARK: - properties
    var orderedViewControllers: [UIViewController]? = []
    var model: NewGameContent?
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        guard let screenShots = model?.screenshots else { return }
        for screenShot in screenShots {
            guard let url = screenShot.images.first?.url else { return }
            let imageViewController = getImageViewController(url: url)
            orderedViewControllers?.append(imageViewController)
        }
        
        if let firstViewController = orderedViewControllers?.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    // MARK: - Methods
    private func getImageViewController(url: String) -> UIViewController {
        guard let imageViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameDetailImageViewController") as? GameDetailImageViewController else { return UIViewController() }
        imageViewController.url = url
        return imageViewController
    }
}

// MARK: - UIPageViewControllerDataSource
extension GameDetailPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = orderedViewControllers?.firstIndex(of: viewController) else { return nil }
        let beforeIndex = currentIndex - 1
        
        guard beforeIndex >= 0, (orderedViewControllers?.count ?? 0) > beforeIndex else { return nil }
        
        return orderedViewControllers?[beforeIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = orderedViewControllers?.firstIndex(of: viewController) else { return nil }
        let afterIndex = currentIndex + 1
        
        guard let count = orderedViewControllers?.count, count > afterIndex else { return nil }
        
        return orderedViewControllers?[afterIndex]
    }
}
