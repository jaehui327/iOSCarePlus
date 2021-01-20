//
//  GameDetailPageViewController.swift
//  iOSCarePlus
//
//  Created by JHKim on 2021/01/20.
//

import UIKit

class GameDetailPageViewController: UIPageViewController {

    // MARK: - properties
    var orderedViewControllers: [UIViewController]?
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        orderedViewControllers = [getImageViewController(), getImageViewController(), getImageViewController()]
        if let firstViewController = orderedViewControllers?.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    // MARK: - Methods
    private func getImageViewController() -> UIViewController {
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameDetailImageViewController")
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
