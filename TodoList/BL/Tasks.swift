//
//  Task.swift
//  TodoList
//
//  Created by Александр Касьянов on 18.11.2023.
//

import Foundation

enum Task {
	case regular(RegularTask)
	case important(ImportantTask)
}

extension Task {
	var completed: Bool {
		switch self {
		case .regular(let regularTask):
			return regularTask.completed
		case .important(let importantTask):
			return importantTask.completed
		}
	}

	var title: String {
		switch self {
		case .regular(let regularTask):
			return regularTask.title
		case .important(let importantTask):
			return importantTask.title
		}
	}
}

struct RegularTask {
	var title: String
	var completed = false
}

struct ImportantTask {
	enum TaskPriority: Int {
		case low
		case medium
		case high
	}

	enum TaskStatus {
		case notStarted
		case completed
		case canceled
		case paused
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
	var title: String
	var status: TaskStatus = .notStarted
//	var completed = false
}

extension ImportantTask {
	var completed: Bool {
		status == .completed
	}
}

extension RegularTask: Equatable {
	static func == (lhs: RegularTask, rhs: RegularTask) -> Bool {
		return lhs.title == rhs.title && lhs.completed == rhs.completed
	}
}

extension ImportantTask: Equatable {
	static func == (lhs: ImportantTask, rhs: ImportantTask) -> Bool {
		return lhs.title == rhs.title &&
		lhs.date == rhs.date &&
		lhs.taskPriority == rhs.taskPriority &&
		lhs.status == rhs.status
	}
}

extension Task: Equatable {
	static func == (lhs: Task, rhs: Task) -> Bool {
		return lhs == rhs
	}
}

extension Task: Comparable {
	static func < (lhs: Task, rhs: Task) -> Bool {
		switch (lhs, rhs) {
		case (.important(let leftImportant), .important(let rightImportant)):
			return leftImportant.taskPriority.rawValue > rightImportant.taskPriority.rawValue
		case (.important, .regular):
			return true
		default:
			return false
		}
	}
}
