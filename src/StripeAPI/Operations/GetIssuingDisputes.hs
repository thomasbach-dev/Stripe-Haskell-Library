{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE OverloadedStrings #-}

-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.

-- | Contains the different functions to run the operation getIssuingDisputes
module StripeAPI.Operations.GetIssuingDisputes where

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

-- | > GET /v1/issuing/disputes
--
-- \<p>Returns a list of Issuing \<code>Dispute\<\/code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.\<\/p>
getIssuingDisputes ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | Contains all available parameters of this operation (query and path parameters)
  GetIssuingDisputesParameters ->
  -- | Monadic computation which returns the result of the operation
  StripeAPI.Common.StripeT m (Network.HTTP.Client.Types.Response GetIssuingDisputesResponse)
getIssuingDisputes parameters =
  GHC.Base.fmap
    ( \response_0 ->
        GHC.Base.fmap
          ( Data.Either.either GetIssuingDisputesResponseError GHC.Base.id
              GHC.Base.. ( \response body ->
                             if  | (\status_1 -> Network.HTTP.Types.Status.statusCode status_1 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) ->
                                   GetIssuingDisputesResponse200
                                     Data.Functor.<$> ( Data.Aeson.eitherDecodeStrict body ::
                                                          Data.Either.Either GHC.Base.String
                                                            GetIssuingDisputesResponseBody200
                                                      )
                                 | GHC.Base.const GHC.Types.True (Network.HTTP.Client.Types.responseStatus response) ->
                                   GetIssuingDisputesResponseDefault
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
        (Data.Text.pack "/v1/issuing/disputes")
        [ StripeAPI.Common.QueryParameter (Data.Text.pack "created") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getIssuingDisputesParametersQueryCreated parameters) (Data.Text.pack "deepObject") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "disputed_transaction") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getIssuingDisputesParametersQueryDisputedTransaction parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "ending_before") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getIssuingDisputesParametersQueryEndingBefore parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getIssuingDisputesParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "limit") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getIssuingDisputesParametersQueryLimit parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "starting_after") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getIssuingDisputesParametersQueryStartingAfter parameters) (Data.Text.pack "form") GHC.Types.True
        ]
    )

-- | Defines the data type for the schema getIssuingDisputesParameters
data GetIssuingDisputesParameters
  = GetIssuingDisputesParameters
      { -- | queryCreated: Represents the parameter named \'created\'
        --
        -- Only return issuing disputes that were created during the given date interval.
        getIssuingDisputesParametersQueryCreated :: (GHC.Maybe.Maybe GetIssuingDisputesParametersQueryCreated'Variants),
        -- | queryDisputed_transaction: Represents the parameter named \'disputed_transaction\'
        --
        -- Only return issuing disputes for the given transaction.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        getIssuingDisputesParametersQueryDisputedTransaction :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
        -- | queryEnding_before: Represents the parameter named \'ending_before\'
        --
        -- A cursor for use in pagination. \`ending_before\` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with \`obj_bar\`, your subsequent call can include \`ending_before=obj_bar\` in order to fetch the previous page of the list.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        getIssuingDisputesParametersQueryEndingBefore :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
        -- | queryExpand: Represents the parameter named \'expand\'
        --
        -- Specifies which fields in the response should be expanded.
        getIssuingDisputesParametersQueryExpand :: (GHC.Maybe.Maybe ([] Data.Text.Internal.Text)),
        -- | queryLimit: Represents the parameter named \'limit\'
        --
        -- A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
        getIssuingDisputesParametersQueryLimit :: (GHC.Maybe.Maybe GHC.Types.Int),
        -- | queryStarting_after: Represents the parameter named \'starting_after\'
        --
        -- A cursor for use in pagination. \`starting_after\` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with \`obj_foo\`, your subsequent call can include \`starting_after=obj_foo\` in order to fetch the next page of the list.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        getIssuingDisputesParametersQueryStartingAfter :: (GHC.Maybe.Maybe Data.Text.Internal.Text)
      }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.ToJSON GetIssuingDisputesParameters where
  toJSON obj = Data.Aeson.object ((Data.Aeson..=) "queryCreated" (getIssuingDisputesParametersQueryCreated obj) : (Data.Aeson..=) "queryDisputed_transaction" (getIssuingDisputesParametersQueryDisputedTransaction obj) : (Data.Aeson..=) "queryEnding_before" (getIssuingDisputesParametersQueryEndingBefore obj) : (Data.Aeson..=) "queryExpand" (getIssuingDisputesParametersQueryExpand obj) : (Data.Aeson..=) "queryLimit" (getIssuingDisputesParametersQueryLimit obj) : (Data.Aeson..=) "queryStarting_after" (getIssuingDisputesParametersQueryStartingAfter obj) : [])
  toEncoding obj = Data.Aeson.pairs ((Data.Aeson..=) "queryCreated" (getIssuingDisputesParametersQueryCreated obj) GHC.Base.<> ((Data.Aeson..=) "queryDisputed_transaction" (getIssuingDisputesParametersQueryDisputedTransaction obj) GHC.Base.<> ((Data.Aeson..=) "queryEnding_before" (getIssuingDisputesParametersQueryEndingBefore obj) GHC.Base.<> ((Data.Aeson..=) "queryExpand" (getIssuingDisputesParametersQueryExpand obj) GHC.Base.<> ((Data.Aeson..=) "queryLimit" (getIssuingDisputesParametersQueryLimit obj) GHC.Base.<> (Data.Aeson..=) "queryStarting_after" (getIssuingDisputesParametersQueryStartingAfter obj))))))

instance Data.Aeson.Types.FromJSON.FromJSON GetIssuingDisputesParameters where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "GetIssuingDisputesParameters" (\obj -> (((((GHC.Base.pure GetIssuingDisputesParameters GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryCreated")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryDisputed_transaction")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryEnding_before")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryExpand")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryLimit")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryStarting_after"))

-- | Defines the data type for the schema getIssuingDisputesParametersQueryCreated\'OneOf2
data GetIssuingDisputesParametersQueryCreated'OneOf2
  = GetIssuingDisputesParametersQueryCreated'OneOf2
      { -- | gt
        getIssuingDisputesParametersQueryCreated'OneOf2Gt :: (GHC.Maybe.Maybe GHC.Types.Int),
        -- | gte
        getIssuingDisputesParametersQueryCreated'OneOf2Gte :: (GHC.Maybe.Maybe GHC.Types.Int),
        -- | lt
        getIssuingDisputesParametersQueryCreated'OneOf2Lt :: (GHC.Maybe.Maybe GHC.Types.Int),
        -- | lte
        getIssuingDisputesParametersQueryCreated'OneOf2Lte :: (GHC.Maybe.Maybe GHC.Types.Int)
      }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.ToJSON GetIssuingDisputesParametersQueryCreated'OneOf2 where
  toJSON obj = Data.Aeson.object ((Data.Aeson..=) "gt" (getIssuingDisputesParametersQueryCreated'OneOf2Gt obj) : (Data.Aeson..=) "gte" (getIssuingDisputesParametersQueryCreated'OneOf2Gte obj) : (Data.Aeson..=) "lt" (getIssuingDisputesParametersQueryCreated'OneOf2Lt obj) : (Data.Aeson..=) "lte" (getIssuingDisputesParametersQueryCreated'OneOf2Lte obj) : [])
  toEncoding obj = Data.Aeson.pairs ((Data.Aeson..=) "gt" (getIssuingDisputesParametersQueryCreated'OneOf2Gt obj) GHC.Base.<> ((Data.Aeson..=) "gte" (getIssuingDisputesParametersQueryCreated'OneOf2Gte obj) GHC.Base.<> ((Data.Aeson..=) "lt" (getIssuingDisputesParametersQueryCreated'OneOf2Lt obj) GHC.Base.<> (Data.Aeson..=) "lte" (getIssuingDisputesParametersQueryCreated'OneOf2Lte obj))))

instance Data.Aeson.Types.FromJSON.FromJSON GetIssuingDisputesParametersQueryCreated'OneOf2 where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "GetIssuingDisputesParametersQueryCreated'OneOf2" (\obj -> (((GHC.Base.pure GetIssuingDisputesParametersQueryCreated'OneOf2 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "gt")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "gte")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "lt")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "lte"))

-- | Define the one-of schema getIssuingDisputesParametersQueryCreated\'
--
-- Represents the parameter named \'created\'
--
-- Only return issuing disputes that were created during the given date interval.
data GetIssuingDisputesParametersQueryCreated'Variants
  = GetIssuingDisputesParametersQueryCreated'Int GHC.Types.Int
  | GetIssuingDisputesParametersQueryCreated'GetIssuingDisputesParametersQueryCreated'OneOf2 GetIssuingDisputesParametersQueryCreated'OneOf2
  deriving (GHC.Show.Show, GHC.Classes.Eq, GHC.Generics.Generic)

instance Data.Aeson.ToJSON GetIssuingDisputesParametersQueryCreated'Variants where
  toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions {Data.Aeson.Types.Internal.sumEncoding = Data.Aeson.Types.Internal.UntaggedValue}

instance Data.Aeson.FromJSON GetIssuingDisputesParametersQueryCreated'Variants where
  parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions {Data.Aeson.Types.Internal.sumEncoding = Data.Aeson.Types.Internal.UntaggedValue}

-- | Represents a response of the operation 'getIssuingDisputes'.
--
-- The response constructor is chosen by the status code of the response. If no case matches (no specific case for the response code, no range case, no default case), 'GetIssuingDisputesResponseError' is used.
data GetIssuingDisputesResponse
  = -- | Means either no matching case available or a parse error
    GetIssuingDisputesResponseError GHC.Base.String
  | -- | Successful response.
    GetIssuingDisputesResponse200 GetIssuingDisputesResponseBody200
  | -- | Error response.
    GetIssuingDisputesResponseDefault Error
  deriving (GHC.Show.Show, GHC.Classes.Eq)

-- | Defines the data type for the schema GetIssuingDisputesResponseBody200
data GetIssuingDisputesResponseBody200
  = GetIssuingDisputesResponseBody200
      { -- | data
        getIssuingDisputesResponseBody200Data :: ([] Issuing'dispute),
        -- | has_more: True if this list has another page of items after this one that can be fetched.
        getIssuingDisputesResponseBody200HasMore :: GHC.Types.Bool,
        -- | object: String representing the object\'s type. Objects of the same type share the same value. Always has the value \`list\`.
        getIssuingDisputesResponseBody200Object :: GetIssuingDisputesResponseBody200Object',
        -- | url: The URL where this list can be accessed.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        -- * Must match pattern \'^\/v1\/issuing\/disputes\'
        getIssuingDisputesResponseBody200Url :: Data.Text.Internal.Text
      }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.ToJSON GetIssuingDisputesResponseBody200 where
  toJSON obj = Data.Aeson.object ((Data.Aeson..=) "data" (getIssuingDisputesResponseBody200Data obj) : (Data.Aeson..=) "has_more" (getIssuingDisputesResponseBody200HasMore obj) : (Data.Aeson..=) "object" (getIssuingDisputesResponseBody200Object obj) : (Data.Aeson..=) "url" (getIssuingDisputesResponseBody200Url obj) : [])
  toEncoding obj = Data.Aeson.pairs ((Data.Aeson..=) "data" (getIssuingDisputesResponseBody200Data obj) GHC.Base.<> ((Data.Aeson..=) "has_more" (getIssuingDisputesResponseBody200HasMore obj) GHC.Base.<> ((Data.Aeson..=) "object" (getIssuingDisputesResponseBody200Object obj) GHC.Base.<> (Data.Aeson..=) "url" (getIssuingDisputesResponseBody200Url obj))))

instance Data.Aeson.Types.FromJSON.FromJSON GetIssuingDisputesResponseBody200 where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "GetIssuingDisputesResponseBody200" (\obj -> (((GHC.Base.pure GetIssuingDisputesResponseBody200 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "data")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "has_more")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "object")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "url"))

-- | Defines the enum schema GetIssuingDisputesResponseBody200Object\'
--
-- String representing the object\'s type. Objects of the same type share the same value. Always has the value \`list\`.
data GetIssuingDisputesResponseBody200Object'
  = GetIssuingDisputesResponseBody200Object'EnumOther Data.Aeson.Types.Internal.Value
  | GetIssuingDisputesResponseBody200Object'EnumTyped Data.Text.Internal.Text
  | GetIssuingDisputesResponseBody200Object'EnumStringList
  deriving (GHC.Show.Show, GHC.Classes.Eq)

instance Data.Aeson.ToJSON GetIssuingDisputesResponseBody200Object' where
  toJSON (GetIssuingDisputesResponseBody200Object'EnumOther patternName) = Data.Aeson.Types.ToJSON.toJSON patternName
  toJSON (GetIssuingDisputesResponseBody200Object'EnumTyped patternName) = Data.Aeson.Types.ToJSON.toJSON patternName
  toJSON (GetIssuingDisputesResponseBody200Object'EnumStringList) = Data.Aeson.Types.Internal.String GHC.Base.$ Data.Text.pack "list"

instance Data.Aeson.FromJSON GetIssuingDisputesResponseBody200Object' where
  parseJSON val =
    GHC.Base.pure
      ( if val GHC.Classes.== (Data.Aeson.Types.Internal.String GHC.Base.$ Data.Text.pack "list")
          then GetIssuingDisputesResponseBody200Object'EnumStringList
          else GetIssuingDisputesResponseBody200Object'EnumOther val
      )

-- | > GET /v1/issuing/disputes
--
-- The same as 'getIssuingDisputes' but accepts an explicit configuration.
getIssuingDisputesWithConfiguration ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | The configuration to use in the request
  StripeAPI.Common.Configuration ->
  -- | Contains all available parameters of this operation (query and path parameters)
  GetIssuingDisputesParameters ->
  -- | Monadic computation which returns the result of the operation
  m (Network.HTTP.Client.Types.Response GetIssuingDisputesResponse)
getIssuingDisputesWithConfiguration
  config
  parameters =
    GHC.Base.fmap
      ( \response_2 ->
          GHC.Base.fmap
            ( Data.Either.either GetIssuingDisputesResponseError GHC.Base.id
                GHC.Base.. ( \response body ->
                               if  | (\status_3 -> Network.HTTP.Types.Status.statusCode status_3 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) ->
                                     GetIssuingDisputesResponse200
                                       Data.Functor.<$> ( Data.Aeson.eitherDecodeStrict body ::
                                                            Data.Either.Either GHC.Base.String
                                                              GetIssuingDisputesResponseBody200
                                                        )
                                   | GHC.Base.const GHC.Types.True (Network.HTTP.Client.Types.responseStatus response) ->
                                     GetIssuingDisputesResponseDefault
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
          (Data.Text.pack "/v1/issuing/disputes")
          [ StripeAPI.Common.QueryParameter (Data.Text.pack "created") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getIssuingDisputesParametersQueryCreated parameters) (Data.Text.pack "deepObject") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "disputed_transaction") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getIssuingDisputesParametersQueryDisputedTransaction parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "ending_before") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getIssuingDisputesParametersQueryEndingBefore parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getIssuingDisputesParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "limit") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getIssuingDisputesParametersQueryLimit parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "starting_after") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getIssuingDisputesParametersQueryStartingAfter parameters) (Data.Text.pack "form") GHC.Types.True
          ]
      )

-- | > GET /v1/issuing/disputes
--
-- The same as 'getIssuingDisputes' but returns the raw 'Data.ByteString.Char8.ByteString'.
getIssuingDisputesRaw ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | Contains all available parameters of this operation (query and path parameters)
  GetIssuingDisputesParameters ->
  -- | Monadic computation which returns the result of the operation
  StripeAPI.Common.StripeT m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.ByteString)
getIssuingDisputesRaw parameters =
  GHC.Base.id
    ( StripeAPI.Common.doCallWithConfigurationM
        (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET")
        (Data.Text.pack "/v1/issuing/disputes")
        [ StripeAPI.Common.QueryParameter (Data.Text.pack "created") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getIssuingDisputesParametersQueryCreated parameters) (Data.Text.pack "deepObject") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "disputed_transaction") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getIssuingDisputesParametersQueryDisputedTransaction parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "ending_before") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getIssuingDisputesParametersQueryEndingBefore parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getIssuingDisputesParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "limit") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getIssuingDisputesParametersQueryLimit parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "starting_after") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getIssuingDisputesParametersQueryStartingAfter parameters) (Data.Text.pack "form") GHC.Types.True
        ]
    )

-- | > GET /v1/issuing/disputes
--
-- The same as 'getIssuingDisputes' but accepts an explicit configuration and returns the raw 'Data.ByteString.Char8.ByteString'.
getIssuingDisputesWithConfigurationRaw ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | The configuration to use in the request
  StripeAPI.Common.Configuration ->
  -- | Contains all available parameters of this operation (query and path parameters)
  GetIssuingDisputesParameters ->
  -- | Monadic computation which returns the result of the operation
  m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.ByteString)
getIssuingDisputesWithConfigurationRaw
  config
  parameters =
    GHC.Base.id
      ( StripeAPI.Common.doCallWithConfiguration
          config
          (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET")
          (Data.Text.pack "/v1/issuing/disputes")
          [ StripeAPI.Common.QueryParameter (Data.Text.pack "created") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getIssuingDisputesParametersQueryCreated parameters) (Data.Text.pack "deepObject") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "disputed_transaction") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getIssuingDisputesParametersQueryDisputedTransaction parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "ending_before") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getIssuingDisputesParametersQueryEndingBefore parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getIssuingDisputesParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "limit") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getIssuingDisputesParametersQueryLimit parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "starting_after") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getIssuingDisputesParametersQueryStartingAfter parameters) (Data.Text.pack "form") GHC.Types.True
          ]
      )
