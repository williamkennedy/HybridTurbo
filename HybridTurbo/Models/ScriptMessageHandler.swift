//
//  ScriptMessageHandler.swift
//  HybridTurbo
//
//  Created by William Kennedy on 21/07/2022.
//
import WebKit
import Contacts

class ScriptMessageHandler: NSObject, WKScriptMessageHandler {
    func userContentController(
        _ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            guard
                let body = message.body as? [String: Any],
                let msg = body["name"] as? String
            else {
                print("No call")
                return
            }
            handleMessage(msg)
        }

    private func handleMessage(_ message: String) {
        if message == "contacts" {
            fetchContacts()
        } else {
            print("Unknown function call")
        }
    }

    func fetchContacts() {
        let store = CNContactStore()
        var contacts = [CNContact]()
        let keys = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName)]
        let request = CNContactFetchRequest(keysToFetch: keys)

        do {
            try store.enumerateContacts(with: request) { (contact, stop) in
                contacts.append(contact)
            }
        } catch {
            print(error.localizedDescription)
        }
        for contact in contacts {
            print(contact.givenName, contact.familyName)
        }
    }
}


