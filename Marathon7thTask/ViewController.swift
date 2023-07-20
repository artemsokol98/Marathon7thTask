//
//  ViewController.swift
//  Marathon7thTask
//
//  Created by Артем Соколовский on 19.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var scrollView: UIScrollView = {
		let scrollView = UIScrollView()
		scrollView.contentSize = CGSize(width: view.frame.size.width, height: 1500)
		
		scrollView.backgroundColor = .white
		scrollView.delegate = self
		scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 270 - view.safeAreaInsets.top, left: 0, bottom: 0, right: 0)
		
		return scrollView
    }()
    
	let imageView: UIImageView = {
		let iv = UIImageView(image: UIImage(named: "monterey.jpg"))
		iv.contentMode = .scaleAspectFill
		iv.clipsToBounds = true
		return iv
	}()

    override func viewDidLoad() {
        super.viewDidLoad()
		view.addSubview(scrollView)
		scrollView.addSubview(imageView)
		
		imageView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 270)

		scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    }
}

extension ViewController: UIScrollViewDelegate {
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
	
		let offsetY = scrollView.contentOffset.y
		var width = view.frame.width - offsetY * 2
		width = max(view.frame.width, width)
		imageView.frame = CGRect(x: min(0, offsetY), y: min(0, offsetY), width: width, height: 270 - offsetY)
		
		if offsetY < 0 {
			scrollView.scrollIndicatorInsets = UIEdgeInsets(top: imageView.frame.size.height - view.safeAreaInsets.top, left: 0, bottom: 0, right: 0)
		}

	}
}
