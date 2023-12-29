//
//  EmptyReusableVIew.swift
//  iosSchool_HH
//
//  Created by student on 07.12.2023.
//

import UIKit

class EmptyReusableVIew: UICollectionReusableView, CoreReusableView {

    static func layoutItem() -> NSCollectionLayoutBoundarySupplementaryItem? {
        nil
    }

    func update(with _: Void) -> Self {
        self
    }
}
