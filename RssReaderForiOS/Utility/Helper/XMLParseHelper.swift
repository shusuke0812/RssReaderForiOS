//
//  XMLParser.swift
//  RssReaderForiOS
//
//  Created by Shusuke Ota on 2021/11/23.
//  Copyright © 2021 shusuke. All rights reserved.
//

import Foundation

class XMLParseHelper: NSObject {
    
    private let parser: XMLParser?
    private var checkElement: String?

    // TODO: [String] ではなく [Item] を返すようにする
    var onSuccess: (([String]) -> Void)?
    var onError: ((Error) -> Void)?

    private var items: [String]
    
    init(data: Data) {
        self.parser = XMLParser(data: data)
        self.items = []
        super.init()
        self.parser?.delegate = self
    }
}

// MARK: - XMLParser Delegate
extension XMLParseHelper: XMLParserDelegate {
    // Analysis
    func parserDidStartDocument(_ parser: XMLParser) {
    }
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        print("DEBUG: XML parse element -> ", elementName)
        if elementName == "ERROR" {
            parser.abortParsing()
        }
        checkElement = elementName
    }
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if !string.contains("\n")  {
            if checkElement == "title" {
                items.append(string)
            }
        }
    }
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        print("DEBUG: XML parse element -> ", elementName)
    }
    func parserDidEndDocument(_ parser: XMLParser) {
        onSuccess?(items)
    }
    // Error
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        onError?(parseError)
    }
}
