//
//  ViewController.swift
//  Dardesh
//
//  Created by Abdelrahman Nada on 09/12/2021.
//

import UIKit
import ProgressHUD

class LoginVC: UIViewController {
    
    // MARK: - IBOutlets
    // MARK: - LabelOutlet
    @IBOutlet weak var lblTitleOutlet: UILabel!
    @IBOutlet weak var lblEmailOutlet: UILabel!
    @IBOutlet weak var lblPasswordOutlet: UILabel!
    @IBOutlet weak var lblConfirmPasswordOutlet: UILabel!
    @IBOutlet weak var lblHaveAnAccountOutlet: UILabel!
    // MARK: - TextFieldOutlet
    @IBOutlet weak var txtEmailOutlet: UITextField!
    @IBOutlet weak var txtPasswordOutlet: UITextField!
    @IBOutlet weak var txtConfirmPasswordOutlet: UITextField!
    // MARK: - ButtonOutlet
    @IBOutlet weak var btnForgetPasswordOutlet: UIButton!
    @IBOutlet weak var btnResendEmailOutlet: UIButton!
    @IBOutlet weak var btnRegisterOutlet: UIButton!
    @IBOutlet weak var btnLoginOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - Make Label is empty
        lblEmailOutlet.text = ""
        lblPasswordOutlet.text = ""
        lblConfirmPasswordOutlet.text = ""
        // MARK: - Textfield Delegate
        txtEmailOutlet.delegate = self
        txtPasswordOutlet.delegate = self
        txtConfirmPasswordOutlet.delegate = self
        // MARK: - Make it "Forget Password Button" invisible with the start.
        btnForgetPasswordOutlet.isHidden = true
        setupBackgroundTap()
    }
    // MARK: - Variables
    var isLogin: Bool = false
    
    // MARK: - IBAction
    // MARK: - Forget Password Button
    @IBAction func btnForgetPasswordPressed(_ sender: UIButton) {
        // MARK: - Validation with if Statement By switch
        if isDataInputedFor(mode: "forgetPassword") {
            print("OK")
        } else {
            // MARK: - Show error with ProgressHUD
            ProgressHUD.showError("Error, all data is required.")
            // MARK: - Alert
            //            let alert = UIAlertController()
            //            let alertAction = UIAlertAction(title: "Error all data is required.", style: .destructive, handler: nil)
            //            alert.addAction(alertAction)
            //            present(alert, animated: true, completion: nil)
        }
    }
    // MARK: - Resend Email Button
    @IBAction func btnResendEmailPressed(_ sender: UIButton) {
        // MARK: - Validation with if Statement By switch
        if isDataInputedFor(mode: "resendEmail") {
            print("OK")
        } else {
            ProgressHUD.showError("Please fill E-mail field")
        }
    }
    // MARK: - Register Button
    @IBAction func btnRegisterPressed(_ sender: UIButton) {
        // MARK: - Validation
        // MARK: - Validation with if Statement By switch
        if isDataInputedFor(mode: isLogin ? "login" : "register") {
            print("OK")
        } else {
            // MARK: - Show error with ProgressHUD
            ProgressHUD.showError("Error, all data is required.")
            // MARK: - Alert
            //            let alert = UIAlertController()
            //            let alertAction = UIAlertAction(title: "Error all data is required.", style: .destructive, handler: nil)
            //            alert.addAction(alertAction)
            //            present(alert, animated: true, completion: nil)
        }
        // MARK: - Guard Validation & Custom Alert
        //        guard !txtEmailOutlet.text!.isEmpty, !txtPasswordOutlet.text!.isEmpty, !txtConfirmPasswordOutlet.text!.isEmpty else {
        //            customAlert(title: "Error", message: "Please fill all fields are required.", alertStyle: .alert, buttonTitle: "OK", buttonStyle: .destructive)
        //            return
        //        }
        // MARK: - Validation with if Statement & Custom Alert
        //        if txtEmailOutlet.text!.isEmpty == true && txtPasswordOutlet.text!.isEmpty == true && txtConfirmPasswordOutlet.text!.isEmpty == true {
        //            customAlert(title: "Error", message: "Please fill all fields are required.", alertStyle: .alert, buttonTitle: "OK", buttonStyle: .destructive)
        //        } else if txtEmailOutlet.text!.isEmpty == true && txtPasswordOutlet.text!.isEmpty == false && txtConfirmPasswordOutlet.text!.isEmpty == false {
        //            customAlert(title: "Error", message: "Please Fill your E-mail.", alertStyle: .alert, buttonTitle: "OK", buttonStyle: .destructive)
        //        } else if txtEmailOutlet.text!.isEmpty == false && txtPasswordOutlet.text!.isEmpty == true && txtConfirmPasswordOutlet.text!.isEmpty == true {
        //            customAlert(title: "Error", message: "Please Fill password and confirm password.", alertStyle: .alert, buttonTitle: "OK", buttonStyle: .destructive)
        //        } else if txtEmailOutlet.text!.isEmpty == false && txtPasswordOutlet.text!.isEmpty == false && txtConfirmPasswordOutlet.text!.isEmpty == true {
        //            customAlert(title: "Error", message: "Please fill confirm password", alertStyle: .alert, buttonTitle: "OK", buttonStyle: .destructive)
        //        } else {
        //            return
        //        }
    }
    // MARK: - Login Button
    @IBAction func btnLoginPressed(_ sender: UIButton) {
        updateUIMode(mode: isLogin)
    }
    // MARK: - Func Login Page toggle
    private func updateUIMode(mode: Bool) {
        if !mode {
            lblTitleOutlet.text = "Login"
            lblConfirmPasswordOutlet.isHidden = true
            txtConfirmPasswordOutlet.isHidden = true
            btnForgetPasswordOutlet.isHidden = false
            btnResendEmailOutlet.isHidden = true
            btnRegisterOutlet.setTitle("Login", for: .normal)
            lblHaveAnAccountOutlet.text = "New Here?"
            btnLoginOutlet.setTitle("Register", for: .normal)
        } else {
            lblTitleOutlet.text = "Register"
            lblConfirmPasswordOutlet.isHidden = false
            txtConfirmPasswordOutlet.isHidden = false
            btnForgetPasswordOutlet.isHidden = true
            btnResendEmailOutlet.isHidden = false
            btnRegisterOutlet.setTitle("Register", for: .normal)
            lblHaveAnAccountOutlet.text = "Have an account?"
            btnLoginOutlet.setTitle("Login", for: .normal)
        }
        isLogin.toggle()
    }
    // MARK: - Helpers or Utilities
    private func isDataInputedFor(mode: String) ->Bool {
        switch mode {
        case "login":
            return txtEmailOutlet.text != "" &&
            txtPasswordOutlet.text != ""
        case "register":
            return txtEmailOutlet.text != "" &&
            txtPasswordOutlet.text != "" &&
            txtConfirmPasswordOutlet.text != ""
        case "forgetPassword":
            return txtEmailOutlet.text != ""
        case "resendEmail":
            return txtEmailOutlet.text != ""
        default:
            return false
        }
    }
    // MARK: - Tap Gesture
    func setupBackgroundTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard () {
        view.endEditing(false)
    }
}
// MARK: - Extention
// MARK: - Extention for textfield Delegate
extension LoginVC: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        // MARK: - Show label with writing at textfiled
        lblEmailOutlet.text = txtEmailOutlet.hasText ? "E-mail" : ""
        lblPasswordOutlet.text = txtPasswordOutlet.hasText ? "Password" : ""
        lblConfirmPasswordOutlet.text = txtConfirmPasswordOutlet.hasText ? "Confirm Password" : ""
    }
    // MARK: - Custom Alert
    func customAlert(title: String, message: String, alertStyle: UIAlertController.Style, buttonTitle: String, buttonStyle: UIAlertAction.Style) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: alertStyle)
        let alertAction = UIAlertAction(title: buttonTitle, style: buttonStyle, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
}
