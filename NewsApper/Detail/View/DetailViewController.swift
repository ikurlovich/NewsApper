//
//  DetailViewController.swift
//  NewsApper
//
//  Created by Илья Курлович on 15.12.2023.
//

import UIKit
import SnapKit

final class DetailViewController: UIViewController {
    // MARK: - GUI Variables
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        return scrollView
    }()
    
    private lazy var contentView: UIView = UIView()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        
        return view
    }()
    
    private lazy var newsLabel: UILabel = {
        let label = UILabel()
        
        label.font = .boldSystemFont(ofSize: 14)
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var textNewsLabel: UILabel = {
        let label = UILabel()

        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        
        return label
    }()
    
    // MARK: - Properties
    private let edges = 10
    private let viewModel: NewsViewModelProtocol
    
    // MARK: - Life cycle
    init(viewModel: NewsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "News: Melting glaciers"
        
        setupUI()
    }
    
    // MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .white
        
        scrollView.addSubview(contentView)
        contentView.addSubviews([imageView, newsLabel, dateLabel, textNewsLabel])
        view.addSubview(scrollView)
        
        newsLabel.text = viewModel.title
        textNewsLabel.text = viewModel.description
        dateLabel.text = viewModel.date
        
        if let data = viewModel.imageData,
            let image = UIImage(data: data) {
            imageView.image = image
        } else {
            imageView.image = UIImage(named: "image")
        }
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(scrollView.snp.width)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(contentView)
        }
        
        newsLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(edges)
            make.leading.trailing.equalToSuperview().inset(edges)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(newsLabel.snp.bottom).offset(edges)
            make.leading.trailing.equalToSuperview().inset(edges)
        }
        
        textNewsLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(edges)
            make.leading.trailing.bottom.equalTo(contentView).inset(edges)
        }
    }
}
