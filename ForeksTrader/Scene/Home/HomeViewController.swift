//
//  HomeViewController.swift
//  ForeksTrader
//
//  Created by Berkay on 14.01.2023.
//

import UIKit
import TinyConstraints
import UIComponents
import DropDown

final class HomeViewController: BaseViewController<HomeViewModel> {
    
    private let symbolTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .interBold24
        label.textColor = .appHoney
        label.text = L10n.Home.symbol
        return label
    }()
    
    private let firstCriterionView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let secondCriterionView: UIView = {
        let view = UIView()
        return view
    }()

    private let firstCriterionLabel: UILabel = {
        let label = UILabel()
        label.font = .interMedium10
        label.textColor = .appWhite
        return label
    }()
    
    private let secondCriterionLabel: UILabel = {
        let label = UILabel()
        label.font = .interMedium10
        label.textColor = .appWhite
        return label
    }()
    
    private let firstCriterionIcon: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let secondCriterionIcon: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.contentInset = .zero
        tableView.backgroundColor = .clear
        tableView.keyboardDismissMode = .onDrag
        tableView.showsVerticalScrollIndicator = false
        tableView.register(StockCell.self)
        return tableView
    }()
    
    private let firstDropDown = DropDown()
    private let secondDropDown = DropDown()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        subscribeViewModel()
        viewModel.didLoad()
    }
}

// MARK: - UILayout
extension HomeViewController {
    
    private func addSubViews() {
        addSymbolTitleLabel()
        addCriterionViews()
        addElementsToCriterionViews()
        addTableView()
    }
    
    private func addSymbolTitleLabel() {
        view.addSubview(symbolTitleLabel)
        symbolTitleLabel.edgesToSuperview(excluding: [.right, .bottom], insets: .top(10) + .left(16), usingSafeArea: true)
        symbolTitleLabel.size(CGSize(width: UIScreen.main.bounds.width * 0.4, height: 36))
    }
    
    private func addCriterionViews() {
        view.addSubview(firstCriterionView)
        firstCriterionView.topToSuperview(usingSafeArea: true).constant = 10
        firstCriterionView.leftToRight(of: symbolTitleLabel, offset: 8)
        firstCriterionView.size(CGSize(width: 90, height: 36))
        view.addSubview(secondCriterionView)
        secondCriterionView.leftToRight(of: firstCriterionView, offset: 16)
        secondCriterionView.topToSuperview(usingSafeArea: true).constant = 10
        secondCriterionView.size(CGSize(width: 90, height: 36))
    }
    
    private func addElementsToCriterionViews() {
        firstCriterionView.addSubview(firstCriterionLabel)
        firstCriterionLabel.centerYToSuperview()
        firstCriterionLabel.leftToSuperview().constant = 6
        firstCriterionView.addSubview(firstCriterionIcon)
        firstCriterionIcon.centerYToSuperview()
        firstCriterionIcon.rightToSuperview().constant = -4
        firstCriterionIcon.size(CGSize(width: 24, height: 24))
        secondCriterionView.addSubview(secondCriterionLabel)
        secondCriterionLabel.centerYToSuperview()
        secondCriterionLabel.leftToSuperview().constant = 6
        secondCriterionView.addSubview(secondCriterionIcon)
        secondCriterionIcon.centerYToSuperview()
        secondCriterionIcon.rightToSuperview().constant = -4
        secondCriterionIcon.size(CGSize(width: 24, height: 24))
    }
    
    private func addTableView() {
        view.addSubview(tableView)
        tableView.topToBottom(of: symbolTitleLabel, offset: 8)
        tableView.edgesToSuperview(excluding: .top)
    }
}

// MARK: - Configure Contents
extension HomeViewController {
    
    private func configureContents() {
        configureCriterionElements()
        configureDropDownMenus()
        tableView.dataSource = self
    }
    
    private func configureCriterionElements() {
        firstCriterionView.layer.borderWidth = 2
        firstCriterionView.layer.borderColor = UIColor.appHoney.cgColor
        firstCriterionView.layer.cornerRadius = 12
        firstCriterionView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(firstCriterionViewTapped)))
        secondCriterionView.layer.borderWidth = 2
        secondCriterionView.layer.borderColor = UIColor.appHoney.cgColor
        secondCriterionView.layer.cornerRadius = 12
        secondCriterionView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(secondCriterionViewTapped)))
        firstCriterionIcon.image = .icArrowDown24
        secondCriterionIcon.image = .icArrowDown24
    }
    
    private func configureDropDownMenus() {
        firstDropDown.anchorView = firstCriterionView
        firstDropDown.direction = .bottom
        secondDropDown.anchorView = secondCriterionView
        secondDropDown.direction = .bottom
        firstDropDown.selectionAction = { [weak self] (_, item: String) in
            guard let self else { return }
            self.firstCriterionLabel.text = item
            self.viewModel.firstDropDownMenuSelected(item: item)
        }
        secondDropDown.selectionAction = { [weak self] (_, item: String) in
            guard let self else { return }
            self.secondCriterionLabel.text = item
            self.viewModel.secondDropDownMenuSelected(item: item)
        }
    }
}

// MARK: - Actions
extension HomeViewController {
    @objc
    private func firstCriterionViewTapped() {
        firstDropDown.show()
    }
    
    @objc
    private func secondCriterionViewTapped() {
        secondDropDown.show()
    }
}

// MARK: - SubscribeViewModel
extension HomeViewController {
    
    private func subscribeViewModel() {
        viewModel.reloadData = { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
        
        viewModel.setCriteria = { [weak self] in
            guard let self = self else { return }
            if self.viewModel.criteria.count > 2 {
                self.firstCriterionLabel.text = self.viewModel.criteria[0].name
                self.secondCriterionLabel.text = self.viewModel.criteria[1].name
            }
            for criteria in self.viewModel.criteria {
                guard let name = criteria.name else { return }
                self.firstDropDown.dataSource.append(name)
                self.secondDropDown.dataSource.append(name)
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: StockCell = tableView.dequeueReusableCell(for: indexPath)
        let viewModel = viewModel.cellForRowAt(indexPath: indexPath)
        cell.set(viewModel: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
