//
//  ChatOutgoingTextCellSnapshotTest.swift
//  Antidote
//
//  Created by Dmytro Vorobiov on 02.04.16.
//  Copyright © 2016 dvor. All rights reserved.
//

import Foundation

class ChatOutgoingTextCellSnapshotTest: CellSnapshotTest {
    override func setUp() {
        super.setUp()

        recordMode = false
    }

    func testSmallMessage() {
        let model = ChatOutgoingTextCellModel()
        model.message = "Hi"

        let cell = ChatOutgoingTextCell()
        cell.setupWithTheme(theme, model: model)

        updateCellLayout(cell)
        verifyView(cell)
    }

    func testMediumMessage() {
        let model = ChatOutgoingTextCellModel()
        model.message = "Some nice medium message"

        let cell = ChatOutgoingTextCell()
        cell.setupWithTheme(theme, model: model)

        updateCellLayout(cell)
        verifyView(cell)
    }

    func testHugeMessage() {
        let model = ChatOutgoingTextCellModel()
        model.message = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. "

        let cell = ChatOutgoingTextCell()
        cell.setupWithTheme(theme, model: model)

        updateCellLayout(cell)
        verifyView(cell)
    }
}
