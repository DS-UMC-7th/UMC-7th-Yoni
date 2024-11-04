//
//  SavedTableViewCell.swift
//  Kream
//
//  Created by 선가연 on 10/29/24.
//

import UIKit
import SnapKit

class SavedTableViewCell: UITableViewCell {
    
    static let identifier = "SavedTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addComponents()
        self.setupConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.savedImageView.image = nil
        self.titleLabel.text = nil
        self.descriptionLabel.text = nil
        self.priceLabel.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 이미지 뷰
    private lazy var savedImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    // 제목 레이블
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.boldSystemFont(ofSize: 12)
        
        return label
    }()
    
    // 설명 레이블
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 9)
        label.textColor = UIColor.systemGray
        
        return label
    }()
    
    // 가격 레이블
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.boldSystemFont(ofSize: 14)
        
        return label
    }()
    
    // 북마크 버튼
    private lazy var bookmarkButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private func addComponents() {
        self.addSubview(savedImageView)
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(priceLabel)
        self.addSubview(bookmarkButton)
    }
    
    private func setupConstraints() {
        // 상품 이미지 뷰
        savedImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(13)
            $0.leading.equalToSuperview().offset(13)
            $0.bottom.equalToSuperview().offset(-13)
            $0.width.height.equalTo(72)
        }
        
        // 제목 레이블
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(13)
            $0.leading.equalTo(savedImageView.snp.trailing).offset(13)
        }
        
        // 설명 레이블
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.width.equalTo(153)
            $0.height.equalTo(33)
        }
        
        // 가격 레이블
        priceLabel.snp.makeConstraints {
            $0.bottom.equalTo(savedImageView.snp.bottom)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        // 북마크 버튼
        bookmarkButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
            $0.trailing.equalToSuperview().offset(-17)
            $0.width.equalTo(14)
            $0.height.equalTo(18)
        }
        
    }
    
    public func configure(model: SavedModel) {
        self.savedImageView.image = UIImage(named: model.image)
        self.titleLabel.text = model.title
        self.descriptionLabel.text = model.description
        self.priceLabel.text = model.price
    }
}
