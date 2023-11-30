//
//  Task.swift
//  TodoList
//
//  Created by Александр Касьянов on 18.11.2023.
//

import Foundation

class Task {
	var title: String
	var completed = false

	init(title: String, completed: Bool = false) {
		self.title = title
		self.completed = completed
	}
}

final class RegularTask: Task { }

final class ImportantTask: Task {
	enum TaskPriority: Int {
		case low
		case medium
		case high
	}

	var deadLine: Date {
		switch taskPriority {
		case .low:
			return Calendar.current.date(byAdding: .day, value: 3, to: date)! // swiftlint:disable:this force_unwrapping
		case .medium:
			return Calendar.current.date(byAdding: .day, value: 2, to: date)! // swiftlint:disable:this force_unwrapping
		case .high:
			return Calendar.current.date(byAdding: .day, value: 1, to: date)! // swiftlint:disable:this force_unwrapping
		}
	}

	var date: Date
	var taskPriority: TaskPriority

	init(title: String, date: Date, taskPriority: TaskPriority) {
		self.taskPriority = taskPriority
		self.date = date
		super.init(title: title)
	}
}
