//
//  FotoCollectionViewCell.swift
//  VK
//
//  Created by Pauwell on 14.04.2021.
//

import UIKit

class FotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var fotoImage: UIImageView!
    
    var saveImage: UIImage?
    
    func clearCell() {
        fotoImage.image = nil
        saveImage = nil
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        clearCell()
    }

    override func prepareForReuse() {
        clearCell()
    }
    
    func configure(foto: UIImage) {
        fotoImage.image = foto
        saveImage = foto
    }
    
}
