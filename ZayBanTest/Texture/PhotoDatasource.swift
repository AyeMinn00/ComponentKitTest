//
//  PhotoDatasource.swift
//  ZayBanTest
//
//  Created by Ko Ko Aye on 12/01/2021.
//

import AsyncDisplayKit

class PhotoDatasource : NSObject, ListAdapterDataSource{

    @objc var dataSet : [Picture] = []

    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return dataSet as [ListDiffable]
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return PictureSectionController()
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}

class PictureSectionController : ListSectionController , ASSectionController{

    var picture : Picture?

    override func didUpdate(to object: Any) {
        guard let pic = object as? Picture else { return }
        self.picture = pic
    }

    override func numberOfItems() -> Int {
        return 1
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = ASIGListSectionControllerMethods.cellForItem(at: index, sectionController: self)
        return cell
    }

    override func sizeForItem(at index: Int) -> CGSize {
        return ASIGListSectionControllerMethods.sizeForItem(at: index)
    }

    func nodeBlockForItem(at index: Int) -> ASCellNodeBlock {
        return {
            PhotoCellNode(picture: self.picture)
        }
    }

}
