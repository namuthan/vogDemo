//
//  DetailViewController.swift
//  VogDemo
//
//  Created by Nabil Muthanna on 2018-04-06.
//  Copyright © 2018 nabilmuthanna. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let _username: String
    
    
    private lazy var _imgView: VogImageView = {
        let imgView = VogImageView(frame: .zero)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleToFill
        imgView.image = #imageLiteral(resourceName: "vogLogo")
        let gr = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imgView.addGestureRecognizer(gr)
        imgView.isUserInteractionEnabled = true
        return imgView
    }()
    private lazy var _prevBtn: RoundedButton = {
        let btn = RoundedButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("Previous", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.backgroundColor = StyleSheet.defaultTheme.mainColor
        btn.addTarget(self, action: #selector(navigateBack), for: .touchUpInside)
        btn.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        btn.tintColor = .white
        return btn
    }()
    
    init(username: String) {
        self._username = username
        super.init(nibName: nil, bundle: nil)
        self._imgView.username = username
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = StyleSheet.defaultTheme.backgroundColor
        
        setupUI()
    }
    
    private func setupUI() {
        view.addSubviews([_imgView, _prevBtn])
        
        NSLayoutConstraint.activate([
            
            _imgView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            _imgView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            _imgView.heightAnchor.constraint(equalToConstant: 200),
            _imgView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            _prevBtn.topAnchor.constraint(equalTo: _imgView.bottomAnchor, constant: 16),
            _prevBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            _prevBtn.heightAnchor.constraint(equalToConstant: 69),
            _prevBtn.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func navigateBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func imageTapped() {
        _imgView.togglePreviewView()
    }
    
    
}
