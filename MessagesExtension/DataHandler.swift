//
//  DataHandler.swift
//  iMessageDemo
//
//  Created by Yudiz Solutions Pvt. Ltd. on 28/01/17.
//  Copyright © 2017 Yudiz Solution Pvt Ltd. All rights reserved.
//

import UIKit

class DataHandler: NSObject{
    func prepareData()->[YudizData]{
        return[YudizData(title: "Home", url: "http://www.yudiz.com/"),
               YudizData(title: "What we do", url: "http://www.yudiz.com/what-we-do/"),
               YudizData(title: "Our Portfolio", url: "http://www.yudiz.com/portfolio/"),
               YudizData(title: "Case Studies", url: "http://www.yudiz.com/case-studies/"),
               YudizData(title: "Blogs", url: "http://www.yudiz.com/blog/"),
               YudizData(title: "Join Our Team", url: "http://www.yudiz.com/join-our-team/"),
               YudizData(title: "Get in touch", url: "http://www.yudiz.com/get-in-touch/")]
    }
}

class YudizData: NSObject {
    var title: String!
    var webUrl : URL!
    init(title: String!, url: String!) {
        self.title = title
        self.webUrl = URL(string: url)
    }
}

