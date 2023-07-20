//
//  DFNavigationController.swift
//  DeliveryFood
//
//  Created by Семён Беляков on 06.07.2023.
//

//import UIKit
//
//class DFNavigationController: UINavigationController, UINavigationControllerDelegate {
//    
//    private let categoriesCollectionView = DFCategoriesCollectionView()
//    private let specialOffersCollectionView = DFSpecialOffersCollectionView()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        delegate = self
//    }
//    
//    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
//        
//        let navBar = navigationBar
//        navBar.subviews.forEach { subview in
//            let stringFromClass = NSStringFromClass(subview.classForCoder)
//            guard stringFromClass.contains("UINavigationBarLargeTitleView") else { return }
//            
//            if specialOffersCollectionView.superview != subview {
//                specialOffersCollectionView.removeFromSuperview()
//                subview.addSubview(specialOffersCollectionView)
//            }
//            
//            if categoriesCollectionView.superview != subview {
////                categoriesCollectionView.removeFromSuperview()
////                subview.addSubview(categoriesCollectionView)
//            }
//            
//            specialOffersCollectionView.translatesAutoresizingMaskIntoConstraints = false
//            //            categoriesCollectionView.translatesAutoresizingMaskIntoConstraints = false
//            
//            specialOffersCollectionView.removeConstraints(specialOffersCollectionView.constraints)
//            //            categoriesCollectionView.removeConstraints(categoriesCollectionView.constraints)
//            
//            specialOffersCollectionView.topAnchor.constraint(equalTo: specialOffersCollectionView.superview!.topAnchor, constant: 10).isActive = true
////            specialOffersCollectionView.heightAnchor.constraint(equalToConstant: 130).isActive = true
//            specialOffersCollectionView.bottomAnchor.constraint(equalTo: specialOffersCollectionView.superview!.bottomAnchor, constant: -10).isActive = true
//            specialOffersCollectionView.leadingAnchor.constraint(equalTo: subview.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
//            specialOffersCollectionView.trailingAnchor.constraint(equalTo: subview.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
//
//            //            specialOffersCollectionView.bottomAnchor.constraint(equalTo: categoriesCollectionView.topAnchor, constant: -10).isActive = true
//            
//            //            categoriesCollectionView.topAnchor.constraint(equalTo: specialOffersCollectionView.bottomAnchor, constant: 0).isActive = true
//            //            categoriesCollectionView.heightAnchor.constraint(equalToConstant: 60).isActive = true
//            //            categoriesCollectionView.leadingAnchor.constraint(equalTo: subview.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
//            //            categoriesCollectionView.trailingAnchor.constraint(equalTo: subview.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
//            //            categoriesCollectionView.bottomAnchor.constraint(equalTo: categoriesCollectionView.superview!.bottomAnchor, constant: -30).isActive = true
//            //            categoriesCollectionView.bottomAnchor.constraint(equalTo: subview.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
//        }
//        
//}
//    
//}
