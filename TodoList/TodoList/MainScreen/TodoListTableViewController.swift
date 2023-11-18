//
//  TodoListTableViewController.swift

import UIKit

final class TodoListTableViewController: UITableViewController {
	private var taskManager: ITaskManager! // swiftlint:disable:this implicitly_unwrapped_optional

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "TodoList"

		setup()
	}

	private func setup() {
		taskManager = TaskManager()
		let tasks = [
		]
		taskManager.addTasks(tasks: tasks)

		self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
	}

	private func getTaskForIndex(_ indexPath: IndexPath) -> Task {
		taskManager.allTasks()[indexPath.row]
	}

	// MARK: - Table view data source

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		taskManager.allTasks().count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let task = getTaskForIndex(indexPath)
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		var contentConfiguration = cell.defaultContentConfiguration()

		if let task = task as? ImportantTask {
			contentConfiguration.secondaryText = "Deadline: \(task.deadLine.formatted())"
		}

		contentConfiguration.text = task.title
		cell.contentConfiguration = contentConfiguration

		return cell
	}
}
