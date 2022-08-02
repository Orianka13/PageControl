//
//  ViewController.swift
//  DataStorageLayoutInCode
//
//  Created by Олеся Егорова on 02.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let pages = [Page(image: "image1", title: "Safety", text: "All data in the storage is available only to you, no one can access it, even we, all data is stored locally"),
    Page(image: "image2", title: "Securing Data", text: "All your data is securely password protected. You can also set access only by face ID"),
    Page(image: "image3", title: "Only Important", text: "Keep only the most important data: passwords, bank cards, photos and more thanks to GuardGrade")]
    
    private let scrollView = UIScrollView()
    
    private let colors: [UIColor] = [.systemYellow, .systemPink, .systemCyan]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(scrollView)
        
        self.scrollView.backgroundColor = .systemYellow
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.scrollView.frame = CGRect(x: 0,
                                       y: 0,
                                       width: self.view.frame.size.width,
                                       height: self.view.frame.size.height)
        
        if self.scrollView.subviews.count == 2 {
            self.configureScrollView()
        }
    }
    
    @objc private func pageControlDidChanged(_ sender: UIPageControl) {
        let current = sender.currentPage
        self.scrollView.setContentOffset(CGPoint(x: CGFloat(current) * self.view.frame.size.width,
                                                 y: 0), animated: true)
    }
    
    private func configureScrollView() {
        self.scrollView.contentSize = CGSize(width: self.view.frame.size.width * CGFloat(self.pages.count), height: self.scrollView.frame.size.height)
        self.scrollView.isPagingEnabled = true
        for item in 0..<self.pages.count {
            let page = UIView(frame: CGRect(x: CGFloat(item) * self.view.frame.size.width,
                                            y: 0,
                                            width: self.view.frame.size.width,
                                            height: self.view.frame.size.height))
            let pageControl: UIPageControl = {
                let pageControl = UIPageControl()
                pageControl.backgroundColor = .systemBlue
                return pageControl
            }()
            
            pageControl.frame = CGRect(x: 10,
                                       y: self.view.frame.height - 200,
                                            width: self.view.frame.size.width - 20,
                                            height: 70)
            pageControl.numberOfPages = self.pages.count
            pageControl.addTarget(self, action: #selector(pageControlDidChanged(_:)), for: .valueChanged)
            
            
            page.backgroundColor = colors[item]
            pageControl.currentPage = item
            page.addSubview(pageControl)
            
            
            self.scrollView.addSubview(page)
        }
    }
}
//self.view.frame.size.height - 200
