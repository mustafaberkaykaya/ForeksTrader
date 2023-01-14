//
//  StockCell.swift
//  UIComponents
//
//  Created by Berkay on 14.01.2023.
//

import UIKit
import TinyConstraints

public class StockCell: UITableViewCell, ReusableView {
    
    weak var viewModel: StockCellProtocol?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubViews()
        configureContents()
    }
    
    private func configureContents() {
        self.backgroundColor = .appCherry
    }
    
    public func set(viewModel: StockCellProtocol) {
        self.viewModel = viewModel
        
    }
    
}


// MARK: - UILayout
extension StockCell {
    
    private func addSubViews() {
        
    }
}



