//
//  ScriptMessageHandler.swift
//  HybridTurbo
//
//  Created by William Kennedy on 21/07/2022.
//
import WebKit

class ScriptMessageHandler: NSObject, WKScriptMessageHandler {
    func userContentController(
        _ userContentController: WKUserContentController,
        didReceive message: WKScriptMessage
    ) {
        print("JavaScript message received", message.body)
    }
}
