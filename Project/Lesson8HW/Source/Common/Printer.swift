//
//  Logger.swift
//  Lesson8HW
//

//

import Foundation

protocol PrinterProtocol: AnyObject {
    func textToPrint() -> String
}

class Printer {
    
    weak var delegate: PrinterProtocol?
    
    private var timer: Timer?
    private var seconds: Int = 0
    
    func startPrinting() {
        
        stop()
        
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(timerAction),
            userInfo: nil,
            repeats: true
        )
    }
    
    func stop() {
        timer?.invalidate()
    }
    
    @objc private func timerAction() {
        
        let secondsText = "\(seconds) секунд"
        
        if let textToPrint = delegate?.textToPrint() {
            print("\(textToPrint) \(secondsText)")
        }
        
        seconds += 1
    }
}
