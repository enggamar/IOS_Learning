
import UIKit
import SwiftyJSON
import Firebase

extension UITextField{

    func setBottomBorder(){
        self.layer.shadowColor=UIColor.darkGray.cgColor
        self.layer.shadowOffset=CGSize(width: 0.0,height: 1.0)
        self.layer.shadowOpacity=0.3
        self.layer.shadowRadius=0.0
    }
}
// Put this piece of code anywhere you like
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

class LoginController: UIViewController {

    @IBOutlet weak var userNameField: UITextField!
     @IBOutlet weak var forgetLabel: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    var userName : String = ""
    var password: String = ""
    let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        initilization()
        let tap = UITapGestureRecognizer(target: self, action: #selector(LoginController.forgetLabelClicked))
        forgetLabel.addGestureRecognizer(tap)
    }

    @objc func initilization(){
        navigationController?.setNavigationBarHidden(true, animated: false)
        userNameField.setBottomBorder()
                          passwordField.setBottomBorder()
                          passwordField.isSecureTextEntry=true
                          forgetLabel.isUserInteractionEnabled=true
    }
    
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        
        if (validateLogin()){
            ProgressUtils.progressDialog.showProgressView()
            networkManager.doLogin(userName: userNameField.text ?? "", password: passwordField.text ?? "", { (responseObject:JSON?, error:String?) in
                ProgressUtils.progressDialog.hideProgressView()
                if (error != nil) {
                    self.showErrorPopUp(title: "Error", msg: "Usename or passwod is invalid")
                } else {
                    self.fireBaseLoginAction()
                }
            })
        }
    }
    
    
    func fireBaseLoginAction() -> Void {
        Auth.auth().signIn(withEmail: userName, password: password) { authResult, error in
           if let e = error {
            self.showErrorPopUp(title: "Error", msg: e as! String)
            }else {
            self.performSegue(withIdentifier: Constants.HOME_SEGUE, sender: self)
            }
        }
    }

    @objc func forgetLabelClicked(){
        self.performSegue(withIdentifier: Constants.FORGOT_SEGUE, sender: self)
    }
    
    @objc func validateLogin()-> Bool{
        self.userName = userNameField.text ?? ""
        self.password=passwordField.text ?? ""
        if (userName.isEmpty) {
            showErrorPopUp(title: "Error",msg: "Please Enter Username")
            return false
        }else if password.isEmpty{
            showErrorPopUp(title: "Error", msg: "Please Enter Password")
            return false
        }

        return true
    }

    
    @objc func showErrorPopUp(title:String,msg:String){
        
        let alert=UIAlertController(title:title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
        }))
        self.present(alert,animated: true,completion: nil)
    
    }

}
