//
//  ViewController.swift
//  AprendiendoYablas
//
//  Created by José Conejero Sivó on 23/11/25.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Referencia de la table
    
    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource = [
        "@Lucas",
        "@Estrella",
        "@Blanca",
        "@David"
    ]
    
    /**
     1. Implementar DataSource <- Interfaz
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // No olvidarse !!!
        tableView.dataSource =  self
        
        // tableView.register(UITableViewCell.self, forCellReuseIdentifier: "mi-celda")
        
        tableView.register(UINib(nibName: "TweetTableViewCell", bundle: nil), forCellReuseIdentifier: "TweetTableViewCell")
        
        // Para interacturar, implementar el delegate
        tableView.delegate = self
    }


}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("La celda #\(indexPath.row) fué seleccionada.")
    }
}

// MARK - UITableViewDataSource
extension ViewController: UITableViewDataSource {
     // 1. Numero de filas que tendra nuestra tabla
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return 20
        return dataSource.count
    }
    
    // 2. Método para saber que celdas deben mostrase
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetTableViewCell", for: indexPath)

        if let newCell = cell as? TweetTableViewCell {
            // username: "@usuario\(indexPath.row)"
            newCell.setUpCell(username: dataSource[indexPath.row], message: "Soy un Tweet!")
        }
        // (cell as? TweetTableViewCell)?.setUpCell(username: "@usuario\(indexPath.row)", message: "Soy un Tweet!")
        //cell.textLabel?.text = "Soy la celda #\(indexPath.row)"
        
        return cell
    }
}
