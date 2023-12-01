//
//  SceneDelegate.swift

import UIKit
import TaskManagerPackage

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(
		_ scene: UIScene,
		willConnectTo session: UISceneSession,
		options connectionOptions: UIScene.ConnectionOptions
	) {
		guard let scene = (scene as? UIWindowScene) else { return }
		let window = UIWindow(windowScene: scene)

		window.rootViewController = UINavigationController(rootViewController: assemblyLogin())
		window.makeKeyAndVisible()

		self.window = window
	}

	func assemblyTodoList() -> UIViewController {
		let viewController = MainViewController()
		let sectionManager = SectionForTaskManagerAdapter(taskManager: buildTaskManager())
		let presenter = MainPresenter(view: viewController, sectionManager: sectionManager)
		viewController.presenter = presenter
		return viewController
	}

	func assemblyLogin() -> UIViewController {
		let viewController = LoginViewController()
		let presenter = LoginPresenter(view: viewController, nextScreen: assemblyTodoList())
		viewController.presenter = presenter
		return viewController
	}

	func buildTaskManager() -> ITaskManager {
		let taskManager = OrderedTaskManager(taskManager: TaskManager())
		let repository: ITaskRepository = TaskRepositoryStub()
		taskManager.addTasks(tasks: repository.getTasks())

		return taskManager
	}
}
