{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE OverloadedStrings #-}

-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.

-- | Contains the different functions to run the operation getPlans
module StripeAPI.Operations.GetPlans where

import qualified Control.Monad.Trans.Reader
import qualified Data.Aeson
import qualified Data.Aeson as Data.Aeson.Types
import qualified Data.Aeson as Data.Aeson.Types.FromJSON
import qualified Data.Aeson as Data.Aeson.Types.ToJSON
import qualified Data.Aeson as Data.Aeson.Types.Internal
import qualified Data.ByteString.Char8
import qualified Data.ByteString.Char8 as Data.ByteString.Internal
import qualified Data.Either
import qualified Data.Functor
import qualified Data.Scientific
import qualified Data.Text
import qualified Data.Text.Internal
import qualified Data.Time.Calendar as Data.Time.Calendar.Days
import qualified Data.Time.LocalTime as Data.Time.LocalTime.Internal.ZonedTime
import qualified Data.Vector
import qualified GHC.Base
import qualified GHC.Classes
import qualified GHC.Generics
import qualified GHC.Int
import qualified GHC.Show
import qualified GHC.Types
import qualified Network.HTTP.Client
import qualified Network.HTTP.Client as Network.HTTP.Client.Request
import qualified Network.HTTP.Client as Network.HTTP.Client.Types
import qualified Network.HTTP.Simple
import qualified Network.HTTP.Types
import qualified Network.HTTP.Types as Network.HTTP.Types.Status
import qualified Network.HTTP.Types as Network.HTTP.Types.URI
import qualified StripeAPI.Common
import StripeAPI.Types
import qualified Prelude as GHC.Integer.Type
import qualified Prelude as GHC.Maybe

-- | > GET /v1/plans
--
-- \<p>Returns a list of your plans.\<\/p>
getPlans ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | Contains all available parameters of this operation (query and path parameters)
  GetPlansParameters ->
  -- | Monadic computation which returns the result of the operation
  StripeAPI.Common.StripeT m (Network.HTTP.Client.Types.Response GetPlansResponse)
getPlans parameters =
  GHC.Base.fmap
    ( \response_0 ->
        GHC.Base.fmap
          ( Data.Either.either GetPlansResponseError GHC.Base.id
              GHC.Base.. ( \response body ->
                             if  | (\status_1 -> Network.HTTP.Types.Status.statusCode status_1 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) ->
                                   GetPlansResponse200
                                     Data.Functor.<$> ( Data.Aeson.eitherDecodeStrict body ::
                                                          Data.Either.Either GHC.Base.String
                                                            GetPlansResponseBody200
                                                      )
                                 | GHC.Base.const GHC.Types.True (Network.HTTP.Client.Types.responseStatus response) ->
                                   GetPlansResponseDefault
                                     Data.Functor.<$> ( Data.Aeson.eitherDecodeStrict body ::
                                                          Data.Either.Either GHC.Base.String
                                                            Error
                                                      )
                                 | GHC.Base.otherwise -> Data.Either.Left "Missing default response type"
                         )
                response_0
          )
          response_0
    )
    ( StripeAPI.Common.doCallWithConfigurationM
        (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET")
        (Data.Text.pack "/v1/plans")
        [ StripeAPI.Common.QueryParameter (Data.Text.pack "active") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPlansParametersQueryActive parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "created") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPlansParametersQueryCreated parameters) (Data.Text.pack "deepObject") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "ending_before") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPlansParametersQueryEndingBefore parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPlansParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "limit") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPlansParametersQueryLimit parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "product") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPlansParametersQueryProduct parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "starting_after") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPlansParametersQueryStartingAfter parameters) (Data.Text.pack "form") GHC.Types.True
        ]
    )

-- | Defines the data type for the schema getPlansParameters
data GetPlansParameters
  = GetPlansParameters
      { -- | queryActive: Represents the parameter named \'active\'
        --
        -- Only return plans that are active or inactive (e.g., pass \`false\` to list all inactive plans).
        getPlansParametersQueryActive :: (GHC.Maybe.Maybe GHC.Types.Bool),
        -- | queryCreated: Represents the parameter named \'created\'
        --
        -- A filter on the list, based on the object \`created\` field. The value can be a string with an integer Unix timestamp, or it can be a dictionary with a number of different query options.
        getPlansParametersQueryCreated :: (GHC.Maybe.Maybe GetPlansParametersQueryCreated'Variants),
        -- | queryEnding_before: Represents the parameter named \'ending_before\'
        --
        -- A cursor for use in pagination. \`ending_before\` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with \`obj_bar\`, your subsequent call can include \`ending_before=obj_bar\` in order to fetch the previous page of the list.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        getPlansParametersQueryEndingBefore :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
        -- | queryExpand: Represents the parameter named \'expand\'
        --
        -- Specifies which fields in the response should be expanded.
        getPlansParametersQueryExpand :: (GHC.Maybe.Maybe ([] Data.Text.Internal.Text)),
        -- | queryLimit: Represents the parameter named \'limit\'
        --
        -- A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
        getPlansParametersQueryLimit :: (GHC.Maybe.Maybe GHC.Types.Int),
        -- | queryProduct: Represents the parameter named \'product\'
        --
        -- Only return plans for the given product.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        getPlansParametersQueryProduct :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
        -- | queryStarting_after: Represents the parameter named \'starting_after\'
        --
        -- A cursor for use in pagination. \`starting_after\` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with \`obj_foo\`, your subsequent call can include \`starting_after=obj_foo\` in order to fetch the next page of the list.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        getPlansParametersQueryStartingAfter :: (GHC.Maybe.Maybe Data.Text.Internal.Text)
      }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.ToJSON GetPlansParameters where
  toJSON obj = Data.Aeson.object ((Data.Aeson..=) "queryActive" (getPlansParametersQueryActive obj) : (Data.Aeson..=) "queryCreated" (getPlansParametersQueryCreated obj) : (Data.Aeson..=) "queryEnding_before" (getPlansParametersQueryEndingBefore obj) : (Data.Aeson..=) "queryExpand" (getPlansParametersQueryExpand obj) : (Data.Aeson..=) "queryLimit" (getPlansParametersQueryLimit obj) : (Data.Aeson..=) "queryProduct" (getPlansParametersQueryProduct obj) : (Data.Aeson..=) "queryStarting_after" (getPlansParametersQueryStartingAfter obj) : [])
  toEncoding obj = Data.Aeson.pairs ((Data.Aeson..=) "queryActive" (getPlansParametersQueryActive obj) GHC.Base.<> ((Data.Aeson..=) "queryCreated" (getPlansParametersQueryCreated obj) GHC.Base.<> ((Data.Aeson..=) "queryEnding_before" (getPlansParametersQueryEndingBefore obj) GHC.Base.<> ((Data.Aeson..=) "queryExpand" (getPlansParametersQueryExpand obj) GHC.Base.<> ((Data.Aeson..=) "queryLimit" (getPlansParametersQueryLimit obj) GHC.Base.<> ((Data.Aeson..=) "queryProduct" (getPlansParametersQueryProduct obj) GHC.Base.<> (Data.Aeson..=) "queryStarting_after" (getPlansParametersQueryStartingAfter obj)))))))

instance Data.Aeson.Types.FromJSON.FromJSON GetPlansParameters where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "GetPlansParameters" (\obj -> ((((((GHC.Base.pure GetPlansParameters GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryActive")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryCreated")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryEnding_before")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryExpand")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryLimit")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryProduct")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryStarting_after"))

-- | Defines the data type for the schema getPlansParametersQueryCreated\'OneOf2
data GetPlansParametersQueryCreated'OneOf2
  = GetPlansParametersQueryCreated'OneOf2
      { -- | gt
        getPlansParametersQueryCreated'OneOf2Gt :: (GHC.Maybe.Maybe GHC.Types.Int),
        -- | gte
        getPlansParametersQueryCreated'OneOf2Gte :: (GHC.Maybe.Maybe GHC.Types.Int),
        -- | lt
        getPlansParametersQueryCreated'OneOf2Lt :: (GHC.Maybe.Maybe GHC.Types.Int),
        -- | lte
        getPlansParametersQueryCreated'OneOf2Lte :: (GHC.Maybe.Maybe GHC.Types.Int)
      }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.ToJSON GetPlansParametersQueryCreated'OneOf2 where
  toJSON obj = Data.Aeson.object ((Data.Aeson..=) "gt" (getPlansParametersQueryCreated'OneOf2Gt obj) : (Data.Aeson..=) "gte" (getPlansParametersQueryCreated'OneOf2Gte obj) : (Data.Aeson..=) "lt" (getPlansParametersQueryCreated'OneOf2Lt obj) : (Data.Aeson..=) "lte" (getPlansParametersQueryCreated'OneOf2Lte obj) : [])
  toEncoding obj = Data.Aeson.pairs ((Data.Aeson..=) "gt" (getPlansParametersQueryCreated'OneOf2Gt obj) GHC.Base.<> ((Data.Aeson..=) "gte" (getPlansParametersQueryCreated'OneOf2Gte obj) GHC.Base.<> ((Data.Aeson..=) "lt" (getPlansParametersQueryCreated'OneOf2Lt obj) GHC.Base.<> (Data.Aeson..=) "lte" (getPlansParametersQueryCreated'OneOf2Lte obj))))

instance Data.Aeson.Types.FromJSON.FromJSON GetPlansParametersQueryCreated'OneOf2 where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "GetPlansParametersQueryCreated'OneOf2" (\obj -> (((GHC.Base.pure GetPlansParametersQueryCreated'OneOf2 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "gt")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "gte")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "lt")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "lte"))

-- | Define the one-of schema getPlansParametersQueryCreated\'
--
-- Represents the parameter named \'created\'
--
-- A filter on the list, based on the object \`created\` field. The value can be a string with an integer Unix timestamp, or it can be a dictionary with a number of different query options.
data GetPlansParametersQueryCreated'Variants
  = GetPlansParametersQueryCreated'Int GHC.Types.Int
  | GetPlansParametersQueryCreated'GetPlansParametersQueryCreated'OneOf2 GetPlansParametersQueryCreated'OneOf2
  deriving (GHC.Show.Show, GHC.Classes.Eq, GHC.Generics.Generic)

instance Data.Aeson.ToJSON GetPlansParametersQueryCreated'Variants where
  toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions {Data.Aeson.Types.Internal.sumEncoding = Data.Aeson.Types.Internal.UntaggedValue}

instance Data.Aeson.FromJSON GetPlansParametersQueryCreated'Variants where
  parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions {Data.Aeson.Types.Internal.sumEncoding = Data.Aeson.Types.Internal.UntaggedValue}

-- | Represents a response of the operation 'getPlans'.
--
-- The response constructor is chosen by the status code of the response. If no case matches (no specific case for the response code, no range case, no default case), 'GetPlansResponseError' is used.
data GetPlansResponse
  = -- | Means either no matching case available or a parse error
    GetPlansResponseError GHC.Base.String
  | -- | Successful response.
    GetPlansResponse200 GetPlansResponseBody200
  | -- | Error response.
    GetPlansResponseDefault Error
  deriving (GHC.Show.Show, GHC.Classes.Eq)

-- | Defines the data type for the schema GetPlansResponseBody200
data GetPlansResponseBody200
  = GetPlansResponseBody200
      { -- | data
        getPlansResponseBody200Data :: ([] Plan),
        -- | has_more: True if this list has another page of items after this one that can be fetched.
        getPlansResponseBody200HasMore :: GHC.Types.Bool,
        -- | object: String representing the object\'s type. Objects of the same type share the same value. Always has the value \`list\`.
        getPlansResponseBody200Object :: GetPlansResponseBody200Object',
        -- | url: The URL where this list can be accessed.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        -- * Must match pattern \'^\/v1\/plans\'
        getPlansResponseBody200Url :: Data.Text.Internal.Text
      }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.ToJSON GetPlansResponseBody200 where
  toJSON obj = Data.Aeson.object ((Data.Aeson..=) "data" (getPlansResponseBody200Data obj) : (Data.Aeson..=) "has_more" (getPlansResponseBody200HasMore obj) : (Data.Aeson..=) "object" (getPlansResponseBody200Object obj) : (Data.Aeson..=) "url" (getPlansResponseBody200Url obj) : [])
  toEncoding obj = Data.Aeson.pairs ((Data.Aeson..=) "data" (getPlansResponseBody200Data obj) GHC.Base.<> ((Data.Aeson..=) "has_more" (getPlansResponseBody200HasMore obj) GHC.Base.<> ((Data.Aeson..=) "object" (getPlansResponseBody200Object obj) GHC.Base.<> (Data.Aeson..=) "url" (getPlansResponseBody200Url obj))))

instance Data.Aeson.Types.FromJSON.FromJSON GetPlansResponseBody200 where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "GetPlansResponseBody200" (\obj -> (((GHC.Base.pure GetPlansResponseBody200 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "data")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "has_more")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "object")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "url"))

-- | Defines the enum schema GetPlansResponseBody200Object\'
--
-- String representing the object\'s type. Objects of the same type share the same value. Always has the value \`list\`.
data GetPlansResponseBody200Object'
  = GetPlansResponseBody200Object'EnumOther Data.Aeson.Types.Internal.Value
  | GetPlansResponseBody200Object'EnumTyped Data.Text.Internal.Text
  | GetPlansResponseBody200Object'EnumStringList
  deriving (GHC.Show.Show, GHC.Classes.Eq)

instance Data.Aeson.ToJSON GetPlansResponseBody200Object' where
  toJSON (GetPlansResponseBody200Object'EnumOther patternName) = Data.Aeson.Types.ToJSON.toJSON patternName
  toJSON (GetPlansResponseBody200Object'EnumTyped patternName) = Data.Aeson.Types.ToJSON.toJSON patternName
  toJSON (GetPlansResponseBody200Object'EnumStringList) = Data.Aeson.Types.Internal.String GHC.Base.$ Data.Text.pack "list"

instance Data.Aeson.FromJSON GetPlansResponseBody200Object' where
  parseJSON val =
    GHC.Base.pure
      ( if val GHC.Classes.== (Data.Aeson.Types.Internal.String GHC.Base.$ Data.Text.pack "list")
          then GetPlansResponseBody200Object'EnumStringList
          else GetPlansResponseBody200Object'EnumOther val
      )

-- | > GET /v1/plans
--
-- The same as 'getPlans' but accepts an explicit configuration.
getPlansWithConfiguration ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | The configuration to use in the request
  StripeAPI.Common.Configuration ->
  -- | Contains all available parameters of this operation (query and path parameters)
  GetPlansParameters ->
  -- | Monadic computation which returns the result of the operation
  m (Network.HTTP.Client.Types.Response GetPlansResponse)
getPlansWithConfiguration
  config
  parameters =
    GHC.Base.fmap
      ( \response_2 ->
          GHC.Base.fmap
            ( Data.Either.either GetPlansResponseError GHC.Base.id
                GHC.Base.. ( \response body ->
                               if  | (\status_3 -> Network.HTTP.Types.Status.statusCode status_3 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) ->
                                     GetPlansResponse200
                                       Data.Functor.<$> ( Data.Aeson.eitherDecodeStrict body ::
                                                            Data.Either.Either GHC.Base.String
                                                              GetPlansResponseBody200
                                                        )
                                   | GHC.Base.const GHC.Types.True (Network.HTTP.Client.Types.responseStatus response) ->
                                     GetPlansResponseDefault
                                       Data.Functor.<$> ( Data.Aeson.eitherDecodeStrict body ::
                                                            Data.Either.Either GHC.Base.String
                                                              Error
                                                        )
                                   | GHC.Base.otherwise -> Data.Either.Left "Missing default response type"
                           )
                  response_2
            )
            response_2
      )
      ( StripeAPI.Common.doCallWithConfiguration
          config
          (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET")
          (Data.Text.pack "/v1/plans")
          [ StripeAPI.Common.QueryParameter (Data.Text.pack "active") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPlansParametersQueryActive parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "created") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPlansParametersQueryCreated parameters) (Data.Text.pack "deepObject") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "ending_before") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPlansParametersQueryEndingBefore parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPlansParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "limit") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPlansParametersQueryLimit parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "product") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPlansParametersQueryProduct parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "starting_after") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPlansParametersQueryStartingAfter parameters) (Data.Text.pack "form") GHC.Types.True
          ]
      )

-- | > GET /v1/plans
--
-- The same as 'getPlans' but returns the raw 'Data.ByteString.Char8.ByteString'.
getPlansRaw ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | Contains all available parameters of this operation (query and path parameters)
  GetPlansParameters ->
  -- | Monadic computation which returns the result of the operation
  StripeAPI.Common.StripeT m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.ByteString)
getPlansRaw parameters =
  GHC.Base.id
    ( StripeAPI.Common.doCallWithConfigurationM
        (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET")
        (Data.Text.pack "/v1/plans")
        [ StripeAPI.Common.QueryParameter (Data.Text.pack "active") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPlansParametersQueryActive parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "created") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPlansParametersQueryCreated parameters) (Data.Text.pack "deepObject") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "ending_before") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPlansParametersQueryEndingBefore parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPlansParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "limit") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPlansParametersQueryLimit parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "product") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPlansParametersQueryProduct parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "starting_after") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPlansParametersQueryStartingAfter parameters) (Data.Text.pack "form") GHC.Types.True
        ]
    )

-- | > GET /v1/plans
--
-- The same as 'getPlans' but accepts an explicit configuration and returns the raw 'Data.ByteString.Char8.ByteString'.
getPlansWithConfigurationRaw ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | The configuration to use in the request
  StripeAPI.Common.Configuration ->
  -- | Contains all available parameters of this operation (query and path parameters)
  GetPlansParameters ->
  -- | Monadic computation which returns the result of the operation
  m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.ByteString)
getPlansWithConfigurationRaw
  config
  parameters =
    GHC.Base.id
      ( StripeAPI.Common.doCallWithConfiguration
          config
          (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET")
          (Data.Text.pack "/v1/plans")
          [ StripeAPI.Common.QueryParameter (Data.Text.pack "active") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPlansParametersQueryActive parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "created") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPlansParametersQueryCreated parameters) (Data.Text.pack "deepObject") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "ending_before") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPlansParametersQueryEndingBefore parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPlansParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "limit") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPlansParametersQueryLimit parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "product") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPlansParametersQueryProduct parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "starting_after") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPlansParametersQueryStartingAfter parameters) (Data.Text.pack "form") GHC.Types.True
          ]
      )
