//
//  PhotoCellNode.swift
//  ZayBanTest
//
//  Created by Ko Ko Aye on 12/01/2021.
//

import AsyncDisplayKit

class PhotoCellNode : ASCellNode{
    
    let photo : Picture?
    
    let image : ASNetworkImageNode = {
        let img = ASNetworkImageNode()
        img.contentMode = .scaleAspectFit
        img.defaultImage = UIImage(named: "pic1")
        return img
    }()
    
    init(picture : Picture?) {
        self.photo = picture
        super.init()
        automaticallyManagesSubnodes = true
        image.imageModificationBlock = { img, _ in
            let data =  img.jpegData(compressionQuality: 0.5)
            return ( data != nil) ? UIImage(data: data!) : img
        }
        image.url = picture!.imageUrl
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        image.style.preferredSize = CGSize(width: constrainedSize.max.width, height: 300)
        return ASInsetLayoutSpec(insets: .zero, child: image)
    }
    
}
