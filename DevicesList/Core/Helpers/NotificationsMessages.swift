//
//  NotificationsMessages.swift
//  MobileNoc
//
//  Created by prog_zidane on 9/10/20.
//  Copyright © 2020 Zidane. All rights reserved.
//



import Foundation
import Toast_Swift

final class NotifiyMessage
{
    private init() {}
    
    static let shared = NotifiyMessage()

    func configNotify()
    {
        ToastManager.shared.isTapToDismissEnabled = true
        ToastManager.shared.isQueueEnabled = true
        ToastManager.shared.duration = 2
        ToastManager.shared.position = .bottom
    }
    
    func toast(toastMessage: String)
    {
        guard let view = UIApplication.getTopViewController()?.view else {return}
        view.makeToast(toastMessage)
    }
}
