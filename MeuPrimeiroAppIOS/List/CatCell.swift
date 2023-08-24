//
//  CatCell.swift
//  MeuPrimeiroAppIOS
//
//  Created by user on 09/08/23.
//

import Foundation
import UIKit

class CatCell: UITableViewCell {
    private let horizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 16
        
        return stack
    }()
    
    private let imageCatView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 16
        image.layer.masksToBounds = true
        image.backgroundColor = .systemGray2
        return image
    }()
    
    private let verticalStack: UIStackView = {
        let stack = UIStackView()
       
        stack.axis = .vertical
        stack.spacing = 8
        
        return stack
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
       
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let description = UILabel()
       
        description.font =  UIFont.systemFont(ofSize: 8, weight: .light)
        description.textColor = .darkGray
        description.numberOfLines = 0
        return description
    }()
    
    override init (style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupContentView()
        addViewsInHierarchy()
        setupConstraints()
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder){
        //fatalError("coder not implemented")
        nil
    }
    func configure(cat:Cat){
        titleLabel.text = cat.name
        descriptionLabel.text = cat.description
        imageCatView.download(path: cat.referenceImageId ?? "")
    }
    private func setupContentView(){
        selectionStyle = .none
        //backgroundColor = .clear
        //contentView.backgroundColor = .clear
    }
    private func addViewsInHierarchy(){
        contentView.addSubview(horizontalStack)
        horizontalStack.addArrangedSubview(imageCatView)
        horizontalStack.addArrangedSubview(verticalStack)
        verticalStack.addArrangedSubview(UIView())
        verticalStack.addArrangedSubview(titleLabel)
        verticalStack.addArrangedSubview(descriptionLabel)
        verticalStack.addArrangedSubview(UIView())
    }
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            horizontalStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            horizontalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            horizontalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            horizontalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageCatView.widthAnchor.constraint(equalToConstant: 98),
            imageCatView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
}
