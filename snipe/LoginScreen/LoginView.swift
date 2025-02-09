import UIKit

class LoginView: UIView {
    var createAccountButton: UIButton!
    var loginButton: UIButton!
    
    var titleLabel: UILabel!
    var snipeLabel: UILabel!
    
    var emailTextField: UITextField!
    var passwordTextField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setUpButtons()
        setUpLabels()
        setUpFields()
        
        initConstraints()
    }
    
    func setUpButtons() {
        loginButton = UIButton(type: .system)
                loginButton.setTitle("login", for: .normal)
                loginButton.titleLabel?.font = UIFont(name: "LondrinaShadow-Regular", size: 32) ?? UIFont.systemFont(ofSize: 32)
                loginButton.setTitleColor(.black, for: .normal)
                loginButton.translatesAutoresizingMaskIntoConstraints = false

        createAccountButton = UIButton(type: .system)
        createAccountButton.setTitle("create an account", for: .normal)
        createAccountButton.setTitleColor(.black, for: .normal)
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(loginButton)
        self.addSubview(createAccountButton)
    }
    
    func setUpLabels() {
        titleLabel = UILabel()
                titleLabel.text = "get ready to"
                titleLabel.textColor = .black
                titleLabel.textAlignment = .center
                titleLabel.font = UIFont(name: "LondrinaShadow-Regular", size: 32) ?? UIFont.systemFont(ofSize: 32, weight: .medium)
                titleLabel.attributedText = NSAttributedString(string: "get ready to", attributes: [NSAttributedString.Key.kern: 5])
                titleLabel.translatesAutoresizingMaskIntoConstraints = false
                self.addSubview(titleLabel)
        
        snipeLabel = UILabel()
        snipeLabel.text = "SNIPE"
        snipeLabel.textColor = UIColor(red: 146/255, green: 16/255, blue: 16/255, alpha: 1.0)
        snipeLabel.textAlignment = .center
        snipeLabel.font = UIFont(name: "CHIBOLD demo", size: 96) ?? UIFont.systemFont(ofSize: 96, weight: .bold)
        snipeLabel.layer.shadowColor = UIColor.black.cgColor
        snipeLabel.layer.shadowOffset = CGSize(width: 2, height: 2)
        snipeLabel.layer.shadowOpacity = 0.3
        snipeLabel.layer.shadowRadius = 2
        snipeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(snipeLabel)
    }
    
    func setUpFields() {
        emailTextField = UITextField()
        emailTextField.placeholder = "enter email"
        emailTextField.borderStyle = .none
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(emailTextField)
        
        let emailLine = UIView()
        emailLine.backgroundColor = .black
        emailLine.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(emailLine)
        
        passwordTextField = UITextField()
        passwordTextField.placeholder = "enter password"
        passwordTextField.borderStyle = .none
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(passwordTextField)
        
        let passwordLine = UIView()
        passwordLine.backgroundColor = .black
        passwordLine.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(passwordLine)
        
        NSLayoutConstraint.activate([
            emailLine.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 5),
            emailLine.centerXAnchor.constraint(equalTo: emailTextField.centerXAnchor),
            emailLine.widthAnchor.constraint(equalTo: emailTextField.widthAnchor, multiplier: 1),
            emailLine.heightAnchor.constraint(equalToConstant: 1),
            
            passwordLine.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 5),
            passwordLine.centerXAnchor.constraint(equalTo: passwordTextField.centerXAnchor),
            passwordLine.widthAnchor.constraint(equalTo: passwordTextField.widthAnchor, multiplier: 1),
            passwordLine.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 150),
            
            snipeLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            snipeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            
            emailTextField.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: snipeLabel.bottomAnchor, constant: 80),
            emailTextField.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7),
            
            passwordTextField.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 40),
            passwordTextField.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7),
            
            loginButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 80),
            loginButton.widthAnchor.constraint(equalToConstant: 120),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            
            createAccountButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            createAccountButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -60)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
