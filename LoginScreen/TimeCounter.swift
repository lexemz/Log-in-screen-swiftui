//
//  TimeCounter.swift
//  LoginScreen
//
//  Created by Igor on 06.11.2021.
//

import Foundation
import Combine

class TimeCounter: ObservableObject {
    let objectWillChange = PassthroughSubject<TimeCounter, Never>() // [Combine] свойство позволяет следить за измненеиями в классе
    var counter = 3
    var timer: Timer?
    var buttonTitle = "Start"

    func startTimer() {
        if counter > 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 1, // интенрвал в секундах
                target: self, // класс, в котором будет реализован метод, вызываемый каждую секунду
                selector: #selector(updateCounter),
                userInfo: nil, // пользовательская информация (размер клавиатуры и тд)
                repeats: true // повторять ли этот метод или тикнуть один раз
            )
        }

        buttonDidTapped()
    }

    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            buttonTitle = "Reset"
        }
        
        objectWillChange.send(self) // [Combine] уведомление об изменении класса
    }

    private func killTimer() {
        timer?.invalidate() // остановка таймера
        timer = nil // удаление таймера
    }
    
    private func buttonDidTapped() {
        if buttonTitle == "Reset" {
            counter = 3
            buttonTitle = "Start"
        } else {
            buttonTitle = "Wait..."
        }
        objectWillChange.send(self) // [Combine] уведомление об изменении класса
    }
}
