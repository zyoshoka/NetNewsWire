//
//  SmallIconProvider.swift
//  NetNewsWire
//
//  Created by Brent Simmons on 12/16/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import Articles
import Account
import RSCore

protocol SmallIconProvider {

	var smallIcon: IconImage? { get }
}

extension Account: SmallIconProvider {
	var smallIcon: IconImage? {
		if let image = AppImage.account(type) {
			return IconImage(image)
		}
		return nil
	}
}

extension Feed: SmallIconProvider {

	var smallIcon: IconImage? {
		if let iconImage = FaviconDownloader.shared.favicon(for: self) {
			return iconImage
		}
		return FaviconGenerator.favicon(self)
	}
}

extension Folder: SmallIconProvider {
	var smallIcon: IconImage? {
		AppImage.folderIconImage
	}
}
