//
//  RKBannerViewDataSource.swift
//  FBSnapshotTestCase
//
//  Created by 金灵波 on 2019/4/9.
//

import Foundation

public protocol RKBannerViewDataSource {
    var imageUrl: String? { get }
    var linkUrl: String? { get }
}
