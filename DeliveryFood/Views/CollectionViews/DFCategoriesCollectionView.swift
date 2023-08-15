//
//  DFCategoriesCollectionView.swift
//  DeliveryFood
//
//  Created by Семён Беляков on 23.06.2023.
//

import UIKit

final class DFCategoriesCollectionView: UICollectionView {
    
    private let cell = DFCategoriesCollectionViewCell()
  
    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        //        layout.minimumLineSpacing = 10
        return layout
    }()
    

    private var cellViewModel: [DFCategoriesCollectionViewCellViewModel] = []
    
    private var categories: [DFMeal] = [] {
        didSet {
            for category in categories {
                let viewModel = DFCategoriesCollectionViewCellViewModel(
                    strCategory: category.strCategory
                )
                if !cellViewModel.contains(viewModel) {
                    cellViewModel.append(viewModel)
                }
            }
        }
    }
    
    public func fetchCategories() {
        DFService.shared.execute(
            .categoriesRequest,
            expecting: DFCategories.self) { [weak self] result in
                switch result {
                case .success(let success):
                    guard let self else { return }
                    
                    DispatchQueue.main.async {
                        for meal in success.meals {
                            self.categories.append(meal)
                            self.reloadData()
                        }
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    init() {
        super.init(frame: .zero, collectionViewLayout: layout)
        
        register(DFCategoriesCollectionViewCell.self,
                 forCellWithReuseIdentifier: DFCategoriesCollectionViewCell.identifier)
        
        setCollectionViewLayout(layout, animated: true)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemGray6
        showsHorizontalScrollIndicator = false
        layout.collectionView?.contentInset = UIEdgeInsets(
            top: 0,
            left: 10,
            bottom: 20,
            right: 10
        )
        
        delegate = self
        dataSource = self
        fetchCategories()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DFCategoriesCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DFCategoriesCollectionViewCell.identifier, for: indexPath) as? DFCategoriesCollectionViewCell else { fatalError("Unsupported cell") }
        
        cell.configure(with: cellViewModel[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 100, height: frame.height - 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(cellViewModel[indexPath.row].strCategory)
    }
    
}
