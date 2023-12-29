//
//  StorageManager.swift
//  iosSchool_HH
//
//  Created by student on 04.12.2023.
//

import Foundation
import KeychainAccess

protocol StorageManager {
    func cleanKeychainIfNeeded()
    func saveToken(token: TokenResponse)
    func getToken() -> TokenResponse?
    func removeToken()
    func lastLoginTime()
    func getLastLoginTime() -> String
    func saveLogin(login: String)
    func getLogin() -> String?
    func removeLogin()
}

class StorageManagerImp: StorageManager {

    private let keychain = Keychain(service: Constants.serviceId)

    func cleanKeychainIfNeeded() {
        guard !notFirstLaunch() else {
            return
        }
        do {
            try keychain.removeAll()
        } catch {
            print(error as Any)
        }
        saveFirstLaunch()
    }

    func saveToken(token: TokenResponse) {
        do {
            try keychain.set(token.token, key: StorageManagerKey.token.rawValue)
            lastLoginTime()
        } catch {
            print(error as Any)
        }
    }

    func getToken() -> TokenResponse? {
        do {
            guard let token = try keychain.get(StorageManagerKey.token.rawValue) else {
                return nil
            }
            return TokenResponse(token: token)
        } catch {
            print(error as Any)
        }
        return nil
    }

    func removeToken() {
        do {
            try keychain.remove(StorageManagerKey.token.rawValue)
        } catch {
            print(error as Any)
        }
    }

    func lastLoginTime() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        UserDefaults.standard.set(
            dateFormatter.string(from: Date()),
            forKey: StorageManagerKey.lastTimeLogin.rawValue
        )
    }

    func getLastLoginTime() -> String {
        UserDefaults.standard.string(forKey: StorageManagerKey.lastTimeLogin.rawValue) ?? ".. .. ...."
    }

    func saveLogin(login: String) {
        UserDefaults.standard.set(login, forKey: StorageManagerKey.login.rawValue)
    }

    func getLogin() -> String? {
        UserDefaults.standard.string(forKey: StorageManagerKey.login.rawValue)
    }

    func removeLogin() {
        UserDefaults.standard.removeObject(forKey: StorageManagerKey.login.rawValue)
    }
}

private extension StorageManagerImp {

    enum StorageManagerKey: String {
        case token
        case login
        case notFirstLaunch
        case lastTimeLogin
    }

    struct Constants {
        static let serviceId = "StorageManagerKeychain.Service.Id"
    }

    func notFirstLaunch() -> Bool {
        UserDefaults.standard.bool(forKey: StorageManagerKey.notFirstLaunch.rawValue)
    }

    func saveFirstLaunch() {
        UserDefaults.standard.set(true, forKey: StorageManagerKey.notFirstLaunch.rawValue)
    }
}
