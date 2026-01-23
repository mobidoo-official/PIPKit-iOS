//
//  UIViewController+Associated.swift
//  PIPKit
//
//  Created by Kofktu on 2022/01/03.
//

import Foundation
import UIKit

public extension UIViewController {

    enum AssociatedKeys {
        static var pipEventDispatcher: Void?
    }

    var pipEventDispatcher: PIPKitEventDispatcher? {
        get { objc_getAssociatedObject(self, &AssociatedKeys.pipEventDispatcher) as? PIPKitEventDispatcher }
        set {
            objc_setAssociatedObject(
                self,
                &AssociatedKeys.pipEventDispatcher,
                newValue,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }

}
