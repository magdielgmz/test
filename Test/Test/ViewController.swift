//
//  ViewController.swift
//  Test
//
//  Created by MagdielG on 22/07/20.
//

import UIKit

@available(iOS 13.0, *)
class ViewController: UIViewController, UITextFieldDelegate {
    
    
    // MARK: - Variables
    
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        //scroll.backgroundColor = .backgroundColor
        return scroll
    }()
    
    
   
    
    
    let forgetPassword : UIButton = {
            let button = UIButton(type: .system)
            let attributeTitle = NSMutableAttributedString(string: "Forget your password?", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            button.addTarget(self, action: #selector(forgetuPassword), for: .touchUpInside)
        button.setAttributedTitle(attributeTitle, for: .normal)
            return button
        }()
    
    
    let dontHaveAcountButton : UIButton = {
            let button = UIButton(type: .system)
            let attributeTitle = NSMutableAttributedString(string: "Don't have Acount?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            attributeTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.mainBlueTint]))
            button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        button.setAttributedTitle(attributeTitle, for: .normal)
            return button
        }()
    
    private let loginButton: UIButton = {
        let loginButtonBlack = UIButton(type: .system)
        loginButtonBlack.backgroundColor = .backgroundColor
        loginButtonBlack.layer.cornerRadius = 15
        loginButtonBlack.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        loginButtonBlack.setTitle("Log In", for: .normal)
        loginButtonBlack.tintColor = .white
        loginButtonBlack.addTarget(self, action: #selector(loginSesion), for: .touchUpInside)
        return loginButtonBlack
    }()
    
    
    private let emailTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Email", isSecureTextEntry: false)
      }()
    
    private let passwordTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Password", isSecureTextEntry: true)
      }()
    
    
   /* private var tapBars: UITabBarController = {
        let bottomBars = UITabBarController()
        /*bottomBars.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        bottomBars.heightAnchor.constraint(equalToConstant: 50).isActive = true
        bottomBars.layer.borderWidth = 0.4
        bottomBars.layer.borderColor = UIColor.bordersColors.cgColor
        bottomBars.layer.shadowOpacity = 0.55
        bottomBars.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        bottomBars.layer.masksToBounds = false*/
        return bottomBars
    }()*/
    
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
    
    private let facebookViewIcon: UIView = {
        let viewFacebook = UIView()
        viewFacebook.layer.cornerRadius = 12
        viewFacebook.backgroundColor = UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1)
        return viewFacebook
    }()
    
    private let appleContainerView: UIView = {
        let appleContainerView = UIView()
        appleContainerView.layer.cornerRadius = 12
        appleContainerView.backgroundColor = .black
        return appleContainerView
    }()
    
    private let imageViewApple: UIButton = {
        let imageViewApple = UIButton(type: .system)
        //imageViewApple.setImage(UIImage(systemName: "applelogo"), for: .normal)
        imageViewApple.setImage(#imageLiteral(resourceName: "apple-brands").withRenderingMode(.alwaysOriginal),  for: .normal)
        imageViewApple.addTarget(self, action: #selector(loginFromApple), for: .touchUpInside)
            return imageViewApple
        }()
    
    private let imageViewFacebook: UIButton = {
        let imageViewFacebook = UIButton(type: .system)
        imageViewFacebook.setImage(#imageLiteral(resourceName: "facebook-f-brands").withRenderingMode(.alwaysOriginal),  for: .normal)
        imageViewFacebook.addTarget(self, action: #selector(loginFromFacebook), for: .touchUpInside)
            return imageViewFacebook
        }()
    
    private let googleViewIcon: UIView = {
        let viewGoogle = UIView()
        viewGoogle.layer.cornerRadius = 12
        viewGoogle.backgroundColor = UIColor(red: 234/255, green: 67/255, blue: 53/255, alpha: 1)
        return viewGoogle
    }()
    
    private let imageViewGoogle: UIButton = {
        let imageViewGoogle = UIButton(type: .system)
        imageViewGoogle.setImage(#imageLiteral(resourceName: "google-brands").withRenderingMode(.alwaysOriginal),  for: .normal)
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
        imageUIShop.alpha = 0.4
        imageUIShop.setImage(#imageLiteral(resourceName: "store-alt-solid").withRenderingMode(.alwaysOriginal),  for: .normal)
        imageUIShop.addTarget(self, action: #selector(showViewController), for: .touchUpInside)
        return imageUIShop
        }()
    
    
    /*private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.textColor = .black
        label.font =  UIFont(name: "Avenir-Light", size: 20)
        return label
    }()*/
    
    // MARK: - Life Clicle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //generateNavController()
        view.backgroundColor = .white
             
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureUI()
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .darkContent
     }
    
    // MARK: - configureUI
    func configureUI(){
        
        view.addSubview(scrollView)
        scrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, height: 1024)
        
        
        scrollView.addSubview(forgetPassword)
        forgetPassword.anchor(top: view.safeAreaLayoutGuide.topAnchor, right: view.rightAnchor, paddingTop: 150, paddingRight: 20)
        
        scrollView.addSubview(dontHaveAcountButton)
        dontHaveAcountButton.anchor(top: forgetPassword.bottomAnchor, paddingTop: 20)
        dontHaveAcountButton.centerX(inView: view)
        
        scrollView.addSubview(loginButton)
        loginButton.anchor(top: dontHaveAcountButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 12, paddingRight: 12,height: 60)
        /*loginButton.centerY(inView: view)*/
        
        scrollView.addSubview(appleContainerView)
        appleContainerView.anchor(top: loginButton.bottomAnchor, paddingTop: 80, width: 55, height: 55)
        appleContainerView.centerX(inView: view)
        
        scrollView.addSubview(imageViewApple)
        imageViewApple.anchor(width: 20, height: 23.77)
        imageViewApple.centerX(inView: appleContainerView)
        imageViewApple.centerY(inView: appleContainerView)
        
        scrollView.addSubview(facebookViewIcon)
        facebookViewIcon.anchor(top: loginButton.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, paddingTop: 80, paddingLeft: 30, width: 55, height: 55)
        
        scrollView.addSubview(imageViewFacebook)
        imageViewFacebook.anchor(width: 16.5, height: 30)
        imageViewFacebook.centerY(inView: facebookViewIcon)
        imageViewFacebook.centerX(inView: facebookViewIcon)
        
        scrollView.addSubview(googleViewIcon)
        googleViewIcon.anchor(top: loginButton.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 80, paddingRight: 30, width: 55, height: 55)

        scrollView.addSubview(imageViewGoogle)
        imageViewGoogle.anchor(width: 20, height: 20.67)
        imageViewGoogle.centerY(inView: googleViewIcon)
        imageViewGoogle.centerX(inView: googleViewIcon)
        
        /*view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 1)
        titleLabel.centerX(inView: view)*/
        
        /*view.addSubview(tapBars)
        tapBars.anchor(left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor)
        tapBars.centerX(inView: view)*/
        
        /*view.addSubview(imageViewShop)
        imageViewShop.centerY(inView: tapBars)
        imageViewShop.anchor(left: view.leftAnchor, paddingLeft: 70, width: 30, height: 24)
        
        view.addSubview(imageViewUser)
        imageViewUser.centerY(inView: tapBars)
        imageViewUser.anchor(right: view.rightAnchor, paddingRight: 70, width: 25, height: 28.57)*/
        
        scrollView.addSubview(emailContainerView)
        emailContainerView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 12, paddingRight: 12, height: 55)
        
        scrollView.addSubview(emailTextField)
        emailTextField.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 30, paddingRight: 12, height: 55)
        emailTextField.centerY(inView: emailContainerView)
        
        scrollView.addSubview(passwordContainerView)
        passwordContainerView.anchor(top: emailContainerView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 12, paddingRight: 12, height: 55)
        
        scrollView.addSubview(passwordTextField)
        passwordTextField.anchor(top: emailTextField.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 30, paddingRight: 12, height: 55)
        
    }
    
    
    /*func generateNavController(){
        let nav = generateNavigationController(vc: HomeViewController(), title: "Home")
        //let nav2 = generateNavigationController(vc: ViewController(), title: "Login")
        
        viewControllers = [nav]
    }
    
    fileprivate func generateNavigationController(vc: UIViewController, title: String) -> UINavigationController{
        vc.navigationItem.title = title
        let navController = UINavigationController(rootViewController: vc)
        navController.title = title
        return navController
    }*/
    
    

    
    // MARK: - Function Buttons
    
    @objc func loginSesion(){
        print("Press Login")
    }
    
    @objc func forgetuPassword(){
        print("Press Forge Password")
    }
    
    @objc func handleShowSignUp(){
        print("Press Dont Have Aacount Button")
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
    
    @objc func loginFromFacebook() {
            print("Press Login From Facebook")
        }
    
    @objc func loginFromApple() {
            print("Press Login From Apple")
        }

}

