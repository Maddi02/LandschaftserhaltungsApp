

import Foundation
import UIKit
import SwiftUI
class DocumentPickerCoordinator: NSObject, UIDocumentPickerDelegate, UINavigationControllerDelegate
{

    @Binding var content: UIImage
    init(content: Binding<UIImage>) {
        _content = content
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        let fileURL = urls[0]
        
        print(fileURL.absoluteString)
        do
        {
            var imageData :NSData
            do {
                imageData =  try NSData(contentsOf: fileURL,options: NSData.ReadingOptions.mappedIfSafe)
                content =  UIImage(data: imageData as Data) ?? UIImage(named: "HFULogo")!
            }catch
            {
                print(error)
            }

        }

    }
    
    
    func  getImage() -> UIImage
    {
        return content
    }
}
