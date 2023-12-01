//
//  SectionForTaskManagerAdapter.swift
//  TodoList
//
//  Created by Александр Касьянов on 01.12.2023.
//

import Foundation
import TaskManagerPackage

/// Протокол адаптера, позволяющего использовать TaskManager для предоставления заданий по секциям.
protocol ISectionForTaskManagerAdapter {
	/// Получить список секций.
	/// - Returns: Массив с секциями.
	func getSections() -> [Section]

	/// Доступ к секции по индексу.
	/// - Parameter index: Индекс, для которого нужно вернуть секцию.
	/// - Returns: Нужная секция.
	func getSection(forIndex index: Int) -> Section

	/// Получить список заданий для конкретной секции.
	/// - Parameter section: Секция для которой нужен список заданий.
	/// - Returns: Массив с секциями.
	func getTasksForSection(section: Section) -> [Task]
}

/// Список секций и их заголовки.
enum Section: CaseIterable {
	/// Секция, содержащая завершенные задания.
	case completed
	/// Секция, содержащая незавершенные задания.
	case uncompleted

	/// Заголовки секций.
	var title: String {
		switch self {
		case .completed:
			return "Completed"
		case .uncompleted:
			return "Uncompleted"
		}
	}
}

/// Адаптер, позволяющий использовать TaskManager для предоставления заданий по секциям.
final class SectionForTaskManagerAdapter: ISectionForTaskManagerAdapter {

	// MARK: - Dependencies
	private let taskManager: ITaskManager

	// MARK: - Private properties
	/// Приватный массив, который содержит список предоставляемых секция.
	private let sections: [Section]

	// MARK: - Initialization
	init(taskManager: ITaskManager, sections: [Section] = [.uncompleted, .completed]) {
		self.taskManager = taskManager
		self.sections = sections
	}

	// MARK: - Public methods
	/// Получить список секций.
	/// - Returns: Массив с секциями.
	func getSections() -> [Section] {
		sections
	}

	/// Метод, предоставляющий доступ к секции по её индексу.
	/// Необходим для доступа к  приватному свойству sections для устранения возможности нарушения закона Деметры.
	/// - Parameter index: Индекс секции.
	/// - Returns: Секция, хранящаяся под индексом.
	func getSection(forIndex index: Int) -> Section {
		let correctedIndex = min(index, sections.count - 1)
		return sections[correctedIndex]
	}

	/// Получить список заданий для конкретной секции.
	/// - Parameter section: Секция для которой нужен список заданий.
	/// - Returns: Массив с секциями.
	func getTasksForSection(section: Section) -> [Task] {
		switch section {
		case .completed:
			return taskManager.completedTasks()
		case .uncompleted:
			return taskManager.uncompletedTasks()
		}
	}
}
