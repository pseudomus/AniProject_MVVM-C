// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class AnimeDetailQuery: GraphQLQuery {
  public static let operationName: String = "AnimeDetail"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query AnimeDetail($id: Int) { Media(id: $id, type: ANIME) { __typename id title { __typename romaji english native } coverImage { __typename large color } description(asHtml: false) episodes duration genres averageScore meanScore popularity format status season seasonYear studios(isMain: true) { __typename nodes { __typename name } } startDate { __typename year month day } endDate { __typename year month day } trailer { __typename id site thumbnail } } }"#
    ))

  public var id: GraphQLNullable<Int>

  public init(id: GraphQLNullable<Int>) {
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
        .field("duration", Int?.self),
        .field("genres", [String?]?.self),
        .field("averageScore", Int?.self),
        .field("meanScore", Int?.self),
        .field("popularity", Int?.self),
        .field("format", GraphQLEnum<AniAPI.MediaFormat>?.self),
        .field("status", GraphQLEnum<AniAPI.MediaStatus>?.self),
        .field("season", GraphQLEnum<AniAPI.MediaSeason>?.self),
        .field("seasonYear", Int?.self),
        .field("studios", Studios?.self, arguments: ["isMain": true]),
        .field("startDate", StartDate?.self),
        .field("endDate", EndDate?.self),
        .field("trailer", Trailer?.self),
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
      /// The general length of each anime episode in minutes
      public var duration: Int? { __data["duration"] }
      /// The genres of the media
      public var genres: [String?]? { __data["genres"] }
      /// A weighted average score of all the user's scores of the media
      public var averageScore: Int? { __data["averageScore"] }
      /// Mean score of all the user's scores of the media
      public var meanScore: Int? { __data["meanScore"] }
      /// The number of users with the media on their list
      public var popularity: Int? { __data["popularity"] }
      /// The format the media was released in
      public var format: GraphQLEnum<AniAPI.MediaFormat>? { __data["format"] }
      /// The current releasing status of the media
      public var status: GraphQLEnum<AniAPI.MediaStatus>? { __data["status"] }
      /// The season the media was initially released in
      public var season: GraphQLEnum<AniAPI.MediaSeason>? { __data["season"] }
      /// The season year the media was initially released in
      public var seasonYear: Int? { __data["seasonYear"] }
      /// The companies who produced the media
      public var studios: Studios? { __data["studios"] }
      /// The first official release date of the media
      public var startDate: StartDate? { __data["startDate"] }
      /// The last official release date of the media
      public var endDate: EndDate? { __data["endDate"] }
      /// Media trailer or advertisement
      public var trailer: Trailer? { __data["trailer"] }

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
          .field("color", String?.self),
        ] }

        /// The cover image url of the media at a large size
        public var large: String? { __data["large"] }
        /// Average #hex color of cover image
        public var color: String? { __data["color"] }
      }

      /// Media.Studios
      ///
      /// Parent Type: `StudioConnection`
      public struct Studios: AniAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { AniAPI.Objects.StudioConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("nodes", [Node?]?.self),
        ] }

        public var nodes: [Node?]? { __data["nodes"] }

        /// Media.Studios.Node
        ///
        /// Parent Type: `Studio`
        public struct Node: AniAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { AniAPI.Objects.Studio }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("name", String.self),
          ] }

          /// The name of the studio
          public var name: String { __data["name"] }
        }
      }

      /// Media.StartDate
      ///
      /// Parent Type: `FuzzyDate`
      public struct StartDate: AniAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { AniAPI.Objects.FuzzyDate }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("year", Int?.self),
          .field("month", Int?.self),
          .field("day", Int?.self),
        ] }

        /// Numeric Year (2017)
        public var year: Int? { __data["year"] }
        /// Numeric Month (3)
        public var month: Int? { __data["month"] }
        /// Numeric Day (24)
        public var day: Int? { __data["day"] }
      }

      /// Media.EndDate
      ///
      /// Parent Type: `FuzzyDate`
      public struct EndDate: AniAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { AniAPI.Objects.FuzzyDate }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("year", Int?.self),
          .field("month", Int?.self),
          .field("day", Int?.self),
        ] }

        /// Numeric Year (2017)
        public var year: Int? { __data["year"] }
        /// Numeric Month (3)
        public var month: Int? { __data["month"] }
        /// Numeric Day (24)
        public var day: Int? { __data["day"] }
      }

      /// Media.Trailer
      ///
      /// Parent Type: `MediaTrailer`
      public struct Trailer: AniAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { AniAPI.Objects.MediaTrailer }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", String?.self),
          .field("site", String?.self),
          .field("thumbnail", String?.self),
        ] }

        /// The trailer video id
        public var id: String? { __data["id"] }
        /// The site the video is hosted by (Currently either youtube or dailymotion)
        public var site: String? { __data["site"] }
        /// The url for the thumbnail image of the video
        public var thumbnail: String? { __data["thumbnail"] }
      }
    }
  }
}
