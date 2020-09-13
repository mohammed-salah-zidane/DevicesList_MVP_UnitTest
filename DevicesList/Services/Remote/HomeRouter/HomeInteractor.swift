//
//  HomeNetworkManager.swift
//  MobileNoc
//
//  Created by prog_zidane on 9/10/20.
//  Copyright © 2020 Zidane. All rights reserved.
//

import Moya
import Result

protocol HomeInteractorInjected { }

extension HomeInteractorInjected
{
    var homeInteractor: HomeRouterProtocol
    {
        get
        {
            return HomeInteractor()
        }
    }
}

class HomeInteractor: HomeRouterProtocol,NetworkBase
{
    
    // MARK: Properties
    
    private let provider: MoyaProvider<HomeRouter>
    
    // MARK: Initiallization
    
    init(provider: MoyaProvider<HomeRouter> = MoyaProvider<HomeRouter>(plugins: [NetworkLoggerPlugin(verbose: true)]))
    {
        self.provider = provider
    }
    
    // MARK: Methods
    
    func getHomeContent (
          success: @escaping ([Content]) -> ()
        , failure: @escaping ErrorCallBack
    ) {
        self.provider.request(.fetchHomeContent) { (result) in
            
            switch result
            {
            case .success(let value):
                
                self.validate(value, success: {
                    do {
                        let response = try value.map(BaseReponse.self)
                        guard let content = response.content else {
                            success([])
                            return
                        }
                        success(content)
                    }catch {
                        failure(NetworkError.parsingJSONError.errorDescription ?? "")
                    }
                    
                }) { (errorMessage) in
                    failure(errorMessage)
                }
            case .failure(let error):
                failure(NetworkError(error.code).errorDescription ?? "")
            }
        }
    }
}
