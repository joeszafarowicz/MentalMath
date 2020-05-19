//
//  SettingsViewController.swift
//  MindMath
//
//  Created by Joseph Szafarowicz on 5/18/20.
//  Copyright © 2020 Joseph Szafarowicz. All rights reserved.
//

import UIKit
import SwiftyStoreKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var questionsButton: UIButton!
    @IBOutlet weak var fullVersionButton: UIButton!
    @IBOutlet weak var restoreButton: UIButton!
    @IBOutlet weak var reviewAppButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func questionsButtonTapped(_ sender: UIButton) {
        animateButton(questionsButton)
        let story = UIStoryboard(name: "Main", bundle:nil)
        let viewController = story.instantiateViewController(withIdentifier: "QuestionSettings") as! QuestionSettingsViewController
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    @IBAction func fullVersionButtonTapped(_ sender: UIButton) {
        animateButton(fullVersionButton)
    }
    
    @IBAction func restoreButtonTapped(_ sender: UIBarButtonItem) {
        animateButton(restoreButton)
        // Restore previous purchases
        SwiftyStoreKit.restorePurchases(atomically: true) { results in
            if results.restoreFailedPurchases.count > 0 {
                print("Restore Failed: \(results.restoreFailedPurchases)")
            }
            else if results.restoredPurchases.count > 0 {
                print("Restore Success: \(results.restoredPurchases)")
                defaults.set(true, forKey: "fullVersion")
            }
            else {
                print("Nothing to Restore")
            }
            self.showAlert(self.alertForRestorePurchases(results))
        }
        
        // Fetch and verify receipt
        SwiftyStoreKit.fetchReceipt(forceRefresh: true) { result in
            switch result {
            case .success(let receiptData):
                let encryptedReceipt = receiptData.base64EncodedString(options: [])
                print("Fetch receipt success:\n\(encryptedReceipt)")
            case .error(let error):
                print("Fetch receipt failed: \(error)")
            }
        }
        
        let recieptValidator = AppleReceiptValidator(service: .production, sharedSecret: "2c616b8889824a398d4ce71f963f141a")
        SwiftyStoreKit.verifyReceipt(using: recieptValidator, forceRefresh: false) { result in
            switch result {
            case .success(let receipt):
                print("Verify receipt success: \(receipt)")
            case .error(let error):
                print("Verify receipt failed: \(error)")
            }
        }
        
        let fullVersionValidator = AppleReceiptValidator(service: .production, sharedSecret: "2c616b8889824a398d4ce71f963f141a")
        SwiftyStoreKit.verifyReceipt(using: fullVersionValidator) { result in
            switch result {
            case .success(let receipt):
                let productId = "com.josephszafarowicz.MindMath.FullVersion"
                // Verify the purchase of Consumable or NonConsumable
                let purchaseResult = SwiftyStoreKit.verifyPurchase(
                    productId: productId,
                    inReceipt: receipt)
                
                switch purchaseResult {
                case .purchased(let receiptItem):
                    print("\(productId) is purchased: \(receiptItem)")
                    defaults.set(true, forKey: "fullVersion")
                case .notPurchased:
                    print("The user has never purchased \(productId)")
                }
            case .error(let error):
                print("Receipt verification failed: \(error)")
            }
        }
    }
    
    @IBAction func reviewButtonTapped(_ sender: UIButton) {
        if let url = URL(string: "https://itunes.apple.com/app/id1513943007?action=write-review") {
            UIApplication.shared.open(url)
        }
    }
}

extension SettingsViewController {
    func alertWithTitle(_ title: String, message: String) -> UIAlertController {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        return alert
    }
    
    func showAlert(_ alert: UIAlertController) {
        guard self.presentedViewController != nil else {
            self.present(alert, animated: true, completion: nil)
            return
        }
    }
    
    func alertForPurchaseResult(_ result: PurchaseResult) -> UIAlertController? {
        switch result {
        case .success(let purchase):
            print("Purchase Success: \(purchase.productId)")
            return nil
        case .error(let error):
            print("Purchase Failed: \(error)")
            switch error.code {
            case .unknown: return alertWithTitle("Purchase failed", message: error.localizedDescription)
            case .clientInvalid: // client is not allowed to issue the request, etc.
                return alertWithTitle("Purchase failed", message: "Not allowed to make the payment")
            case .paymentCancelled: // user cancelled the request, etc.
                return nil
            case .paymentInvalid: // purchase identifier was invalid, etc.
                return alertWithTitle("Purchase failed", message: "The purchase identifier was invalid")
            case .paymentNotAllowed: // this device is not allowed to make the payment
                return alertWithTitle("Purchase failed", message: "The device is not allowed to make the payment")
            case .storeProductNotAvailable: // Product is not available in the current storefront
                return alertWithTitle("Purchase failed", message: "The product is not available in the current storefront")
            case .cloudServicePermissionDenied: // user has not allowed access to cloud service information
                return alertWithTitle("Purchase failed", message: "Access to cloud service information is not allowed")
            case .cloudServiceNetworkConnectionFailed: // the device could not connect to the nework
                return alertWithTitle("Purchase failed", message: "Could not connect to the network")
            case .cloudServiceRevoked: // user has revoked permission to use this cloud service
                return alertWithTitle("Purchase failed", message: "Cloud service was revoked")
            case .privacyAcknowledgementRequired:
                return alertWithTitle("Purchase failed", message: "Privacy Acknowledgement required")
            case .unauthorizedRequestData:
                return alertWithTitle("Purchase failed", message: "Unauthorized data")
            case .invalidOfferIdentifier:
                return alertWithTitle("Purchase failed", message: "Invalid product identifier")
            case .invalidSignature:
                return alertWithTitle("Purchase failed", message: "Invalid signature")
            case .missingOfferParams:
                return alertWithTitle("Purchase failed", message: "Missing parameters")
            case .invalidOfferPrice:
                return alertWithTitle("Purchase failed", message: "Invalid offer price")
            @unknown default:
                return alertWithTitle("Purchase failed", message: "Uknown error")
            }
        }
    }
    
    func alertForRestorePurchases(_ results: RestoreResults) -> UIAlertController {
        
        if results.restoreFailedPurchases.count > 0 {
            print("Restore Failed: \(results.restoreFailedPurchases)")
            return alertWithTitle("Restore failed", message: "Unknown error. Please contact support")
        } else if results.restoredPurchases.count > 0 {
            print("Restore Success: \(results.restoredPurchases)")
            return alertWithTitle("Purchases Restored", message: "Previous purchases have been restored")
        } else {
            print("Nothing to Restore")
            return alertWithTitle("Nothing to restore", message: "No previous purchases were found")
        }
    }
}
