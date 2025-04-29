// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class AnimeDetailQuery: GraphQLQuery {
  public static let operationName: String = "AnimeDetail"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query AnimeDetail($id: Int!) { Media(id: $id, type: ANIME) { __typename id title { __typename romaji english native } coverImage { __typename large } description(asHtml: false) episodes genres averageScore status season } }"#
    ))

  public var id: Int

  public init(id: Int) {
    self.id = id
  }

  public var __variables: Variables? { ["id": id] }

  public struct Data: AniAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AniAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("Media", Media?.self, arguments: [
        "id": .variable("id"),
        "type": "ANIME"
      ]),
    ] }

    /// Media query
    public var media: Media? { __data["Media"] }

    /// Media
    ///
    /// Parent Type: `Media`
    public struct Media: AniAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { AniAPI.Objects.Media }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", Int.self),
        .field("title", Title?.self),
        .field("coverImage", CoverImage?.self),
        .field("description", String?.self, arguments: ["asHtml": false]),
        .field("episodes", Int?.self),
        .field("genres", [String?]?.self),
        .field("averageScore", Int?.self),
        .field("status", GraphQLEnum<AniAPI.MediaStatus>?.self),
        .field("season", GraphQLEnum<AniAPI.MediaSeason>?.self),
      ] }

      /// The id of the media
      public var id: Int { __data["id"] }
      /// The official titles of the media in various languages
      public var title: Title? { __data["title"] }
      /// The cover images of the media
      public var coverImage: CoverImage? { __data["coverImage"] }
      /// Short description of the media's story and characters
      public var description: String? { __data["description"] }
      /// The amount of episodes the anime has when complete
      public var episodes: Int? { __data["episodes"] }
      /// The genres of the media
      public var genres: [String?]? { __data["genres"] }
      /// A weighted average score of all the user's scores of the media
      public var averageScore: Int? { __data["averageScore"] }
      /// The current releasing status of the media
      public var status: GraphQLEnum<AniAPI.MediaStatus>? { __data["status"] }
      /// The season the media was initially released in
      public var season: GraphQLEnum<AniAPI.MediaSeason>? { __data["season"] }

      /// Media.Title
      ///
      /// Parent Type: `MediaTitle`
      public struct Title: AniAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { AniAPI.Objects.MediaTitle }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("romaji", String?.self),
          .field("english", String?.self),
          .field("native", String?.self),
        ] }

        /// The romanization of the native language title
        public var romaji: String? { __data["romaji"] }
        /// The official english title
        public var english: String? { __data["english"] }
        /// Official title in it's native language
        public var native: String? { __data["native"] }
      }

      /// Media.CoverImage
      ///
      /// Parent Type: `MediaCoverImage`
      public struct CoverImage: AniAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { AniAPI.Objects.MediaCoverImage }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("large", String?.self),
        ] }

        /// The cover image url of the media at a large size
        public var large: String? { __data["large"] }
      }
    }
  }
}
