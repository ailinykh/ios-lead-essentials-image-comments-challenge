//
//  FeedImageComment.swift
//  EssentialFeed
//
//  Created by Anton Ilinykh on 03.03.2021.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import Foundation

public struct FeedImageComment: Equatable {
	
	public struct Author: Equatable {
		let username: String
	}
	
	let id: UUID
	let message: String
	let createdAt: String
	let author: Author
}
