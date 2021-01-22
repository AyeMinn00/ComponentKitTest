//
//  AsyncViewController.swift
//  ZayBanTest
//
//  Created by Ko Ko Aye on 12/01/2021.
//

import AsyncDisplayKit

@objc class Service : NSObject{
    public static let vc = AsyncViewController()
}

class AsyncViewController: ASDKViewController<ASDisplayNode> {
    lazy var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 1)
        return adapter
    }()

    let collectionNode: ASCollectionNode
    let dataSource = PhotoDatasource()

    override init() {
        collectionNode = ASCollectionNode(collectionViewLayout: UICollectionViewFlowLayout())
        super.init(node: ASDisplayNode())
        node.automaticallyManagesSubnodes = true

        node.layoutSpecBlock = { [weak self] displayNode, _ in
            guard let collectionNode = self?.collectionNode else { return ASLayoutSpec() }
            return ASInsetLayoutSpec(insets: displayNode.safeAreaInsets, child: collectionNode)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        adapter.setASDKCollectionNode(collectionNode)
        adapter.dataSource = dataSource

        var dataSet: [Picture] = []

        for i in 0 ... 10000 {
            var img = ""
            if i % 2 == 0 {
                img = "https://dramaslot.com/wp-content/uploads/2019/05/Heaven-Sword.jpg"
            } else if i % 3 == 0 {
                img = "https://i.mydramalist.com/BmmD7s.jpg"
            } else {
                img = "https://64.media.tumblr.com/c0c57e8f8535b9d7e45d349b4f772042/tumblr_po1le834Ns1syv3zao1_1280.jpg"
            }
            dataSet.append(Picture(id: "\(i)", url: URL(string: img)!))
        }
        
        dataSource.dataSet = dataSet
        adapter.performUpdates(animated: true)
        
    }
}
