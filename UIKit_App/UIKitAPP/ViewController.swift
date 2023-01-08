//
//  ViewController.swift
//  UIKitAPP
//
//  Created by Олег Стригунов on 04.01.2023.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - Outlets
    
    //Icons
    let userLogin = UIImage(named: "userLogin")
    let passwordLogin = UIImage(named: "passwordLogin")
    let doneLogin = UIImage(named: "doneLogin")
    
    private lazy var buttonLogin: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(press), for: .touchUpInside)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = UIColor(red: 86.0/255, green: 98.0/255, blue: 197.0/255, alpha: 1.0)
        button.layer.cornerRadius = 24
        //тень к кнопке
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonFacebook: UIButton = {
        let button = UIButton(configuration: .plain())
        button.addTarget(self, action: #selector(press), for: .touchUpInside)
        button.setTitle("Facebook", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.contentHorizontalAlignment = .left
        button.backgroundColor = UIColor(red: 49/255, green: 144/255, blue: 234/255, alpha: 1.0)
        button.layer.cornerRadius = 20
        //тень к кнопке
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        //иконка
        button.setImage(UIImage(named: "iconFacebook"), for: .normal)
        button.configuration?.imagePadding = 10
        button.configuration?.cornerStyle = .capsule
        button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonTwitter: UIButton = {
        let button = UIButton(configuration: .plain())
        button.addTarget(self, action: #selector(press), for: .touchUpInside)
        button.setTitle("Twitter", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.contentHorizontalAlignment = .left
        button.backgroundColor = UIColor(red: 69/255, green: 93/255, blue: 166/255, alpha: 1.0)
        button.layer.cornerRadius = 20
        //тень к кнопке
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        //иконка
        button.setImage(UIImage(named: "iconTwitter"), for: .normal)
        button.configuration?.imagePadding = 10
        button.configuration?.cornerStyle = .capsule
        button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonForgotPswd: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(press), for: .touchUpInside)
        button.setTitle("Forgot your password?", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonSignUp: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(press), for: .touchUpInside)
        button.setTitle("Sign up", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var labelLogin: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelSignUp: UILabel = {
        let label = UILabel()
        label.text = "Dont have account?"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .gray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelSocialConnect: UILabel = {
        let label = UILabel()
        label.text = "or connect with"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .gray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var textFieldUser: UITextField = {
        let textFieldUser = UITextField()
        textFieldUser.placeholder = "keanureeves01"
        textFieldUser.font = UIFont.systemFont(ofSize: 15)
        textFieldUser.borderStyle = UITextField.BorderStyle.roundedRect
        textFieldUser.autocorrectionType = UITextAutocorrectionType.no
        textFieldUser.keyboardType = UIKeyboardType.default
        textFieldUser.returnKeyType = UIReturnKeyType.done
        textFieldUser.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textFieldUser.translatesAutoresizingMaskIntoConstraints = false
        textFieldUser.layer.cornerRadius = 24
        textFieldUser.layer.borderWidth = 1.0
        textFieldUser.layer.borderColor = UIColor.white.cgColor
        textFieldUser.clipsToBounds = true
        textFieldUser.setLeftIcon(userLogin ?? UIImage())
        textFieldUser.setRightIcon(doneLogin ?? UIImage())
        //textFieldUser.delegate = self
        return textFieldUser
    }()
    
    private lazy var textFieldPassword: UITextField = {
        let textFieldPassword = UITextField()
        textFieldPassword.placeholder = "Password"
        textFieldPassword.font = UIFont.systemFont(ofSize: 15)
        textFieldPassword.borderStyle = UITextField.BorderStyle.roundedRect
        textFieldPassword.autocorrectionType = UITextAutocorrectionType.no
        textFieldPassword.keyboardType = UIKeyboardType.default
        textFieldPassword.returnKeyType = UIReturnKeyType.done
        textFieldPassword.isSecureTextEntry = true
        textFieldPassword.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        textFieldPassword.layer.cornerRadius = 24
        textFieldPassword.layer.borderWidth = 1.0
        textFieldPassword.layer.borderColor = UIColor.white.cgColor
        textFieldPassword.clipsToBounds = true
        textFieldPassword.setLeftIcon(passwordLogin ?? UIImage())
        //textFieldPassword.delegate = self
        return textFieldPassword
    }()
    
    private lazy var leftlineUIView: UIView = {
        let line = UIView()
        line.backgroundColor = .gray
        line.alpha = 0.1
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    private lazy var rightlineUIView: UIView = {
        let line = UIView()
        line.backgroundColor = .gray
        line.alpha = 0.1
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    private lazy var stackSignUp: UIStackView = {
        let stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.horizontal
        stack.distribution  = UIStackView.Distribution.equalSpacing
        stack.alignment = UIStackView.Alignment.center
        stack.addArrangedSubview(labelSignUp)
        stack.addArrangedSubview(buttonSignUp)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var stackSocialLogin: UIStackView = {
        let stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.horizontal
        stack.distribution  = UIStackView.Distribution.equalSpacing
        stack.alignment = UIStackView.Alignment.center
        stack.addArrangedSubview(buttonFacebook)
        stack.addArrangedSubview(buttonTwitter)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var stackSocialItem: UIStackView = {
        let stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.horizontal
        stack.distribution  = UIStackView.Distribution.equalSpacing
        stack.alignment = UIStackView.Alignment.center
        stack.addArrangedSubview(leftlineUIView)
        stack.addArrangedSubview(labelSocialConnect)
        stack.addArrangedSubview(rightlineUIView)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // mainLayer градиент
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [ UIColor(red: 0.80, green: 0.70, blue:  0.98, alpha: 1.0).cgColor, UIColor(red: 0.58, green: 0.70, blue: 0.97, alpha: 1.0).cgColor ]

        // secondaryLayer градиент
        let gradientLayerSecond = CAGradientLayer()
        gradientLayerSecond.frame = view.bounds
        gradientLayerSecond.colors = [UIColor(red: 0.68, green: 0.54, blue:  0.80, alpha: 1.0).cgColor, UIColor(red: 0.92, green: 0.65, blue:  0.91, alpha: 1.0).cgColor]
        gradientLayerSecond.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayerSecond.endPoint = CGPoint(x: 1, y: 0.5)
        //gradientLayerSecond.cornerRadius = 16
        
        // mainLayer слой
        let mainLayer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height * 0.75))
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: mainLayer.frame.height - 150))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: mainLayer.frame.width, y: 0))
        path.addLine(to: CGPoint(x: mainLayer.frame.width, y: mainLayer.frame.height - 100))
        path.addCurve(to: CGPoint(x: 0, y: mainLayer.frame.height - 100), controlPoint1: CGPoint(x: mainLayer.frame.width / 2, y: mainLayer.frame.height - 200), controlPoint2: CGPoint(x: ((mainLayer.frame.width / 2) - 50), y: mainLayer.frame.height))
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        mainLayer.layer.mask = shapeLayer
        mainLayer.layer.insertSublayer(gradientLayer, at: 0)
        mainLayer.layer.zPosition = -1
        
        self.view.addSubview(mainLayer)
        
        //secondaryLayer слой
        let secondaryLayer = UIView(frame: CGRect(x: mainLayer.frame.size.width - (mainLayer.frame.size.width * 0.7), y: mainLayer.frame.size.height - 175, width: mainLayer.frame.size.width * 0.7, height: 100))
        let pathSecond = UIBezierPath()
        pathSecond.move(to: CGPoint(x: secondaryLayer.frame.width, y: 0))
        pathSecond.addLine(to: CGPoint(x: secondaryLayer.frame.width, y: secondaryLayer.frame.height))
        pathSecond.addCurve(to: CGPoint(x: 0, y: secondaryLayer.frame.height * 0.9),
                            controlPoint1: CGPoint(x: secondaryLayer.frame.width * 0.6, y: secondaryLayer.frame.height * 0.7),
                            controlPoint2: CGPoint(x: secondaryLayer.frame.width * 0.4, y: secondaryLayer.frame.height * 0.7))
        pathSecond.addLine(to: CGPoint(x: 0, y: 0))
        pathSecond.addLine(to: CGPoint(x: secondaryLayer.frame.width, y: 0))
        pathSecond.close()
        
        let shapeLayerSecond = CAShapeLayer()
        shapeLayerSecond.path = pathSecond.cgPath
        secondaryLayer.layer.mask = shapeLayerSecond
        secondaryLayer.layer.insertSublayer(gradientLayerSecond, at: 0)
        secondaryLayer.layer.zPosition = -2
        
        self.view.addSubview(secondaryLayer)
        
        setupHierarchy()
        setupLayout()
    }
    
    
    //MARK: - Setup
    
    private func setupHierarchy() {
        view.backgroundColor = .white
        view.addSubview(labelLogin)
        view.addSubview(textFieldUser)
        view.addSubview(textFieldPassword)
        view.addSubview(buttonLogin)
        view.addSubview(buttonForgotPswd)
        view.addSubview(stackSignUp)
        view.addSubview(stackSocialLogin)
        view.addSubview(stackSocialItem)
    }
    
    private func setupLayout() {
        //labelLogin
        labelLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelLogin.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.1).isActive = true
        labelLogin.widthAnchor.constraint(equalToConstant: 250).isActive = true
        labelLogin.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //textFieldUser
        textFieldUser.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textFieldUser.topAnchor.constraint(equalTo: labelLogin.bottomAnchor, constant: view.frame.height / 20).isActive = true
        textFieldUser.widthAnchor.constraint(equalToConstant: view.frame.width - 100).isActive = true
        textFieldUser.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        //textFieldPassword
        textFieldPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textFieldPassword.topAnchor.constraint(equalTo: textFieldUser.bottomAnchor, constant: 20).isActive = true
        textFieldPassword.widthAnchor.constraint(equalToConstant: view.frame.width - 100).isActive = true
        textFieldPassword.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        //buttonLogin
        buttonLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonLogin.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: view.frame.height / 16).isActive = true
        buttonLogin.widthAnchor.constraint(equalToConstant: view.frame.width - 100).isActive = true
        buttonLogin.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        //buttonForgotPswd
        buttonForgotPswd.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonForgotPswd.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: 20).isActive = true
        buttonForgotPswd.widthAnchor.constraint(equalToConstant: view.frame.width - 100).isActive = true
        buttonForgotPswd.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        //stackSignUp
        stackSignUp.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackSignUp.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        stackSignUp.widthAnchor.constraint(equalToConstant: 164).isActive = true
        stackSignUp.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        buttonFacebook.widthAnchor.constraint(equalToConstant: 160).isActive = true
        buttonFacebook.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        buttonTwitter.widthAnchor.constraint(equalToConstant: 160).isActive = true
        buttonTwitter.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //stackSocialLogin
        stackSocialLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackSocialLogin.bottomAnchor.constraint(equalTo: stackSignUp.bottomAnchor, constant: -view.frame.height / 16).isActive = true
        stackSocialLogin.widthAnchor.constraint(equalToConstant: 340).isActive = true
        stackSocialLogin.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        labelSocialConnect.widthAnchor.constraint(equalToConstant: 100).isActive = true
        labelSocialConnect.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        leftlineUIView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        leftlineUIView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        rightlineUIView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        rightlineUIView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        //stackSocialItem
        stackSocialItem.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackSocialItem.bottomAnchor.constraint(equalTo: stackSocialLogin.bottomAnchor, constant: -54).isActive = true
        stackSocialItem.widthAnchor.constraint(equalToConstant: 320).isActive = true
        stackSocialItem.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    
    //MARK: - Actions
    
    @objc private func press() {
        print("buttom pressed")
    }
    
}

extension UITextField {
    func setLeftIcon(_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 30, y: 5, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 30, y: 0, width: 60, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
    
    func setRightIcon(_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 25, y: 5, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 30, y: 0, width: 60, height: 30))
        iconContainerView.addSubview(iconView)
        rightView = iconContainerView
        rightViewMode = .always
    }
}


