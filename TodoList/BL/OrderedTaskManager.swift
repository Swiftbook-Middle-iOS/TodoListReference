//
//  OrderedTaskManager.swift
//  TodoList
//
//  Created by Александр Касьянов on 29.11.2023.
//

import Foundation

/// Предоставляет список заданий, отсортированных по приоритету.
final class OrderedTaskManager: ITaskManager {
	private let taskManager: ITaskManager
	private let sortMethod: (Task, Task) -> Bool = { $0 < $1 }

	init(taskManager: ITaskManager) {
		self.taskManager = taskManager
	}

	func allTasks() -> [Task] {
		taskManager.allTasks().sorted(by: sortMethod)
	}

	func completedTasks() -> [Task] {
		taskManager.completedTasks().sorted(by: sortMethod)
	}

	func uncompletedTasks() -> [Task] {
		taskManager.uncompletedTasks().sorted(by: sortMethod)
	}

	func addTask(task: Task) {
		taskManager.addTask(task: task)
	}

	func addTasks(tasks: [Task]) {
		taskManager.addTasks(tasks: tasks)
	}
}
