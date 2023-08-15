//
//  DFMenuCollectionView.swift
//  DeliveryFood
//
//  Created by Семён Беляков on 23.06.2023.
//

import UIKit

class DFMenuCollectionView: UICollectionView {
    
    static let identifier = "DFMenuCollectionView"
    private let cell = DFMenuCollectionViewCell()
    private let categoriesCollectionView = DFCategoriesCollectionView()
    
    private enum HeadersHeight: CGFloat {
        case specialOffers = 130.0
        case categories = 60.0
    }
    
    private var descriprionMeal: [DFDescriptionMeal] = [] {
        didSet {
            for meal in descriprionMeal {
                let viewModel = DFMenuCollectionViewCellViewModel(
                    mealImageURL: URL(string: meal.strMealThumb),
                    textLabel: meal.strMeal,
                    descriptionDishLabel:
                        "\(meal.strIngredient1), \(meal.strIngredient2), \(meal.strIngredient3), \(meal.strIngredient4), \(meal.strIngredient5), \(meal.strIngredient6), \(meal.strIngredient7),  \(meal.strIngredient8).",
                    nameCartButton: "123"
                )
                if !cellViewModel.contains(viewModel) {
                    cellViewModel.append(viewModel)
                }
            }
        }
    }
    
    
    private var cellViewModel: [DFMenuCollectionViewCellViewModel] = []
    
    private func fetchMenu() {
        DFService.shared.execute(
            .mealDetailsRequest,
            expecting: [String:[DFDescriptionMeal?]].self) { [weak self] result in
                switch result {
                case .success(let success):
                    for (_, value) in success {
                        for meal in value {
                            
                            guard let meal = meal,
                                  let self = self
                            else { return }

                            DispatchQueue.main.async {
                                self.descriprionMeal.append(meal)
                                self.reloadData()
                            }
                        }
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    fileprivate let padding: CGFloat = 10
    fileprivate let layout = UICollectionViewFlowLayout()
    
    init() {
        super.init(frame: .zero, collectionViewLayout: layout)
        
        registerCellAndHeaders()

        translatesAutoresizingMaskIntoConstraints = false
        showsVerticalScrollIndicator = false
        layout.sectionInset = .init(top: 20, left: 0, bottom: 0, right: 0)
        
        layout.minimumLineSpacing = 1
        backgroundColor = .clear
        delegate = self
        dataSource = self
        
        fetchMenu()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func registerCellAndHeaders() {
        register(DFMenuCollectionViewCell.self,
                 forCellWithReuseIdentifier: DFMenuCollectionViewCell.identifier)
        
        register(DFHeaderSpecialOffersReusebleView.self,
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                 withReuseIdentifier: DFHeaderSpecialOffersReusebleView.identifier)
        
        register(DFHeaderCategoriesReusebleView.self,
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                 withReuseIdentifier: DFHeaderCategoriesReusebleView.identifier)
    }
    
}

extension DFMenuCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return 0
        }
        
        return cellViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DFMenuCollectionViewCell.identifier, for: indexPath)
                as? DFMenuCollectionViewCell
        else { return UICollectionViewCell() }
        
        cell.configure(with: cellViewModel[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: frame.size.width, height: 180)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var header = UICollectionReusableView()
        
        if kind == UICollectionView.elementKindSectionHeader {
            let section = indexPath.section
            
            switch section {
            case 0:
                let headerSpecial = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DFHeaderSpecialOffersReusebleView.identifier, for: indexPath)
                
                header = headerSpecial
            case 1:
                let headerCategories = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DFHeaderCategoriesReusebleView.identifier, for: indexPath)
                if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                    layout.sectionHeadersPinToVisibleBounds = true
                }
                
                header = headerCategories
            default:
                return header
            }
        }
        
        return header
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 0 {
            return .init(width: frame.width, height: HeadersHeight.specialOffers.rawValue)
        }
        
        return .init(width: frame.width, height: HeadersHeight.categories.rawValue)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let containerView = UIView(frame: CGRect(
            x: 0,
            y: HeadersHeight.specialOffers.rawValue + HeadersHeight.categories.rawValue + 20,
            width: cell.frame.width,
            height: cell.frame.height
        ))
        
        containerView.layer.cornerRadius = 20
        containerView.backgroundColor = .systemBackground
        
        addSubview(containerView)
        sendSubviewToBack(containerView)
    }
}
