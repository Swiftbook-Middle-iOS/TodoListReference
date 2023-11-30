//
//  LoginModel.swift
//  TodoList
//
//  Created by Александр Касьянов on 30.11.2023.
//

import Foundation

/// LoginModel является NameSpace для отделения ViewData различных экранов друг от друга
enum LoginModel {
	/// Структура, описывающая экран авторизации
	struct ViewData {
		let login: String
		let password: String
	}
}
