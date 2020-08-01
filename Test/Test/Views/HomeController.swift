//
//  HomeController.swift
//  Test
//
//  Created by MagdielG on 24/07/20.
//

import UIKit

@available(iOS 13.0, *)
class HomeController: UIViewController {
    
    private let containerMenu: UIView = {
        let menuContainer = UIView()
        menuContainer.backgroundColor = .white
        menuContainer.layer.cornerRadius = 100/4
        menuContainer.layer.shadowOpacity = 0.25
        menuContainer.layer.shadowOffset = CGSize(width: 1, height: 1)
        menuContainer.layer.shadowRadius = 75/9
        menuContainer.layer.masksToBounds = false
        return menuContainer
    }()
    
    private let menuBars: UIButton = {
        let menu = UIButton(type: .system)
        menu.setImage(#imageLiteral(resourceName: "menuBars").withRenderingMode(.alwaysOriginal),  for: .normal)
        menu.addTarget(self, action: #selector(showMenu), for: .touchUpInside)
        menu.tintColor = .black
        return menu
    }()
    
    
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Test"
        title.textColor = .black
        title.font =  UIFont(name: "Avenir-Light", size: 80)
        return title
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()

    }
    

    
    // MARK: - Navigation
    
    private func configureUI(){
        
        view.addSubview(containerMenu)
        containerMenu.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, paddingTop: 20, paddingLeft: 20, width: 50, height: 50)
        
        view.addSubview(menuBars)
        menuBars.anchor(width: 23, height: 17)
        menuBars.centerY(inView: containerMenu)
        menuBars.centerX(inView: containerMenu)
        
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.topAnchor, paddingTop: 250)
        titleLabel.centerX(inView: view)
        
        view.backgroundColor = .bordersColors
    
    }

    
    @objc func showMenu() {
            print("Show Menu")
        }
   
    }


    


