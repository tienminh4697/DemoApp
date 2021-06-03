//
//  TutorialHomeView.swift
//  DemoApp
//
//  Created by T.Minh on 5/31/21.
//

import UIKit

final class TutorialHomeView: UIView {

    // MARK: - IBOutlets
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var view1: UIView!
    @IBOutlet private weak var view2: UIView!
    @IBOutlet private weak var view3: UIView!
    @IBOutlet private weak var view11: UIView!
    @IBOutlet private weak var view22: UIView!
    @IBOutlet private weak var view33: UIView!
    @IBOutlet var viewSmall: [UIView]!
    @IBOutlet private weak var close1: UIButton!
    @IBOutlet private weak var close2: UIButton!
    @IBOutlet private weak var close3: UIButton!

    var index = 0

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configView()
    }

    // MARK: Private func
    private func showView(view1: Bool, view2: Bool, view3: Bool, view11: Bool, view22: Bool, view33: Bool) {
        self.view1.isHidden = view1
        self.view11.isHidden = view11
        self.view2.isHidden = view2
        self.view22.isHidden = view22
        self.view3.isHidden = view3
        self.view33.isHidden = view33
    }

    private func configView() {
        Bundle.main.loadNibNamed("TutorialHomeView", owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        for index in 0..<viewSmall.count {
            viewSmall[index].transform = viewSmall[index].transform.rotated(by: .pi / 4)
        }
        view11.layer.cornerRadius = 10
        view22.layer.cornerRadius = 10
        view33.layer.cornerRadius = 10
        showView(view1: false, view2: true, view3: true, view11: false, view22: true, view33: true)
    }

    private func showClose(close1: Bool, close2: Bool, close3: Bool) {
        self.close1.isHidden = close1
        self.close2.isHidden = close2
        self.close3.isHidden = close3
    }

    // MARK: - IBAction
    @IBAction func closeButtonTouchUpInside(_ sender: UIButton) {
        // skip
        print("skip")
    }

    @IBAction func nextToSecondTouchUpInside(_ sender: UIButton) {
        // 1->2
        showClose(close1: true, close2: false, close3: true)
        showView(view1: true, view2: false, view3: true, view11: true, view22: false, view33: true)
    }

    @IBAction func nextToThirdTouchInside(_ sender: UIButton) {
        // 2->3
        showClose(close1: true, close2: true, close3: false)
        showView(view1: true, view2: true, view3: false, view11: true, view22: true, view33: false)
    }

    @IBAction func backToFistTouchUpInside(_ sender: UIButton) {
        // 2->1
        showClose(close1: false, close2: true, close3: true)
        showView(view1: false, view2: true, view3: true, view11: false, view22: true, view33: true)
    }

    @IBAction func backToSecondTouchInside(_ sender: UIButton) {
        // 3->2
        showClose(close1: true, close2: false, close3: true)
        showView(view1: true, view2: false, view3: true, view11: true, view22: false, view33: true)
    }

    @IBAction func doneButtonTouchUpInside(_ sender: UIButton) {
        // done
        print("ok")
    }
}
