//
//  TodoList.swift
//  Checklist
//
//  Created by Erich Kerekes on 5/8/19.
//  Copyright © 2019 Hallow. All rights reserved.
//

import Foundation

class TodoList: Codable {
    
    enum Priority: Int, CaseIterable {
        case high, medium, low, no
    }
    
    private var highPriorityTodos: [ChecklistItem] = []
    private var medPriorityTodos: [ChecklistItem] = []
    private var lowPriorityTodos: [ChecklistItem] = []
    private var noPriorityTodos: [ChecklistItem] = []
    
    init() {
        let row0Item = ChecklistItem()
        let row1Item = ChecklistItem()
        let row2Item = ChecklistItem()
        let row3Item = ChecklistItem()
        let row4Item = ChecklistItem()
        let row5Item = ChecklistItem()
        let row6Item = ChecklistItem()
        let row7Item = ChecklistItem()
        let row8Item = ChecklistItem()
        
        row0Item.text = "Take a jog"
        row1Item.text = "Watch a movie"
        row2Item.text = "Code an app"
        row3Item.text = "Walk the dog"
        row4Item.text = "Study design patterns"
        row5Item.text = "Take a jog"
        row6Item.text = "duh"
        row7Item.text = "what"
        row8Item.text = "nah"
        
        
        addToDo(row0Item, for: .medium)
        addToDo(row1Item, for: .low)
        addToDo(row2Item, for: .medium)
        addToDo(row3Item, for: .high)
        addToDo(row4Item, for: .no)
        addToDo(row5Item, for: .low)
        addToDo(row6Item, for: .medium)
        addToDo(row7Item, for: .high)
        addToDo(row8Item, for: .no)
    }
    
    func addToDo(_ item: ChecklistItem, for priority: Priority, at index: Int = -1){
        switch priority{
        case .high:
            if index < 0 {
            highPriorityTodos.append(item)
            } else {
                highPriorityTodos.insert(item, at: index)
            }
        case .medium:
            if index < 0 {
                medPriorityTodos.append(item)
            } else {
                medPriorityTodos.insert(item, at: index)
            }
        case .low:
            if index < 0 {
                lowPriorityTodos.append(item)
            } else {
                lowPriorityTodos.insert(item, at: index)
            }
        case .no:
            if index < 0 {
                noPriorityTodos.append(item)
            } else {
                noPriorityTodos.insert(item, at: index)
            }
        }
    }
    
    func todoList(for priority: Priority) -> [ChecklistItem]{
        switch priority{
        case .high:
            return highPriorityTodos
        case .medium:
            return medPriorityTodos
        case .low:
            return lowPriorityTodos
        case .no:
            return noPriorityTodos
        }
    }
    
    func newTodo() -> ChecklistItem {
        let item = ChecklistItem()
        item.text = getRandomTitle()
        item.checked = true
        medPriorityTodos.append(item)
        return item
    }
    
    func move(item: ChecklistItem, from sourcePriority: Priority, at sourceIndex: Int, to destinationPriority: Priority, at destinationIndex: Int){
        remove(item: item, from: sourcePriority, at: sourceIndex)
        addToDo(item, for: destinationPriority, at: destinationIndex)
        
    }
    
    func remove(item: ChecklistItem, from priority: Priority, at index: Int){
        switch priority{
        case .high:
            highPriorityTodos.remove(at: index)
        case .medium:
            medPriorityTodos.remove(at: index)
        case .low:
            lowPriorityTodos.remove(at: index)
        case .no:
            noPriorityTodos.remove(at: index)
        }
    }
    
    private func getRandomTitle() -> String {
        var titles = ["1", "2", "3", "4"]
        let randomNumber = Int.random(in: 0 ... titles.count - 1)
        return titles[randomNumber]
    }
    
    
}
