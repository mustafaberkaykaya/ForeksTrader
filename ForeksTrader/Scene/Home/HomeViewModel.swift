//
//  HomeViewModel.swift
//  ForeksTrader
//
//  Created by Berkay on 14.01.2023.
//

import Foundation
import DataProvider
import UIComponents

protocol HomeViewDataSource {
    var numberOfRowsInSection: Int { get }
    var criteria: [MyPageData] { get }
    
    func cellForRowAt(indexPath: IndexPath) -> StockCellProtocol
}

protocol HomeViewEventSource {
    var reloadData: VoidClosure? { get }
    var setCriteria: VoidClosure? { get }
}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {
    func didLoad()
    func firstDropDownMenuSelected(item: String)
    func secondDropDownMenuSelected(item: String)
}

final class HomeViewModel: BaseViewModel, HomeViewProtocol {
    
    // Privates
    private var items: [StockCellProtocol] = []
    private var myPageDefaults: [MyPageDefaultsData] = []
    private var tempMyPageDefaults: [MyPageDefaultsData] = []
    private var selectedFields: String = "las,pdd"
    private var stockStcs: String = ""
    private var timer: Timer = Timer()
    
    // EventSource
    var reloadData: VoidClosure?
    var setCriteria: VoidClosure?
    
    // DataSource
    var stockRepository: StockRepositoryProtocol
    var numberOfRowsInSection: Int {
        return items.count
    }
    var criteria: [MyPageData] = []

    init(stockRepository: StockRepositoryProtocol) {
        self.stockRepository = stockRepository
    }
    
    func cellForRowAt(indexPath: IndexPath) -> StockCellProtocol {
        return items[indexPath.row]
    }
    
    func didLoad() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(getStocks), userInfo: nil, repeats: true)
    }
    
    func firstDropDownMenuSelected(item: String) {
        let result = criteria.first { ($0.name == item) }
        guard let key = result?.key else { return }
        if let commaRange = selectedFields.range(of: ",") {
            let start = selectedFields.startIndex
            let end = commaRange.lowerBound
            let range = start..<end
            selectedFields.replaceSubrange(range, with: key)
        }
    }
    
    func secondDropDownMenuSelected(item: String) {
        let result = criteria.first { ($0.name == item) }
        guard let key = result?.key else { return }
        if let commaRange = selectedFields.range(of: ",") {
            let start = commaRange.upperBound
            let end = selectedFields.endIndex
            let range = start..<end
            selectedFields.replaceSubrange(range, with: key)
        }
    }
}

// MARK: - Request & DataProvider & Logic
extension HomeViewModel {
        
    @objc
    private func getStocks() {
        stockStcs.removeAll()
        stockRepository.getStocks { result in
            switch result {
            case .success(let response):
                guard let myPageDefaulsData = response.myPageDefaults,
                      let myPage = response.myPage else { return }
                self.myPageDefaults = myPageDefaulsData
                self.criteria = myPage
                self.items = self.myPageDefaults.map({ data in
                    return StockCellModel(stockName: data.cod)
                })
                for myPage in self.myPageDefaults {
                    guard let key = myPage.tke else { return }
                    self.stockStcs.append(key + "~")
                }
                if self.tempMyPageDefaults != self.myPageDefaults {
                   self.tempMyPageDefaults = self.myPageDefaults
                   self.reloadData?()
                   self.setCriteria?()
                }
                self.getStocksData(fields: self.selectedFields, stcs: self.stockStcs)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    // swiftlint:disable all
    private func getStocksData(fields: String, stcs: String) {
        guard let firstField = fields.split(separator: ",").first?.trimmingCharacters(in: .whitespaces),
              let secondField = fields.split(separator: ",").last?.trimmingCharacters(in: .whitespaces) else { return }
        stockRepository.getStocksData(fields: fields, stcs: stcs) { result in
            switch result {
            case .success(let response):
                guard let first = response.first else { return }
                for (index, stock) in first.enumerated() {
                    self.items[index].clockText = stock.clo
                    switch firstField {
                    case "ddi":
                        guard let ddi = stock.ddi else { return }
                        self.items[index].firstCriterionText = ddi
                        if ddi.contains("-") {
                            self.items[index].isDownArrowHidden = false
                            self.items[index].firstCriterionTextColor = .appCherry
                        } else {
                            self.items[index].isUpArrowHidden = false
                            self.items[index].firstCriterionTextColor = .appPear
                        }
                    case "low":
                        self.items[index].firstCriterionText = stock.low
                    case "hig":
                        self.items[index].firstCriterionText = stock.hig
                    case "buy":
                        self.items[index].firstCriterionText = stock.buy
                    case "sel":
                        self.items[index].firstCriterionText = stock.sel
                    case "pdc":
                        self.items[index].firstCriterionText = stock.pdc
                    case "cei":
                        self.items[index].firstCriterionText = stock.cei
                    case "flo":
                        self.items[index].firstCriterionText = stock.flo
                    case "gco":
                        self.items[index].firstCriterionText = stock.gco
                    case "las":
                        self.items[index].firstCriterionText = stock.las
                    case "pdd":
                        guard let pdd = stock.pdd else { return }
                        self.items[index].firstCriterionText = pdd
                        if pdd.contains("-") {
                            self.items[index].firstCriterionTextColor = .appCherry
                        } else {
                            self.items[index].firstCriterionTextColor = .appPear
                        }
                    default:
                        break
                    }
                    switch secondField {
                    case "ddi":
                        guard let ddi = stock.ddi else { return }
                        self.items[index].secondCriterionText = ddi
                        if ddi.contains("-") {
                            self.items[index].isDownArrowHidden = false
                            self.items[index].secondCriterionTextColor = .appCherry
                        } else {
                            self.items[index].isUpArrowHidden = false
                            self.items[index].secondCriterionTextColor = .appPear
                        }
                    case "low":
                        self.items[index].secondCriterionText = stock.low
                    case "hig":
                        self.items[index].secondCriterionText = stock.hig
                    case "buy":
                        self.items[index].secondCriterionText = stock.buy
                    case "sel":
                        self.items[index].secondCriterionText = stock.sel
                    case "pdc":
                        self.items[index].secondCriterionText = stock.pdc
                    case "cei":
                        self.items[index].secondCriterionText = stock.cei
                    case "flo":
                        self.items[index].secondCriterionText = stock.flo
                    case "gco":
                        self.items[index].secondCriterionText = stock.gco
                    case "las":
                        self.items[index].secondCriterionText = stock.las
                    case "pdd":
                        guard let pdd = stock.pdd else { return }
                        self.items[index].secondCriterionText = pdd
                        if pdd.contains("-") {
                            self.items[index].secondCriterionTextColor = .appCherry
                        } else {
                            self.items[index].secondCriterionTextColor = .appPear
                        }
                    default:
                        break
                    }
                }
                self.reloadData?()
            case .failure(let error):
                print(error)
            }
        }
    }
}
