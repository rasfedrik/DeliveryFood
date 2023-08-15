//
//  DFMenuCollectionViewCell.swift
//  DeliveryFood
//
//  Created by Семён Беляков on 23.06.2023.
//

import UIKit

class DFMenuCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DFMenuCollectionViewCell"
    
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "arabskaja-shaurma"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "textLabel"
        return label
    }()
    
    private lazy var descriptionDishLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "descriptionLabel"
        return label
    }()
    
    private lazy var addToCartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.setTitle("cost", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .clear
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.red.cgColor
        return button
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 20
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        contentMode = .center
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        textLabel.text = nil
        descriptionDishLabel.text = nil
        addToCartButton.setTitle(nil, for: .normal)
    }
    
    public func configure(with viewModel: DFMenuCollectionViewCellViewModel) {
        textLabel.text = viewModel.textLabel
        descriptionDishLabel.text = viewModel.descriptionDishLabel
        addToCartButton.setTitle(viewModel.nameCartButton, for: .normal)
        
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.imageView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
        }
    }
    
    private func setConstraints() {
        
        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(descriptionDishLabel)
        
        addSubview(stackView)
        addSubview(addToCartButton)
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            stackView.topAnchor.constraint(equalTo: imageView.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: addToCartButton.topAnchor, constant: -10),
            
            addToCartButton.heightAnchor.constraint(equalToConstant: 30),
            addToCartButton.widthAnchor.constraint(equalToConstant: 100),
            addToCartButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            addToCartButton.bottomAnchor.constraint(equalTo: imageView.bottomAnchor)
            
        ])
    }
    
}
