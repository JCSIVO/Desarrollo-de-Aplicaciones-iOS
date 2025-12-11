//
//  MainViewModel.swift
//  UserDefaultsExamples
//
//  Created by José Conejero Sivó on 8/12/25.
//

import Foundation

class MainViewModel: ObservableObject {
    
    @Published var nickname: String = ""
    var canDelete: Bool = false
    let defaults = UserDefaults.standard
    private let nicknameKey = "nickname"
    
    func getNickname() {
        // TODO: Obtner de UserDefaults
        if let savedNickname = defaults.string(forKey: nicknameKey) {
            canDelete = true
            nickname = savedNickname
        } else {
            canDelete = false
            nickname = ""
        }
    }
    
    
    func setNickname() {
        // TODO: Guardar / Actualizar de UserDefaults
        defaults.set(nickname, forKey: nicknameKey)
        getNickname()
    }
    
    func deleteNickname() {
        // TODO: Eliminar de UserDefaults
        defaults.removeObject(forKey: nicknameKey)
        getNickname()
    }
}
