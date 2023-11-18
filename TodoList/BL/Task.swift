//
//  Task.swift
//  TodoList
//
//  Created by Александр Касьянов on 18.11.2023.
//

import Foundation

class Task {
	var title: String
	var completed: Bool

	init(title: String, completed: Bool = false) {
		self.title = title
		self.completed = completed
	}
}

final class RegularTask: Task { }

final class ImportantTask: Task {

	enum TaskPriority {
		case low
		case medium
		case high
	}

	var taskPriority: TaskPriority
	var date: Date
	var deadLine: Date {
		switch taskPriority {
		case .low:
			return Calendar.current.date(byAdding: .day, value: 3, to: date)! // swiftlint:disable:this force_unwrapping
		case .medium:
			return Calendar.current.date(byAdding: .day, value: 3, to: date)! // swiftlint:disable:this force_unwrapping
		case .high:
			return Calendar.current.date(byAdding: .day, value: 3, to: date)! // swiftlint:disable:this force_unwrapping
		}
	}

	init(title: String, completed: Bool = false, taskPriority: TaskPriority, date: Date = Date()) {
		self.taskPriority = taskPriority
		self.date = date

		super.init(title: title, completed: completed)
	}
}
