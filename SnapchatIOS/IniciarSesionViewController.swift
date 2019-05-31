import UIKit
import Firebase

class IniciarSesionViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func iniciarSesionTapped(_ sender: Any) {
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            print("Intentamos Iniciar Sesión")
            if error != nil {
                print("Tenemos el Siguiente Error:\(String(describing: error))")
                FIRAuth.auth()?.createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
                    print("Intentamos crear un Usuario")
                    if error != nil{
                        print("Tenemos el Siguiente Error:\(String(describing: error))")
                    }else {
                        print("El Usuario fue Creado Exitosamente")
                        self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
                    }
                })
            }else {
                print("Inicio de Sesión Exitoso")
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
            }
        })
    }
    
}

