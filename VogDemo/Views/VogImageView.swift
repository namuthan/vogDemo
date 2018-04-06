//
//  VogImageView.swift
//  VogDemo
//
//  Created by Nabil Muthanna on 2018-04-06.
//  Copyright © 2018 nabilmuthanna. All rights reserved.
//

import UIKit

func flatten<A>(x: A??) -> A? {
    if let y = x { return y }
    return nil
}

infix operator >>>=
@discardableResult
public func >>>= <A, B> (optional: A?, f: (A) -> B?) -> B? {
    return flatten(x: optional.map(f))
}

class VogImageView: UIImageView {
    
    // MARK: - API
    
    var username: String? {
        didSet {
            username >>>= {
                _usernameLabel.text = "Hello \($0)"
            }
        }
    }
    
    // MARK: - private properties
    
    private var preivewViewIsShown: Bool = false
    
    
    // MARK: Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    private lazy var _previewView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0.0
        return view
    }()
    
    private lazy var _usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont (name: "Cochin", size: 25)
        label.textColor = StyleSheet.defaultTheme.secondaryColor
        label.adjustsFontSizeToFitWidth = true
        label.lineBreakMode = .byClipping
        label.numberOfLines = 0
        label.textAlignment = .center
        label.minimumScaleFactor = 0.8
        return label
    }()
    
    
    // MARK: - Layout
    
    private func setupUI() {
        
        _previewView.addSubviews([_usernameLabel])
        addSubviews([_previewView])
        
        _usernameLabel.center()
        _usernameLabel.layoutTo(edges: [.left, .right], ofView: _previewView, withMargin: 8)
        _previewView.layoutTo(edges: [.left, .top, .right, .bottom], ofView: self, withMargin: -2)
    }
    
    // MARK: - Event Handlers
    
    @objc func togglePreviewView() {
        preivewViewIsShown = !preivewViewIsShown
        if(preivewViewIsShown) {
            showPreviewView()
        } else {
            hidePreviewView()
        }
    }
    
    func hidePreviewView() {
        UIView.animate(withDuration: 0.33, animations: { [weak self] in
            self?._previewView.alpha = 0.0
        })
    }
    
    func showPreviewView() {
        UIView.animate(withDuration: 0.33, animations: { [weak self] in
            self?._previewView.alpha = 1.0
        })
    }
    
}
