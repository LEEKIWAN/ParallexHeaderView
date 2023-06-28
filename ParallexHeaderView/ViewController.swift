//
//  ViewController.swift
//  ParallexHeaderView
//
//  Created by 이기완 on 2023/06/28.
//

import UIKit
import HPParallaxHeader
class ViewController: UIViewController {

    @IBOutlet weak var navigationBar: UIView!
    @IBOutlet weak var searchContainerView: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    

    @IBOutlet weak var tripleLabel: UILabel!
    @IBOutlet weak var settingButton: UIButton!
        
    let headerView = HeaderView()
    
    var statusBarStyle: UIStatusBarStyle = .default
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                        
        topView.layer.cornerRadius = 30
        
        searchContainerView.layer.borderWidth = 1
        searchContainerView.layer.borderColor = UIColor.lightGray.cgColor
        searchContainerView.layer.cornerRadius = 25
        
        
        scrollView.parallaxHeader.view = headerView
        scrollView.parallaxHeader.height = 330
        scrollView.parallaxHeader.mode = .fill
        scrollView.parallaxHeader.minimumHeight = view.safeAreaInsets.top + 50 + 25 + 20
        
        scrollView.parallaxHeader.delegate = self
                
    }

    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        topView.setNeedsUpdateConstraints()
    }

    
    
    func navigationAlpha(_ value: CGFloat) {
        navigationBar.backgroundColor = UIColor.white.withAlphaComponent(value)
        
        if value > 0.2 {
            tripleLabel.textColor = .black
            settingButton.tintColor = .black
            statusBarStyle = .darkContent
            
        } else {
            tripleLabel.textColor = .white
            settingButton.tintColor = .white
            statusBarStyle = .lightContent
        }
        
        setNeedsStatusBarAppearanceUpdate()
    }
}

extension ViewController: HPParallaxHeaderDelegate {
    func parallaxHeaderDidScroll(_ parallaxHeader: HPParallaxHeader) {
        let multiflied = (1 - parallaxHeader.progress) * 4
        headerView.blurAlpha(multiflied)
        
        let multiflied2 = (multiflied - 2.4)
        navigationAlpha(multiflied2)
    }
    
    
}
