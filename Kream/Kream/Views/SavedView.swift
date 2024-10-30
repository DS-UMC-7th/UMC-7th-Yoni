//
//  SavedView.swift
//  Kream
//
//  Created by 선가연 on 10/30/24.
//

import UIKit

class SavedView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addComponents()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addComponents() {
        self.addSubview(titleLabel)
        self.addSubview(countLabel)
        self.addSubview(tableView)
    }
    
    // 페이지 제목 레이블
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Saved"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        
        return label
    }()
    
    // 셀 개수 레이블
    private lazy var countLabel: UILabel = {
        let label = UILabel()

        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()

    public lazy var tableView: UITableView = {
        let table = UITableView()
        
        table.register(SavedTableViewCell.self, forCellReuseIdentifier: SavedTableViewCell.identifier)
        table.separatorStyle = .singleLine
        
        return table
    }()
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(61)
            $0.leading.equalToSuperview().offset(10)
        }
        
        countLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(13)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(countLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    // 셀 개수를 업데이트
    public func updateCellCount(with count: Int) {
        countLabel.text = "전체 \(count)개"
    }
}
