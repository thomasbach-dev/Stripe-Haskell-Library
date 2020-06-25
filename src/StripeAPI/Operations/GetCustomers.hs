{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE OverloadedStrings #-}

-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.

-- | Contains the different functions to run the operation getCustomers
module StripeAPI.Operations.GetCustomers where

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

-- | > GET /v1/customers
--
-- \<p>Returns a list of your customers. The customers are returned sorted by creation date, with the most recent customers appearing first.\<\/p>
getCustomers ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | Contains all available parameters of this operation (query and path parameters)
  GetCustomersParameters ->
  -- | Monadic computation which returns the result of the operation
  StripeAPI.Common.StripeT m (Network.HTTP.Client.Types.Response GetCustomersResponse)
getCustomers parameters =
  GHC.Base.fmap
    ( \response_0 ->
        GHC.Base.fmap
          ( Data.Either.either GetCustomersResponseError GHC.Base.id
              GHC.Base.. ( \response body ->
                             if  | (\status_1 -> Network.HTTP.Types.Status.statusCode status_1 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) ->
                                   GetCustomersResponse200
                                     Data.Functor.<$> ( Data.Aeson.eitherDecodeStrict body ::
                                                          Data.Either.Either GHC.Base.String
                                                            GetCustomersResponseBody200
                                                      )
                                 | GHC.Base.const GHC.Types.True (Network.HTTP.Client.Types.responseStatus response) ->
                                   GetCustomersResponseDefault
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
        (Data.Text.pack "/v1/customers")
        [ StripeAPI.Common.QueryParameter (Data.Text.pack "created") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCustomersParametersQueryCreated parameters) (Data.Text.pack "deepObject") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "email") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCustomersParametersQueryEmail parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "ending_before") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCustomersParametersQueryEndingBefore parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCustomersParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "limit") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCustomersParametersQueryLimit parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "starting_after") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCustomersParametersQueryStartingAfter parameters) (Data.Text.pack "form") GHC.Types.True
        ]
    )

-- | Defines the data type for the schema getCustomersParameters
data GetCustomersParameters
  = GetCustomersParameters
      { -- | queryCreated: Represents the parameter named \'created\'
        getCustomersParametersQueryCreated :: (GHC.Maybe.Maybe GetCustomersParametersQueryCreated'Variants),
        -- | queryEmail: Represents the parameter named \'email\'
        --
        -- A filter on the list based on the customer\'s \`email\` field. The value must be a string.
        --
        -- Constraints:
        --
        -- * Maximum length of 512
        getCustomersParametersQueryEmail :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
        -- | queryEnding_before: Represents the parameter named \'ending_before\'
        --
        -- A cursor for use in pagination. \`ending_before\` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with \`obj_bar\`, your subsequent call can include \`ending_before=obj_bar\` in order to fetch the previous page of the list.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        getCustomersParametersQueryEndingBefore :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
        -- | queryExpand: Represents the parameter named \'expand\'
        --
        -- Specifies which fields in the response should be expanded.
        getCustomersParametersQueryExpand :: (GHC.Maybe.Maybe ([] Data.Text.Internal.Text)),
        -- | queryLimit: Represents the parameter named \'limit\'
        --
        -- A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
        getCustomersParametersQueryLimit :: (GHC.Maybe.Maybe GHC.Types.Int),
        -- | queryStarting_after: Represents the parameter named \'starting_after\'
        --
        -- A cursor for use in pagination. \`starting_after\` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with \`obj_foo\`, your subsequent call can include \`starting_after=obj_foo\` in order to fetch the next page of the list.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        getCustomersParametersQueryStartingAfter :: (GHC.Maybe.Maybe Data.Text.Internal.Text)
      }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.ToJSON GetCustomersParameters where
  toJSON obj = Data.Aeson.object ((Data.Aeson..=) "queryCreated" (getCustomersParametersQueryCreated obj) : (Data.Aeson..=) "queryEmail" (getCustomersParametersQueryEmail obj) : (Data.Aeson..=) "queryEnding_before" (getCustomersParametersQueryEndingBefore obj) : (Data.Aeson..=) "queryExpand" (getCustomersParametersQueryExpand obj) : (Data.Aeson..=) "queryLimit" (getCustomersParametersQueryLimit obj) : (Data.Aeson..=) "queryStarting_after" (getCustomersParametersQueryStartingAfter obj) : [])
  toEncoding obj = Data.Aeson.pairs ((Data.Aeson..=) "queryCreated" (getCustomersParametersQueryCreated obj) GHC.Base.<> ((Data.Aeson..=) "queryEmail" (getCustomersParametersQueryEmail obj) GHC.Base.<> ((Data.Aeson..=) "queryEnding_before" (getCustomersParametersQueryEndingBefore obj) GHC.Base.<> ((Data.Aeson..=) "queryExpand" (getCustomersParametersQueryExpand obj) GHC.Base.<> ((Data.Aeson..=) "queryLimit" (getCustomersParametersQueryLimit obj) GHC.Base.<> (Data.Aeson..=) "queryStarting_after" (getCustomersParametersQueryStartingAfter obj))))))

instance Data.Aeson.Types.FromJSON.FromJSON GetCustomersParameters where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "GetCustomersParameters" (\obj -> (((((GHC.Base.pure GetCustomersParameters GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryCreated")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryEmail")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryEnding_before")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryExpand")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryLimit")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryStarting_after"))

-- | Defines the data type for the schema getCustomersParametersQueryCreated\'OneOf2
data GetCustomersParametersQueryCreated'OneOf2
  = GetCustomersParametersQueryCreated'OneOf2
      { -- | gt
        getCustomersParametersQueryCreated'OneOf2Gt :: (GHC.Maybe.Maybe GHC.Types.Int),
        -- | gte
        getCustomersParametersQueryCreated'OneOf2Gte :: (GHC.Maybe.Maybe GHC.Types.Int),
        -- | lt
        getCustomersParametersQueryCreated'OneOf2Lt :: (GHC.Maybe.Maybe GHC.Types.Int),
        -- | lte
        getCustomersParametersQueryCreated'OneOf2Lte :: (GHC.Maybe.Maybe GHC.Types.Int)
      }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.ToJSON GetCustomersParametersQueryCreated'OneOf2 where
  toJSON obj = Data.Aeson.object ((Data.Aeson..=) "gt" (getCustomersParametersQueryCreated'OneOf2Gt obj) : (Data.Aeson..=) "gte" (getCustomersParametersQueryCreated'OneOf2Gte obj) : (Data.Aeson..=) "lt" (getCustomersParametersQueryCreated'OneOf2Lt obj) : (Data.Aeson..=) "lte" (getCustomersParametersQueryCreated'OneOf2Lte obj) : [])
  toEncoding obj = Data.Aeson.pairs ((Data.Aeson..=) "gt" (getCustomersParametersQueryCreated'OneOf2Gt obj) GHC.Base.<> ((Data.Aeson..=) "gte" (getCustomersParametersQueryCreated'OneOf2Gte obj) GHC.Base.<> ((Data.Aeson..=) "lt" (getCustomersParametersQueryCreated'OneOf2Lt obj) GHC.Base.<> (Data.Aeson..=) "lte" (getCustomersParametersQueryCreated'OneOf2Lte obj))))

instance Data.Aeson.Types.FromJSON.FromJSON GetCustomersParametersQueryCreated'OneOf2 where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "GetCustomersParametersQueryCreated'OneOf2" (\obj -> (((GHC.Base.pure GetCustomersParametersQueryCreated'OneOf2 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "gt")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "gte")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "lt")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "lte"))

-- | Define the one-of schema getCustomersParametersQueryCreated\'
--
-- Represents the parameter named \'created\'
data GetCustomersParametersQueryCreated'Variants
  = GetCustomersParametersQueryCreated'Int GHC.Types.Int
  | GetCustomersParametersQueryCreated'GetCustomersParametersQueryCreated'OneOf2 GetCustomersParametersQueryCreated'OneOf2
  deriving (GHC.Show.Show, GHC.Classes.Eq, GHC.Generics.Generic)

instance Data.Aeson.ToJSON GetCustomersParametersQueryCreated'Variants where
  toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions {Data.Aeson.Types.Internal.sumEncoding = Data.Aeson.Types.Internal.UntaggedValue}

instance Data.Aeson.FromJSON GetCustomersParametersQueryCreated'Variants where
  parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions {Data.Aeson.Types.Internal.sumEncoding = Data.Aeson.Types.Internal.UntaggedValue}

-- | Represents a response of the operation 'getCustomers'.
--
-- The response constructor is chosen by the status code of the response. If no case matches (no specific case for the response code, no range case, no default case), 'GetCustomersResponseError' is used.
data GetCustomersResponse
  = -- | Means either no matching case available or a parse error
    GetCustomersResponseError GHC.Base.String
  | -- | Successful response.
    GetCustomersResponse200 GetCustomersResponseBody200
  | -- | Error response.
    GetCustomersResponseDefault Error
  deriving (GHC.Show.Show, GHC.Classes.Eq)

-- | Defines the data type for the schema GetCustomersResponseBody200
data GetCustomersResponseBody200
  = GetCustomersResponseBody200
      { -- | data
        getCustomersResponseBody200Data :: ([] Customer),
        -- | has_more: True if this list has another page of items after this one that can be fetched.
        getCustomersResponseBody200HasMore :: GHC.Types.Bool,
        -- | object: String representing the object\'s type. Objects of the same type share the same value. Always has the value \`list\`.
        getCustomersResponseBody200Object :: GetCustomersResponseBody200Object',
        -- | url: The URL where this list can be accessed.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        -- * Must match pattern \'^\/v1\/customers\'
        getCustomersResponseBody200Url :: Data.Text.Internal.Text
      }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.ToJSON GetCustomersResponseBody200 where
  toJSON obj = Data.Aeson.object ((Data.Aeson..=) "data" (getCustomersResponseBody200Data obj) : (Data.Aeson..=) "has_more" (getCustomersResponseBody200HasMore obj) : (Data.Aeson..=) "object" (getCustomersResponseBody200Object obj) : (Data.Aeson..=) "url" (getCustomersResponseBody200Url obj) : [])
  toEncoding obj = Data.Aeson.pairs ((Data.Aeson..=) "data" (getCustomersResponseBody200Data obj) GHC.Base.<> ((Data.Aeson..=) "has_more" (getCustomersResponseBody200HasMore obj) GHC.Base.<> ((Data.Aeson..=) "object" (getCustomersResponseBody200Object obj) GHC.Base.<> (Data.Aeson..=) "url" (getCustomersResponseBody200Url obj))))

instance Data.Aeson.Types.FromJSON.FromJSON GetCustomersResponseBody200 where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "GetCustomersResponseBody200" (\obj -> (((GHC.Base.pure GetCustomersResponseBody200 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "data")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "has_more")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "object")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "url"))

-- | Defines the enum schema GetCustomersResponseBody200Object\'
--
-- String representing the object\'s type. Objects of the same type share the same value. Always has the value \`list\`.
data GetCustomersResponseBody200Object'
  = GetCustomersResponseBody200Object'EnumOther Data.Aeson.Types.Internal.Value
  | GetCustomersResponseBody200Object'EnumTyped Data.Text.Internal.Text
  | GetCustomersResponseBody200Object'EnumStringList
  deriving (GHC.Show.Show, GHC.Classes.Eq)

instance Data.Aeson.ToJSON GetCustomersResponseBody200Object' where
  toJSON (GetCustomersResponseBody200Object'EnumOther patternName) = Data.Aeson.Types.ToJSON.toJSON patternName
  toJSON (GetCustomersResponseBody200Object'EnumTyped patternName) = Data.Aeson.Types.ToJSON.toJSON patternName
  toJSON (GetCustomersResponseBody200Object'EnumStringList) = Data.Aeson.Types.Internal.String GHC.Base.$ Data.Text.pack "list"

instance Data.Aeson.FromJSON GetCustomersResponseBody200Object' where
  parseJSON val =
    GHC.Base.pure
      ( if val GHC.Classes.== (Data.Aeson.Types.Internal.String GHC.Base.$ Data.Text.pack "list")
          then GetCustomersResponseBody200Object'EnumStringList
          else GetCustomersResponseBody200Object'EnumOther val
      )

-- | > GET /v1/customers
--
-- The same as 'getCustomers' but accepts an explicit configuration.
getCustomersWithConfiguration ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | The configuration to use in the request
  StripeAPI.Common.Configuration ->
  -- | Contains all available parameters of this operation (query and path parameters)
  GetCustomersParameters ->
  -- | Monadic computation which returns the result of the operation
  m (Network.HTTP.Client.Types.Response GetCustomersResponse)
getCustomersWithConfiguration
  config
  parameters =
    GHC.Base.fmap
      ( \response_2 ->
          GHC.Base.fmap
            ( Data.Either.either GetCustomersResponseError GHC.Base.id
                GHC.Base.. ( \response body ->
                               if  | (\status_3 -> Network.HTTP.Types.Status.statusCode status_3 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) ->
                                     GetCustomersResponse200
                                       Data.Functor.<$> ( Data.Aeson.eitherDecodeStrict body ::
                                                            Data.Either.Either GHC.Base.String
                                                              GetCustomersResponseBody200
                                                        )
                                   | GHC.Base.const GHC.Types.True (Network.HTTP.Client.Types.responseStatus response) ->
                                     GetCustomersResponseDefault
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
          (Data.Text.pack "/v1/customers")
          [ StripeAPI.Common.QueryParameter (Data.Text.pack "created") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCustomersParametersQueryCreated parameters) (Data.Text.pack "deepObject") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "email") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCustomersParametersQueryEmail parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "ending_before") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCustomersParametersQueryEndingBefore parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCustomersParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "limit") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCustomersParametersQueryLimit parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "starting_after") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCustomersParametersQueryStartingAfter parameters) (Data.Text.pack "form") GHC.Types.True
          ]
      )

-- | > GET /v1/customers
--
-- The same as 'getCustomers' but returns the raw 'Data.ByteString.Char8.ByteString'.
getCustomersRaw ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | Contains all available parameters of this operation (query and path parameters)
  GetCustomersParameters ->
  -- | Monadic computation which returns the result of the operation
  StripeAPI.Common.StripeT m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.ByteString)
getCustomersRaw parameters =
  GHC.Base.id
    ( StripeAPI.Common.doCallWithConfigurationM
        (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET")
        (Data.Text.pack "/v1/customers")
        [ StripeAPI.Common.QueryParameter (Data.Text.pack "created") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCustomersParametersQueryCreated parameters) (Data.Text.pack "deepObject") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "email") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCustomersParametersQueryEmail parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "ending_before") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCustomersParametersQueryEndingBefore parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCustomersParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "limit") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCustomersParametersQueryLimit parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "starting_after") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCustomersParametersQueryStartingAfter parameters) (Data.Text.pack "form") GHC.Types.True
        ]
    )

-- | > GET /v1/customers
--
-- The same as 'getCustomers' but accepts an explicit configuration and returns the raw 'Data.ByteString.Char8.ByteString'.
getCustomersWithConfigurationRaw ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | The configuration to use in the request
  StripeAPI.Common.Configuration ->
  -- | Contains all available parameters of this operation (query and path parameters)
  GetCustomersParameters ->
  -- | Monadic computation which returns the result of the operation
  m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.ByteString)
getCustomersWithConfigurationRaw
  config
  parameters =
    GHC.Base.id
      ( StripeAPI.Common.doCallWithConfiguration
          config
          (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET")
          (Data.Text.pack "/v1/customers")
          [ StripeAPI.Common.QueryParameter (Data.Text.pack "created") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCustomersParametersQueryCreated parameters) (Data.Text.pack "deepObject") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "email") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCustomersParametersQueryEmail parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "ending_before") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCustomersParametersQueryEndingBefore parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCustomersParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "limit") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCustomersParametersQueryLimit parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "starting_after") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCustomersParametersQueryStartingAfter parameters) (Data.Text.pack "form") GHC.Types.True
          ]
      )
