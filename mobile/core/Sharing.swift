//
//  Sharing.swift
//  Emojilist
//
//  Created by Thiago Ricieri on 15/01/2018.
//  Copyright © 2018 Ghost Ship. All rights reserved.
//

import Foundation
import UIKit

class Marketing {
    
    static func share(app controllerReady: (UIActivityViewController) -> Void) {
        let copyToShare = "About.Share.Copy".localized + " " + Env.Promo.shareUrl
        let urlToShare = URL(string: Env.Promo.shareUrl)!
        let activityViewController = UIActivityViewController(
            activityItems: [copyToShare, urlToShare],
            applicationActivities: nil)
        controllerReady(activityViewController)
    }
    
    static func share(list viewModel: EmojiListViewModel,
                      controllerReady: (UIActivityViewController) -> Void) {
        
        let firstActivityItem = "\(viewModel.name) #mojilist"
        let secondActivityItem = URL(string: Env.Promo.shareUrl)!
        let shareView = Bundle.loadView(fromNib: Xibs.resources, withType: ShareSnippetView.self)
        shareView.configure(with: viewModel)
        
        let image = UIImage(view: shareView)
        let activityViewController = UIActivityViewController(
            activityItems: [firstActivityItem, secondActivityItem, image],
            applicationActivities: nil)
        
        controllerReady(activityViewController)
    }
}
