//
//  AuthorTableViewCell.swift
//  AuthorShelf
//
//  Created by Sudharshan on 26/06/24.
//

import UIKit
import SDWebImage

class AuthorTableViewCell: UITableViewCell {
    
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var checkMarkButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func updateCell(_ photo: Photo?) {
        if let photo = photo{
            if let imageUrl = URL(string: photo.download_url) {
                authorImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(systemName: "person"))
            }
            authorName.text = photo.author
            linkLabel.text = photo.url
            
            if photo.isFav {
                checkMarkButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
                checkMarkButton.tintColor = .green
            }else {
                checkMarkButton.setImage(UIImage(systemName: "circle"), for: .normal)
                checkMarkButton.tintColor = .gray
            }
        }
    }
    
}
