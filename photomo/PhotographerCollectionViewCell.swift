//
//  PhotographerCollectionViewCell.swift
//  photomo
//
//  Created by 石田幸太 on 2021/02/21.
//

import UIKit

class PhotographerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var userImage: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
            
            let cellSize = super.preferredLayoutAttributesFitting(layoutAttributes) // もとの実装を読んでいる
            // 変更を加える
            var frame = cellSize.frame // frameにサイズ情報が格納
            frame.origin = CGPoint(x: 0, y: 0) // 基準地点を設定
            frame.size.width = CGFloat(Int((self.superview?.frame.width)! - 0) / 3) // superViewとはひとつ上のViewの事
            frame.size.height = CGFloat(Int(((self.superview)?.frame.height)! / 3) - 0)
            //f.size.width = 100
            cellSize.frame = frame
            return cellSize
            
        }
}
