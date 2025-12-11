//
//  ViewController.swift
//  Aprendiendo-Servicios
//
//  Created by José Conejero Sivó on 29/11/25.
//

import UIKit
import Alamofire

// 1. Crear modelo Codable (estructura)
// 2. Utilizar JSONDecoder para serializar Data a Modelo

struct Human: Codable {
    let user: String
    let age: Int
    let isHappy: Bool
}

/**
 {
 "user": "@lucas",
 "age":  23,
 "isHappy": true
 }
 */


class ViewController: UIViewController {
    // MARK: Referencias UI
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetService()
    }
    // Endpoint: http://www.mocky.io/v2/5e2674472f00002800a4f417
    // 1. Crear excepción de seguridad
    // 2. Crear URL con el endpoint
    // 3. Hacer request con la ayuda de URLSession
    // 4. Transformar respuesta a diccionario
    // 5. Ejecutar Request
    
    private func fetService() {
        let endpointString = "http://www.mocky.io/v2/5e2674472f00002800a4f417"
        guard let endpoint = URL(string: endpointString) else {
            return
        }
        // Iniciar el Loader
        activityIndicator.startAnimating()
        
        AF.request(endpoint, method: .get, parameters: nil).responseData{(response: AFDataResponse<Data>) in
            
            
            
            // Detener el loader
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
            }
            if response.error != nil {
                print("Hubo un error")
                return
            }
            guard
                let dataFromService = response.data,
                let model: Human = try? JSONDecoder().decode(Human.self, from: dataFromService) else {
                  // let dictionary = try? JSONSerialization.jsonObject(with: dataFromService, options: []) as? [String: Any] else {
                return
            }
            // Moverlo al hilo principal, porque de normal lo hace en secundario
            // Importante: TODOS los llamados a la UI, se hacen en el main thead
            DispatchQueue.main.async {
                //let isHappy = dictionary["isHappy"] as? Bool ?? false
                
                //self.nameLabel.text = dictionary["user"] as? String
                //self.statusLabel.text = isHappy ? "Estoy Feliz" : "Estoy triste"
                self.nameLabel.text = model.user
                self.statusLabel.text = model.isHappy ? "Estoy Feliz" : "Estoy triste"
            }
        }
        
        // URLSession.shared.dataTask(with: endpoint) {(data: Data?, _, error: Error?) in
           
        }//.resume() //llamada al servicio (Ejecutar el Datatask)
    }
}

