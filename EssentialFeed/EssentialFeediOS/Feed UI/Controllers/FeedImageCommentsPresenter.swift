//
//  FeedImageCommentsPresenter.swift
//  EssentialFeediOS
//
//  Created by Anton Ilinykh on 09.03.2021.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import EssentialFeed

struct FeedImageCommentLoadingViewModel {
	let isLoading: Bool
}

protocol FeedImageCommentLoadingView {
	func display(_ viewModel: FeedImageCommentLoadingViewModel)
}

struct FeedImageCommentViewModel {
	let comments: [FeedImageComment]
}

protocol FeedImageCommentView {
	func display(_ viewModel: FeedImageCommentViewModel)
}

final class FeedImageCommentsPresenter {
	private let commentsView: FeedImageCommentView
	private let loadingView: FeedImageCommentLoadingView
	
	init(commentsView: FeedImageCommentView, loadingView: FeedImageCommentLoadingView) {
		self.commentsView = commentsView
		self.loadingView = loadingView
	}
	
	func didStartLoadingComments() {
		loadingView.display(FeedImageCommentLoadingViewModel(isLoading: true))
	}
	
	func didFinishLoadingComments(comments: [FeedImageComment]) {
		commentsView.display(FeedImageCommentViewModel(comments: comments))
		loadingView.display(FeedImageCommentLoadingViewModel(isLoading: false))
	}
	
	func didFinishLoadingComments(with error: Error) {
		loadingView.display(FeedImageCommentLoadingViewModel(isLoading: false))
	}
}
