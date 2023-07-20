//
//  DFTableView.swift
//  DeliveryFood
//
//  Created by Семён Беляков on 27.06.2023.
//

import UIKit

//final class DFTableView: UITableView {
//    
//    init() {
//        super.init(frame: .zero, style: .plain)
//        
//        translatesAutoresizingMaskIntoConstraints = false
//        register(DFTableViewCell.self,
//                 forCellReuseIdentifier: DFTableViewCell.identifier)
//        delegate = self
//        dataSource = self
//        
//        layer.cornerRadius = 20
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//}
//
//extension DFTableView: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: DFTableViewCell.identifier, for: indexPath) as? DFTableViewCell
//        else { return UITableViewCell() }
//        
//        cell.configure()
//
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 150
//    }
//}
