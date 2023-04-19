//
//  ViewController.swift
//  FitnessApp
//
//  Created by İbrahim Bayram on 18.04.2023.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var welcomeCollectionView: UICollectionView!
    
    private let viewModel = WelcomeListViewModel()
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if pageControl.currentPage == viewModel.numberOfItems() - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            }else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = viewModel.numberOfItems()
        
    }

    @IBAction func nextButtonClicked(_ sender: Any) {
        if currentPage == viewModel.numberOfItems() - 1 {
            //Switch to Home Screen
            let tabbar = storyboard?.instantiateViewController(withIdentifier: "tabBarVC") as! UITabBarController
            tabbar.modalPresentationStyle = .fullScreen
            tabbar.modalTransitionStyle = .flipHorizontal
            present(tabbar, animated: true)
        }else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            welcomeCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    

}
extension WelcomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
  
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = welcomeCollectionView.dequeueReusableCell(withReuseIdentifier: WelcomeCell.identifier, for: indexPath) as! WelcomeCell
        let elementAtIndex = viewModel.cellForItemAt(index: indexPath.row)
        cell.setupCell(element: elementAtIndex)
        return cell
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = currentPage
    }
    
}

