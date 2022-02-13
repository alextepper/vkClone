//
//  ProfileCustomView.swift
//  FinalOne
//
//  Created by Alexander Tepper on 31/01/2022.
//

import UIKit

class ProfileCustomView: UIView {

    private var view: UIView?
    
    
    @IBOutlet weak var userProfileImage: UIImageView!
    
    @IBOutlet weak var userPostsCollectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func loadFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "ProfileCustomView", bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {return UIView()}
        return view
        
    }
    
    private func setup() {
        view = loadFromNib()
        guard let view = view else {return}
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }

}
