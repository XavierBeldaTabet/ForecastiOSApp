//
//  ForecastAPI.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 7/8/22.
//

import Foundation

class BaseOperation: Operation {
    
    private var _executing = false
    private var _finished = false
    var isFailed = false
    
    override var isExecuting: Bool {
        get { return _executing }
        set {
            guard _executing != newValue else { return }
            self.willChangeValue(forKey: "isExecuting")
            _executing = newValue
            self.didChangeValue(forKey: "isExecuting")
        }
    }
    
    override var isFinished: Bool {
        get { return _finished }
        set {
            guard _finished != newValue else { return }
            self.willChangeValue(forKey: "isFinished")
            _finished = newValue
            self.didChangeValue(forKey: "isFinished")
        }
    }
        
    override func start() {
        if self.isCancelled == true {
            self.isExecuting = false
            self.isFinished = true
            return
        }
        
        self.isExecuting = true
        self.main()
    }
    
    override func cancel() {
        super.cancel()
    }
}
