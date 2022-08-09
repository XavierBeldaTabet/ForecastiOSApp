// MARK: - Mocks generated from file: ForecastiOSApp/Presentation/ForecastLocation/ForecastLocationViewFactory.swift at 2022-08-09 15:17:45 +0000

//
//  ForecastLocationFactory.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 8/8/22.
//

import Cuckoo
@testable import ForecastiOSApp






 class MockForecastLocationViewFactoryInterface: ForecastLocationViewFactoryInterface, Cuckoo.ProtocolMock {
    
     typealias MocksType = ForecastLocationViewFactoryInterface
    
     typealias Stubbing = __StubbingProxy_ForecastLocationViewFactoryInterface
     typealias Verification = __VerificationProxy_ForecastLocationViewFactoryInterface

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: ForecastLocationViewFactoryInterface?

     func enableDefaultImplementation(_ stub: ForecastLocationViewFactoryInterface) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func make(location: Location) -> ForecastLocationView {
        
    return cuckoo_manager.call(
    """
    make(location: Location) -> ForecastLocationView
    """,
            parameters: (location),
            escapingParameters: (location),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.make(location: location))
        
    }
    
    

     struct __StubbingProxy_ForecastLocationViewFactoryInterface: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func make<M1: Cuckoo.Matchable>(location: M1) -> Cuckoo.ProtocolStubFunction<(Location), ForecastLocationView> where M1.MatchedType == Location {
            let matchers: [Cuckoo.ParameterMatcher<(Location)>] = [wrap(matchable: location) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockForecastLocationViewFactoryInterface.self, method:
    """
    make(location: Location) -> ForecastLocationView
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_ForecastLocationViewFactoryInterface: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func make<M1: Cuckoo.Matchable>(location: M1) -> Cuckoo.__DoNotUse<(Location), ForecastLocationView> where M1.MatchedType == Location {
            let matchers: [Cuckoo.ParameterMatcher<(Location)>] = [wrap(matchable: location) { $0 }]
            return cuckoo_manager.verify(
    """
    make(location: Location) -> ForecastLocationView
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class ForecastLocationViewFactoryInterfaceStub: ForecastLocationViewFactoryInterface {
    

    

    
    
    
    
     func make(location: Location) -> ForecastLocationView  {
        return DefaultValueRegistry.defaultValue(for: (ForecastLocationView).self)
    }
    
    
}










 class MockForecastLocationViewFactory: ForecastLocationViewFactory, Cuckoo.ClassMock {
    
     typealias MocksType = ForecastLocationViewFactory
    
     typealias Stubbing = __StubbingProxy_ForecastLocationViewFactory
     typealias Verification = __VerificationProxy_ForecastLocationViewFactory

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: ForecastLocationViewFactory?

     func enableDefaultImplementation(_ stub: ForecastLocationViewFactory) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     override func make(location: Location) -> ForecastLocationView {
        
    return cuckoo_manager.call(
    """
    make(location: Location) -> ForecastLocationView
    """,
            parameters: (location),
            escapingParameters: (location),
            superclassCall:
                
                super.make(location: location)
                ,
            defaultCall: __defaultImplStub!.make(location: location))
        
    }
    
    

     struct __StubbingProxy_ForecastLocationViewFactory: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func make<M1: Cuckoo.Matchable>(location: M1) -> Cuckoo.ClassStubFunction<(Location), ForecastLocationView> where M1.MatchedType == Location {
            let matchers: [Cuckoo.ParameterMatcher<(Location)>] = [wrap(matchable: location) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockForecastLocationViewFactory.self, method:
    """
    make(location: Location) -> ForecastLocationView
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_ForecastLocationViewFactory: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func make<M1: Cuckoo.Matchable>(location: M1) -> Cuckoo.__DoNotUse<(Location), ForecastLocationView> where M1.MatchedType == Location {
            let matchers: [Cuckoo.ParameterMatcher<(Location)>] = [wrap(matchable: location) { $0 }]
            return cuckoo_manager.verify(
    """
    make(location: Location) -> ForecastLocationView
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class ForecastLocationViewFactoryStub: ForecastLocationViewFactory {
    

    

    
    
    
    
     override func make(location: Location) -> ForecastLocationView  {
        return DefaultValueRegistry.defaultValue(for: (ForecastLocationView).self)
    }
    
    
}





// MARK: - Mocks generated from file: ForecastiOSApp/Presentation/SearchLocation/SearchViewFactory.swift at 2022-08-09 15:17:45 +0000

//
//  SearchLocationViewFactory.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 9/8/22.
//

import Cuckoo
@testable import ForecastiOSApp

import Foundation






 class MockSearchViewFactoryInterface: SearchViewFactoryInterface, Cuckoo.ProtocolMock {
    
     typealias MocksType = SearchViewFactoryInterface
    
     typealias Stubbing = __StubbingProxy_SearchViewFactoryInterface
     typealias Verification = __VerificationProxy_SearchViewFactoryInterface

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: SearchViewFactoryInterface?

     func enableDefaultImplementation(_ stub: SearchViewFactoryInterface) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func make() -> SearchView {
        
    return cuckoo_manager.call(
    """
    make() -> SearchView
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.make())
        
    }
    
    

     struct __StubbingProxy_SearchViewFactoryInterface: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func make() -> Cuckoo.ProtocolStubFunction<(), SearchView> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockSearchViewFactoryInterface.self, method:
    """
    make() -> SearchView
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_SearchViewFactoryInterface: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func make() -> Cuckoo.__DoNotUse<(), SearchView> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    make() -> SearchView
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class SearchViewFactoryInterfaceStub: SearchViewFactoryInterface {
    

    

    
    
    
    
     func make() -> SearchView  {
        return DefaultValueRegistry.defaultValue(for: (SearchView).self)
    }
    
    
}










 class MockSearchViewFactory: SearchViewFactory, Cuckoo.ClassMock {
    
     typealias MocksType = SearchViewFactory
    
     typealias Stubbing = __StubbingProxy_SearchViewFactory
     typealias Verification = __VerificationProxy_SearchViewFactory

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: SearchViewFactory?

     func enableDefaultImplementation(_ stub: SearchViewFactory) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     override func make() -> SearchView {
        
    return cuckoo_manager.call(
    """
    make() -> SearchView
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.make()
                ,
            defaultCall: __defaultImplStub!.make())
        
    }
    
    

     struct __StubbingProxy_SearchViewFactory: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func make() -> Cuckoo.ClassStubFunction<(), SearchView> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockSearchViewFactory.self, method:
    """
    make() -> SearchView
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_SearchViewFactory: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func make() -> Cuckoo.__DoNotUse<(), SearchView> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    make() -> SearchView
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class SearchViewFactoryStub: SearchViewFactory {
    

    

    
    
    
    
     override func make() -> SearchView  {
        return DefaultValueRegistry.defaultValue(for: (SearchView).self)
    }
    
    
}





// MARK: - Mocks generated from file: ForecastiOSApp/Presentation/SearchLocation/SearchViewRouter.swift at 2022-08-09 15:17:45 +0000

//
//  SearchViewRouter.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 8/8/22.
//

import Cuckoo
@testable import ForecastiOSApp

import Foundation






 class MockSearchViewRouterInterface: SearchViewRouterInterface, Cuckoo.ProtocolMock {
    
     typealias MocksType = SearchViewRouterInterface
    
     typealias Stubbing = __StubbingProxy_SearchViewRouterInterface
     typealias Verification = __VerificationProxy_SearchViewRouterInterface

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: SearchViewRouterInterface?

     func enableDefaultImplementation(_ stub: SearchViewRouterInterface) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func navigateToForecastLocationView(location: Location) -> ForecastLocationView {
        
    return cuckoo_manager.call(
    """
    navigateToForecastLocationView(location: Location) -> ForecastLocationView
    """,
            parameters: (location),
            escapingParameters: (location),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.navigateToForecastLocationView(location: location))
        
    }
    
    

     struct __StubbingProxy_SearchViewRouterInterface: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func navigateToForecastLocationView<M1: Cuckoo.Matchable>(location: M1) -> Cuckoo.ProtocolStubFunction<(Location), ForecastLocationView> where M1.MatchedType == Location {
            let matchers: [Cuckoo.ParameterMatcher<(Location)>] = [wrap(matchable: location) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockSearchViewRouterInterface.self, method:
    """
    navigateToForecastLocationView(location: Location) -> ForecastLocationView
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_SearchViewRouterInterface: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func navigateToForecastLocationView<M1: Cuckoo.Matchable>(location: M1) -> Cuckoo.__DoNotUse<(Location), ForecastLocationView> where M1.MatchedType == Location {
            let matchers: [Cuckoo.ParameterMatcher<(Location)>] = [wrap(matchable: location) { $0 }]
            return cuckoo_manager.verify(
    """
    navigateToForecastLocationView(location: Location) -> ForecastLocationView
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class SearchViewRouterInterfaceStub: SearchViewRouterInterface {
    

    

    
    
    
    
     func navigateToForecastLocationView(location: Location) -> ForecastLocationView  {
        return DefaultValueRegistry.defaultValue(for: (ForecastLocationView).self)
    }
    
    
}










 class MockSearchViewRouter: SearchViewRouter, Cuckoo.ClassMock {
    
     typealias MocksType = SearchViewRouter
    
     typealias Stubbing = __StubbingProxy_SearchViewRouter
     typealias Verification = __VerificationProxy_SearchViewRouter

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: SearchViewRouter?

     func enableDefaultImplementation(_ stub: SearchViewRouter) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     override func navigateToForecastLocationView(location: Location) -> ForecastLocationView {
        
    return cuckoo_manager.call(
    """
    navigateToForecastLocationView(location: Location) -> ForecastLocationView
    """,
            parameters: (location),
            escapingParameters: (location),
            superclassCall:
                
                super.navigateToForecastLocationView(location: location)
                ,
            defaultCall: __defaultImplStub!.navigateToForecastLocationView(location: location))
        
    }
    
    

     struct __StubbingProxy_SearchViewRouter: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func navigateToForecastLocationView<M1: Cuckoo.Matchable>(location: M1) -> Cuckoo.ClassStubFunction<(Location), ForecastLocationView> where M1.MatchedType == Location {
            let matchers: [Cuckoo.ParameterMatcher<(Location)>] = [wrap(matchable: location) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockSearchViewRouter.self, method:
    """
    navigateToForecastLocationView(location: Location) -> ForecastLocationView
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_SearchViewRouter: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func navigateToForecastLocationView<M1: Cuckoo.Matchable>(location: M1) -> Cuckoo.__DoNotUse<(Location), ForecastLocationView> where M1.MatchedType == Location {
            let matchers: [Cuckoo.ParameterMatcher<(Location)>] = [wrap(matchable: location) { $0 }]
            return cuckoo_manager.verify(
    """
    navigateToForecastLocationView(location: Location) -> ForecastLocationView
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class SearchViewRouterStub: SearchViewRouter {
    

    

    
    
    
    
     override func navigateToForecastLocationView(location: Location) -> ForecastLocationView  {
        return DefaultValueRegistry.defaultValue(for: (ForecastLocationView).self)
    }
    
    
}




