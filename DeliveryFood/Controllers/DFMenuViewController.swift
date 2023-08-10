//
//  DFMenuViewController.swift
//  DeliveryFood
//
//  Created by Семён Беляков on 23.06.2023.
//

import UIKit

final class DFMenuViewController: UIViewController {
    
    private var menuCollectionView = DFMenuCollectionView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        title = "Меню"
        
        addCollectionView()
        navigationController?.isNavigationBarHidden = true
    }
    
    private func addCollectionView() {
        view.addSubview(menuCollectionView)
        
        NSLayoutConstraint.activate([
            menuCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            menuCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            menuCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            menuCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
