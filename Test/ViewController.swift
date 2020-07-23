//
//  ViewController.swift
//  Test
//
//  Created by MagdielG on 22/07/20.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    private let emailTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Email", isSecureTextEntry: false)
      }()
    
    private let passwordTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Password", isSecureTextEntry: true)
      }()
    
    
    private var tapBars: UIView = {
        let bottomBars = UIView()
        bottomBars.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        bottomBars.heightAnchor.constraint(equalToConstant: 50).isActive = true
        bottomBars.layer.borderWidth = 0.4
        bottomBars.layer.borderColor = UIColor.bordersColors.cgColor
        bottomBars.layer.shadowOpacity = 0.55
        bottomBars.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        bottomBars.layer.masksToBounds = false
        return bottomBars
    }()
    
    private let emailContainerView: UIView = {
        let emailView = UIView()
        emailView.layer.cornerRadius = 15
        emailView.backgroundColor = .white
        emailView.layer.borderWidth = 0.5
        emailView.layer.borderColor = UIColor.bordersColors.cgColor
        return emailView
    }()
    
    private let passwordContainerView: UIView = {
        let passwordContainerView = UIView()
        passwordContainerView.layer.cornerRadius = 15
        passwordContainerView.backgroundColor = .white
        passwordContainerView.layer.borderWidth = 0.5
        passwordContainerView.layer.borderColor = UIColor.bordersColors.cgColor
        return  passwordContainerView
    }()
    
    private let googleViewIcon: UIView = {
        let viewGoogle = UIView()
        viewGoogle.layer.cornerRadius = 12
        viewGoogle.backgroundColor = UIColor(red: 234/255, green: 67/255, blue: 53/255, alpha: 1)
        return viewGoogle
    }()
    
    private let imageViewGoogle: UIButton = {
        let imageViewGoogle = UIButton(type: .system)
        imageViewGoogle.setImage(#imageLiteral(resourceName: "google-brands-2").withRenderingMode(.alwaysOriginal),  for: .normal)
        imageViewGoogle.addTarget(self, action: #selector(loginFromGoogle), for: .touchUpInside)
            return imageViewGoogle
        }()
    
    private let imageViewUser: UIButton = {
        let imageUIUser = UIButton(type: .system)
            imageUIUser.setImage(#imageLiteral(resourceName: "user-solid").withRenderingMode(.alwaysOriginal),  for: .normal)
            imageUIUser.addTarget(self, action: #selector(showHomeController), for: .touchUpInside)
            return imageUIUser
        }()
    
    private let imageViewShop: UIButton = {
        let imageUIShop = UIButton(type: .system)
            imageUIShop.setImage(#imageLiteral(resourceName: "store-alt-solid").withRenderingMode(.alwaysOriginal),  for: .normal)
            imageUIShop.addTarget(self, action: #selector(showViewController), for: .touchUpInside)
        return imageUIShop
        }()
    
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.font =  UIFont(name: "Avenir-Light", size: 40)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
       // view.backgroundColor = UIColor.init(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        
        
        
        
    }
    
    
    /*override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }*/
    
    func configureUI(){
        
        view.addSubview(googleViewIcon)
        googleViewIcon.anchor(top: view.safeAreaLayoutGuide.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 350, paddingRight: 20, width: 55, height: 55)

        view.addSubview(imageViewGoogle)
        imageViewGoogle.anchor(width: 20, height: 20.67)
        imageViewGoogle.centerY(inView: googleViewIcon)
        imageViewGoogle.centerX(inView: googleViewIcon)
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 2)
        titleLabel.centerX(inView: view)
        
        view.addSubview(tapBars)
        tapBars.anchor(left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor)
        tapBars.centerX(inView: view)
        
        view.addSubview(imageViewShop)
        imageViewShop.centerY(inView: tapBars)
        imageViewShop.anchor(left: view.leftAnchor, paddingLeft: 70, width: 30, height: 24)
        
        view.addSubview(imageViewUser)
        imageViewUser.centerY(inView: tapBars)
        imageViewUser.anchor(right: view.rightAnchor, paddingRight: 70, width: 25, height: 28.57)
        
        view.addSubview(emailContainerView)
        emailContainerView.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 12, paddingRight: 12, height: 55)
        
        view.addSubview(emailTextField)
        emailTextField.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 30, paddingRight: 12, height: 55)
        emailTextField.centerY(inView: emailContainerView)
        
        view.addSubview(passwordContainerView)
        passwordContainerView.anchor(top: emailTextField.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 12, paddingRight: 12, height: 55)
        
        view.addSubview(passwordTextField)
        passwordTextField.anchor(top: emailTextField.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 30, paddingRight: 12, height: 55)
        
    }


    @objc func showHomeController() {
            print("Press User Button")
        }
    
    
    @objc func showViewController() {
            print("Press Shop Button")
        }
    
    @objc func loginFromGoogle() {
            print("Press Login From Google")
        }

}

