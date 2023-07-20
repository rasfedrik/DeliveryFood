//
//  DFSpecialOffersCollectionView.swift
//  DeliveryFood
//
//  Created by Семён Беляков on 23.06.2023.
//

import UIKit

final class DFSpecialOffersCollectionView: UICollectionView {

    static let identifier = "DFSpecialOffersCollectionView"
    private let cell = DFSpecialOffersCollectionViewCell()
    
    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
//        layout.minimumLineSpacing = 10
        
        return layout
    }()
    
    init() {
        super.init(frame: .zero, collectionViewLayout: layout)
        
        register(DFSpecialOffersCollectionViewCell.self,
                 forCellWithReuseIdentifier: DFSpecialOffersCollectionViewCell.identifier)
        backgroundColor = .systemGray6
        setCollectionViewLayout(layout, animated: true)
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        layout.collectionView?.contentInset = UIEdgeInsets(
            top: 10,
            left: 10,
            bottom: 0,
            right: 10
        )
        
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DFSpecialOffersCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DFSpecialOffersCollectionViewCell.identifier, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: frame.height - 20)
    }
    

}
