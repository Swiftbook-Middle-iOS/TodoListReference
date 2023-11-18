//
//  TaskManager.swift
//  TodoList
//
//  Created by Александр Касьянов on 18.11.2023.
//

import Foundation

final class TaskManager {
	private var taskList = [Task]()

	func completedTasks() -> [Task] {
		taskList.filter { $0.completed }
	}

	func uncompletedTasks() -> [Task] {
		taskList.filter { !$0.completed }
	}

	func allTasks() -> [Task] {
		taskList
	}

	func addTask(task: Task) {
		taskList.append(task)
	}

	func addTasks(tasks: [Task]) {
		taskList.append(contentsOf: tasks)
	}

	func removeTask(task: Task) {
		taskList.removeAll { $0 === task }
	}
}
