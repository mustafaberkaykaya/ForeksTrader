//
//  StockCell.swift
//  UIComponents
//
//  Created by Berkay on 14.01.2023.
//

import UIKit
import TinyConstraints

public class StockCell: UITableViewCell, ReusableView {
    
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.axis = .horizontal
        return stackView
    }()

    private let arrowView: UIView = {
        let view = UIView()
        view.width(25)
        return view
    }()
    
    private let arrowUpImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .icArrowUp24
        return imageView
    }()
    
    private let arrowDownImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .icArrowDown24
        return imageView
    }()
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 3
        stackView.alignment = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    private let stockNameLabel: UILabel = {
        let label = UILabel()
        label.font = .interBold20
        label.text = "XAU/USD"
        label.textColor = .appWhite
        return label
    }()
    
    private let clockLabel: UILabel = {
        let label = UILabel()
        label.font = .interMedium14
        label.text = "99:99:99"
        label.textColor = .appSmoke
        return label
    }()
    
    private let firstCriterionLabel: UILabel = {
        let label = UILabel()
        label.font = .interBold12
        label.text = "9,999,999"
        label.textAlignment = .right
        label.textColor = .appWhite
        return label
    }()
    
    private let secondCriterionLabel: UILabel = {
        let label = UILabel()
        label.font = .interBold12
        label.textAlignment = .right
        label.text = "1.999,92"
        label.textColor = .appCherry
        return label
    }()
    
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
    
    public func set(viewModel: StockCellProtocol) {
        self.viewModel = viewModel
        
    }
    
}


// MARK: - UILayout
extension StockCell {

    private func addSubViews() {
        addHorizontalStackView()
        addHorizontalStackViewElements()
        addCriterionLabels()
    }
    
    private func addHorizontalStackView() {
        contentView.addSubview(horizontalStackView)
        horizontalStackView.edgesToSuperview(excluding: .right, insets: .vertical(5) + .left(8))
        horizontalStackView.width(UIScreen.main.bounds.width * 0.4)
    }
    
    private func addHorizontalStackViewElements() {
        horizontalStackView.addArrangedSubview(arrowView)
        horizontalStackView.addArrangedSubview(verticalStackView)
        arrowView.addSubview(arrowUpImageView)
        arrowView.addSubview(arrowDownImageView)
        arrowUpImageView.edgesToSuperview(excluding: .bottom, insets: .top(4) + .horizontal(4))
        arrowDownImageView.edgesToSuperview(excluding: .top, insets: .bottom(4) + .horizontal(4))
        verticalStackView.addArrangedSubview(stockNameLabel)
        verticalStackView.addArrangedSubview(clockLabel)
    }
    
    private func addCriterionLabels() {
        contentView.addSubview(firstCriterionLabel)
        firstCriterionLabel.leftToRight(of: horizontalStackView, offset: 18)
        firstCriterionLabel.topToSuperview().constant = 12
        firstCriterionLabel.width((UIScreen.main.bounds.width * 0.2))
        contentView.addSubview(secondCriterionLabel)
        secondCriterionLabel.leftToRight(of: firstCriterionLabel, offset: 18)
        secondCriterionLabel.topToSuperview().constant = 12
        secondCriterionLabel.width((UIScreen.main.bounds.width * 0.2))
    }
}

// MARK: - ConfigureContents
extension StockCell {
    
    private func configureContents() {
        contentView.backgroundColor = .appDark
        arrowView.layer.cornerRadius = 4
        arrowView.backgroundColor = .appPear
        arrowDownImageView.isHidden = true
    }
}


