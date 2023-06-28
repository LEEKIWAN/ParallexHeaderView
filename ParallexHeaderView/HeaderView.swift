//
//  HeaderView.swift
//  ParallexHeaderView
//
//  Created by 이기완 on 2023/06/28.
//

import UIKit

class HeaderView: UIView {

    
    @IBOutlet weak var blurredView: UIVisualEffectView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromNib()
//        layout()
//        attribute()
//        bind()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupFromNib()
//        layout()
//        attribute()
//        bind()
    }

    
    func blurAlpha(_ value: CGFloat) {
        blurredView.alpha = value
    }
}
