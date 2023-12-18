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
        
        view.image = UIImage(named: "ice") ?? UIImage.add
        
        return view
    }()
    
    private lazy var newsLabel: UILabel = {
        let label = UILabel()
        
        label.text = 
"""
Unraveling the Mystery:
The Accelerated Melting of Glaciers Worldwide
"""
        label.font = .boldSystemFont(ofSize: 14)
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var textNewsLabel: UILabel = {
        let label = UILabel()
        
        label.text = 
"""
In an alarming trend that's sweeping across the globe, glaciers are melting at an unprecedented rate.This
phenomenon, largely attributed to climate change, is having profound impacts on our planet's ecosystems and
the human societies that depend on them.
        
Scientists have been monitoring the retreat of glaciers for decades, but recent observations suggest that the
rate of melting has accelerated significantly. This rapid loss of ice is contributing to rising sea levels,
threatening coastal communities and altering the landscapes of our planet.
       
In the Arctic and Antarctic regions, where some of the world's largest glaciers reside, the effects are
particularly pronounced. The loss of ice in these areas is disrupting the habitats of various wildlife species
and impacting local communities who rely on these ecosystems for their livelihoods.
        
Researchers are working tirelessly to understand the complex mechanisms driving glacier melt and to predict
future scenarios. Their findings underscore the urgency of addressing climate change and highlight the need for
global cooperation in mitigating its effects.
        
While the situation is dire, it's not too late to act. By reducing greenhouse gas emissions and transitioning to
renewable energy sources, we can slow the rate of glacier melt and work towards a more sustainable future.
"""
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        
        label.text = "21:00 | 21.01.2021"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        
        return label
    }()
    
    // MARK: - Properties
    
    private let edges = 10
    
    // MARK: - Life cycle
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
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.size.edges.equalTo(scrollView)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(contentView)
            make.height.equalTo(200)
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
            make.leading.trailing.equalTo(contentView).inset(edges)
        }

    }
}
