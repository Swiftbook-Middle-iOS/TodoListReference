//
//  SceneDelegate.swift

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(
		_ scene: UIScene,
		willConnectTo session: UISceneSession,
		options connectionOptions: UIScene.ConnectionOptions
	) {
		guard let scene = (scene as? UIWindowScene) else { return }
		let window = UIWindow(windowScene: scene)

		window.rootViewController = UINavigationController(rootViewController: assembly())
		window.makeKeyAndVisible()

		self.window = window
	}

	func assembly() -> UIViewController {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)

		let viewController = storyboard.instantiateViewController(
			withIdentifier: "TodoListTableViewController"
		) as! TodoListTableViewController // swiftlint:disable:this force_cast

		viewController.taskManager = buildTaskManager()

		return viewController
	}

	func buildTaskManager() -> ITaskManager {
		let taskManager = OrderedTaskManager(taskManager: TaskManager())
		let tasks: [Task] = [
			.important(ImportantTask(date: Date(), taskPriority: .high, title: "Do homework")),
			.regular(RegularTask(title: "Do Workout", completed: true)),
			.important(ImportantTask(date: Date(), taskPriority: .low, title: "Write new tasks")),
			.regular(RegularTask(title: "Solve 3 algorithms")),
			.important(ImportantTask(date: Date(), taskPriority: .medium, title: "Go shopping"))
		]
		taskManager.addTasks(tasks: tasks)

		return taskManager
	}
}
