//
//  DFViewController.swift
//  DeliveryFood
//
//  Created by Семён Беляков on 23.06.2023.
//

import UIKit

//final class DFViewController: UIViewController, UITableViewDelegate {
//    
//    private var specialOffersCollectionView = DFSpecialOffersCollectionView()
//    private var categoriesCollectionView = DFCategoriesCollectionView()
////    private let tableView = DFTableView()
//    
//    private var specialOffersHeight: CGFloat = 130
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        view.backgroundColor = .systemBackground
//        tableView.delegate = self
//        view.addSubview(specialOffersCollectionView)
//        addConstraints()
//        setupNavigationBar()
//    }
//    
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        
////        tableView.frame = view.bounds
//        specialOffersCollectionView.frame = .init(x: .zero, y: -tableView.safeAreaInsets.top, width: tableView.frame.width, height: specialOffersHeight)
//    }
//    
//    private func setupNavigationBar() {
//        navigationItem.title = ""
//        guard let navigationBar = self.navigationController?.navigationBar else { return }
//        
////        navigationBar.addSubview(specialOffersCollectionView)
//        //        navigationBar.addSubview(categoriesCollectionView)
//        navigationBar.prefersLargeTitles = true
//        
//        NSLayoutConstraint.activate([
////            specialOffersCollectionView.topAnchor.constraint(equalTo: navigationBar.topAnchor),
////            specialOffersCollectionView.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor, constant: -10),
////            specialOffersCollectionView.heightAnchor.constraint(equalToConstant: specialOffersHeight),
////            specialOffersCollectionView.widthAnchor.constraint(equalToConstant: navigationBar.frame.width)
//        ])
//    }
//    
//    
//    private func addConstraints() {
//        //        view.addSubview(specialOffersCollectionView)
//        view.addSubview(tableView)
//        //        view.addSubview(categoriesCollectionView)
//        
//        
//        NSLayoutConstraint.activate([
//            specialOffersCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            specialOffersCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            specialOffersCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            specialOffersCollectionView.heightAnchor.constraint(equalToConstant: specialOffersHeight),
//            
//            //            categoriesCollectionView.topAnchor.constraint(equalTo: specialOffersCollectionView.bottomAnchor),
//            //            categoriesCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            //            categoriesCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            //            categoriesCollectionView.heightAnchor.constraint(equalToConstant: 70),
//            
//            tableView.topAnchor.constraint(equalTo: specialOffersCollectionView.bottomAnchor),
//
//            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
//        ])
//    }
//    
//}
//
//extension DFViewController: UIScrollViewDelegate {
//    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let offsetY = tableView.contentOffset.y
//        //        var specialOffersFrame = specialOffersCollectionView.frame
//        if offsetY < 0 {
//            specialOffersCollectionView.frame = .init(x: .zero, y: -tableView.safeAreaInsets.top, width: tableView.frame.width, height: specialOffersHeight + abs(offsetY))
//        }
//    }
//    
//}


//extension DFViewController: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return 50
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: DFTableViewCell.identifier, for: indexPath) as? DFTableViewCell else { return UITableViewCell() }
//
//        cell.configure()
//
//
//        return cell
//    }
//
//
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 70
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return categoriesCollectionView
//    }
//
////    func scrollViewDidScroll(_ scrollView: UIScrollView) {
////        let offsetY = scrollView.contentOffset.y
////        var specialOffersFrame = specialOffersCollectionView.frame
////        var categoriesFrame = categoriesCollectionView.frame
////
////        if offsetY <= 0 {
////            print(offsetY)
//
////            specialOffersFrame.size.height = specialOffersHeight + 700
////        }
////        specialOffersCollectionView.frame = specialOffersFrame
////    }
//
//}
