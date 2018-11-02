// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import UIKit

struct ContentBlockingRule: Codable {
    struct Trigger: Codable {
        var urlFilter: String
        var resourceType: [ResourceType]?
        var ifDomain: [String]?
        var unlessDomain: [String]?
        var urlFilterIsCaseSensitive: Bool? = true
        var loadType: [String]?
        
        enum ResourceType: String, Codable, CodingKey {
            case document = "document"
            case image = "image"
            case styleSheet = "style-sheet"
            case script = "script"
            case font = "font"
            case raw = "raw"
            case svgDocument = "svg-document"
            case media = "media"
            case popup = "popup"
        }
        
        private enum CodingKeys: String, CodingKey {
            case urlFilter = "url-filter"
            case resourceType = "resource-type"
            case ifDomain = "if-domain"
            case unlessDomain = "unless-domain"
            case urlFilterIsCaseSensitive = "url-filter-is-case-sensitive"
            case loadType = "load-type"
        }
    }
    
    struct Action: Codable {
        var type: String
        var selector: String?
    }
    
    var trigger: Trigger
    var action: Action
}
