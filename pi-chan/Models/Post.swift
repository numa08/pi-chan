//
//  Post.swift
//  pi-chan
//
//  Created by Kensuke Hoshikawa on 2016/04/05.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation
import Himotoki

struct Post {
  let number: Int
  let name: String
  let fullName: String
  let wip: Bool
  let bodyMd: String
  let bodyHtml: String
  let createdAt: String
  let message: String
  let url: NSURL
  let updatedAt: String
  let tags: [String]?
  let category: String?
  let revisionNumber: Int
  let createdBy: CreatedBy
  let updatedBy: UpdatedBy
  let kind: Kind
  let commentsCount: Int
  let tasksCount: Int
  let doneTasksCount: Int
  let stargazersCount: Int
  let watchersCount: Int
  let star: Bool
  let watch: Bool
  let sharingUrls: NSURL?
}

extension Post : Decodable {
  static func decode(e: Extractor) throws -> Post {
    return try Post(
      number: e <| "number",
      name: e <| "name",
      fullName: e <| "full_name",
      wip: e <| "wip",
      bodyMd: e <| "body_md",
      bodyHtml: e <| "body_html",
      createdAt: e <| "created_at",
      message: e <| "message",
      url: e <| "url",
      updatedAt: e <| "updated_at",
      tags: e <||? "tags",
      category: e <|? "category",
      revisionNumber: e <| "revision_number",
      createdBy: e <| "created_by",
      updatedBy: e <| "updated_by",
      kind: Kind.init(rawValue: try e.value("kind") as String)!,
      commentsCount: e <| "comments_count",
      tasksCount: e <| "tasks_count",
      doneTasksCount: e <| "done_tasks_count",
      stargazersCount: e <| "stargazers_count",
      watchersCount: e <| "watchers_count",
      star: e <| "star",
      watch: e <| "watch",
      sharingUrls: e <|? "sharing_urls"
    )
  }
}

enum Kind: String{
  case Stock = "stock"
  case Flow = "flow"
}
