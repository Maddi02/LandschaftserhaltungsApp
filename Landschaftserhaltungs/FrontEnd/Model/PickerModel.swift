//
//  Picker.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 22.11.22.
//

import Foundation
import UIKit
import AVFoundation
import SwiftUI

enum PickerModel {
    
    enum Source : String {
        case library, camera
    }
    
    enum PickerError : Error , LocalizedError{
        case unavailable
        case restricted
        case denied
        
        var errorDescription: String? {
            switch self {
            case .unavailable:
                return NSLocalizedString("There is no available camera on this devices", comment: "")
            case .restricted:
                return NSLocalizedString("You are not allowed to access media caputure devices", comment: "")
            case .denied:
                return NSLocalizedString("You have explicitly denied permission for media capture. Please open permissions/Privacy/Camera and grant access for this application.", comment: "")
            }
        }
    }
    
    static func checkPermission() throws {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let authStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
            switch authStatus {
            case .denied:
                throw PickerError.denied
            case .restricted:
                throw PickerError.restricted
           
            default: break
            }

        }else {
            throw PickerError.unavailable
        }
    }
    
    struct CamerErrorTyp {
        
        let error: PickerModel.PickerError
        
        var message: String {
            error.localizedDescription
        }
        
        let button = Button("OK", role: .cancel){
            
        }
        
    }
    
}
