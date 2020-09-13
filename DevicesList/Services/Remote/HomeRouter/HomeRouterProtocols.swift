//
//  HomeRouterProtocols.swift
//  MobileNoc
//
//  Created by prog_zidane on 9/10/20.
//  Copyright © 2020 Zidane. All rights reserved.
//

import Foundation

typealias ErrorCallBack = (String)->()

protocol HomeRouterProtocol: class
{
    func getHomeContent(success:@escaping([Content])->(),failure:@escaping ErrorCallBack)
}
