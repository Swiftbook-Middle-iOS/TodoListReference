//
//  TaskManager.swift
//  TodoList
//
//  Created by Александр Касьянов on 18.11.2023.
//

import Foundation

final class TaskManager {
	private var taskList = [Task]()

	func completedTask() -> [Task] {
		taskList.filter { $0.completed }
	}

	func uncompletedTask() -> [Task] {
		taskList.filter { !$0.completed }
	}

	func allTasks() -> [Task] {
		taskList
	}

	func addTask(task: Task) {
		taskList.append(task)
	}

	func removeTask(task: Task) {
		taskList.removeAll { $0 === task }
	}
}
