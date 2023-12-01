//
//  MainModel.swift
//  TodoList
//
//  Created by Александр Касьянов on 30.11.2023.
//

import Foundation

/// MainModel является NameSpace для отделения ViewData различных экранов друг от друга
enum MainModel {
	/// Структура, описывающая главный экран приложения TodoList
	struct ViewData {
		/// Содержит в себе список задач для отображения, разделённые на секции
		let tasksBySections: [Section]

		struct Section {
			let title: String
			let tasks: [Task]
		}

		/// Перечисление, представляющее наши задачи для отображения на экране
		enum Task {
			case regularTask(RegularTask)
			case importantTask(ImportantTask)
		}

		/// Обычное задание. Содержит только то, что отображается на экране.
		struct RegularTask {
			let title: String
			let completed: Bool
		}

		/// Важное задание. Содержит только то, что отображается на экране.
		struct ImportantTask {
			let title: String
			let completed: Bool
			let deadLine: String
			let priority: String
		}
	}
}
