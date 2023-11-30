//
//  TodoListTableViewController.swift

import UIKit
import TaskManagerPackage

final class TodoListTableViewController: UITableViewController {
	private var taskManager: ITaskManager! // swiftlint:disable:this implicitly_unwrapped_optional

	init(taskManager: ITaskManager) {
		super.init(nibName: nil, bundle: nil)
		self.taskManager = taskManager
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "TodoList"
		setup()
	}
}

extension TodoListTableViewController {
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		taskManager.allTasks().count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let task = taskManager.allTasks()[indexPath.row]
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		configureCell(cell, with: task)
		return cell
	}
}

private extension TodoListTableViewController {

	private func setup() {
		self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
	}

	func getTaskForIndex(_ indexPath: IndexPath) -> Task {
		taskManager.allTasks()[indexPath.row]
	}

	func configureCell(_ cell: UITableViewCell, with task: Task) {
		var contentConfiguration = cell.defaultContentConfiguration()

		if let task = task as? ImportantTask {
			contentConfiguration.secondaryText = "Deadline: \(task.deadLine.formatted())"
		}

		contentConfiguration.text = task.title
		cell.contentConfiguration = contentConfiguration
	}
}
