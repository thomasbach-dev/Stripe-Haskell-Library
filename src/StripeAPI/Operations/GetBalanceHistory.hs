{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE OverloadedStrings #-}

-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.

-- | Contains the different functions to run the operation getBalanceHistory
module StripeAPI.Operations.GetBalanceHistory where

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

-- | > GET /v1/balance/history
--
-- \<p>Returns a list of transactions that have contributed to the Stripe account balance (e.g., charges, transfers, and so forth). The transactions are returned in sorted order, with the most recent transactions appearing first.\<\/p>
--
-- \<p>Note that this endpoint was previously called “Balance history” and used the path \<code>\/v1\/balance\/history\<\/code>.\<\/p>
getBalanceHistory ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | Contains all available parameters of this operation (query and path parameters)
  GetBalanceHistoryParameters ->
  -- | Monadic computation which returns the result of the operation
  StripeAPI.Common.StripeT m (Network.HTTP.Client.Types.Response GetBalanceHistoryResponse)
getBalanceHistory parameters =
  GHC.Base.fmap
    ( \response_0 ->
        GHC.Base.fmap
          ( Data.Either.either GetBalanceHistoryResponseError GHC.Base.id
              GHC.Base.. ( \response body ->
                             if  | (\status_1 -> Network.HTTP.Types.Status.statusCode status_1 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) ->
                                   GetBalanceHistoryResponse200
                                     Data.Functor.<$> ( Data.Aeson.eitherDecodeStrict body ::
                                                          Data.Either.Either GHC.Base.String
                                                            GetBalanceHistoryResponseBody200
                                                      )
                                 | GHC.Base.const GHC.Types.True (Network.HTTP.Client.Types.responseStatus response) ->
                                   GetBalanceHistoryResponseDefault
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
        (Data.Text.pack "/v1/balance/history")
        [ StripeAPI.Common.QueryParameter (Data.Text.pack "available_on") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryAvailableOn parameters) (Data.Text.pack "deepObject") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "created") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryCreated parameters) (Data.Text.pack "deepObject") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "currency") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryCurrency parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "ending_before") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryEndingBefore parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "limit") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryLimit parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "payout") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryPayout parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "source") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQuerySource parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "starting_after") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryStartingAfter parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "type") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryType parameters) (Data.Text.pack "form") GHC.Types.True
        ]
    )

-- | Defines the data type for the schema getBalanceHistoryParameters
data GetBalanceHistoryParameters
  = GetBalanceHistoryParameters
      { -- | queryAvailable_on: Represents the parameter named \'available_on\'
        getBalanceHistoryParametersQueryAvailableOn :: (GHC.Maybe.Maybe GetBalanceHistoryParametersQueryAvailableOn'Variants),
        -- | queryCreated: Represents the parameter named \'created\'
        getBalanceHistoryParametersQueryCreated :: (GHC.Maybe.Maybe GetBalanceHistoryParametersQueryCreated'Variants),
        -- | queryCurrency: Represents the parameter named \'currency\'
        --
        -- Only return transactions in a certain currency. Three-letter [ISO currency code](https:\/\/www.iso.org\/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https:\/\/stripe.com\/docs\/currencies).
        getBalanceHistoryParametersQueryCurrency :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
        -- | queryEnding_before: Represents the parameter named \'ending_before\'
        --
        -- A cursor for use in pagination. \`ending_before\` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with \`obj_bar\`, your subsequent call can include \`ending_before=obj_bar\` in order to fetch the previous page of the list.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        getBalanceHistoryParametersQueryEndingBefore :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
        -- | queryExpand: Represents the parameter named \'expand\'
        --
        -- Specifies which fields in the response should be expanded.
        getBalanceHistoryParametersQueryExpand :: (GHC.Maybe.Maybe ([] Data.Text.Internal.Text)),
        -- | queryLimit: Represents the parameter named \'limit\'
        --
        -- A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
        getBalanceHistoryParametersQueryLimit :: (GHC.Maybe.Maybe GHC.Types.Int),
        -- | queryPayout: Represents the parameter named \'payout\'
        --
        -- For automatic Stripe payouts only, only returns transactions that were paid out on the specified payout ID.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        getBalanceHistoryParametersQueryPayout :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
        -- | querySource: Represents the parameter named \'source\'
        --
        -- Only returns the original transaction.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        getBalanceHistoryParametersQuerySource :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
        -- | queryStarting_after: Represents the parameter named \'starting_after\'
        --
        -- A cursor for use in pagination. \`starting_after\` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with \`obj_foo\`, your subsequent call can include \`starting_after=obj_foo\` in order to fetch the next page of the list.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        getBalanceHistoryParametersQueryStartingAfter :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
        -- | queryType: Represents the parameter named \'type\'
        --
        -- Only returns transactions of the given type. One of: \`charge\`, \`refund\`, \`adjustment\`, \`application_fee\`, \`application_fee_refund\`, \`transfer\`, \`payment\`, \`payout\`, \`payout_failure\`, \`stripe_fee\`, or \`network_cost\`.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        getBalanceHistoryParametersQueryType :: (GHC.Maybe.Maybe Data.Text.Internal.Text)
      }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.ToJSON GetBalanceHistoryParameters where
  toJSON obj = Data.Aeson.object ((Data.Aeson..=) "queryAvailable_on" (getBalanceHistoryParametersQueryAvailableOn obj) : (Data.Aeson..=) "queryCreated" (getBalanceHistoryParametersQueryCreated obj) : (Data.Aeson..=) "queryCurrency" (getBalanceHistoryParametersQueryCurrency obj) : (Data.Aeson..=) "queryEnding_before" (getBalanceHistoryParametersQueryEndingBefore obj) : (Data.Aeson..=) "queryExpand" (getBalanceHistoryParametersQueryExpand obj) : (Data.Aeson..=) "queryLimit" (getBalanceHistoryParametersQueryLimit obj) : (Data.Aeson..=) "queryPayout" (getBalanceHistoryParametersQueryPayout obj) : (Data.Aeson..=) "querySource" (getBalanceHistoryParametersQuerySource obj) : (Data.Aeson..=) "queryStarting_after" (getBalanceHistoryParametersQueryStartingAfter obj) : (Data.Aeson..=) "queryType" (getBalanceHistoryParametersQueryType obj) : [])
  toEncoding obj = Data.Aeson.pairs ((Data.Aeson..=) "queryAvailable_on" (getBalanceHistoryParametersQueryAvailableOn obj) GHC.Base.<> ((Data.Aeson..=) "queryCreated" (getBalanceHistoryParametersQueryCreated obj) GHC.Base.<> ((Data.Aeson..=) "queryCurrency" (getBalanceHistoryParametersQueryCurrency obj) GHC.Base.<> ((Data.Aeson..=) "queryEnding_before" (getBalanceHistoryParametersQueryEndingBefore obj) GHC.Base.<> ((Data.Aeson..=) "queryExpand" (getBalanceHistoryParametersQueryExpand obj) GHC.Base.<> ((Data.Aeson..=) "queryLimit" (getBalanceHistoryParametersQueryLimit obj) GHC.Base.<> ((Data.Aeson..=) "queryPayout" (getBalanceHistoryParametersQueryPayout obj) GHC.Base.<> ((Data.Aeson..=) "querySource" (getBalanceHistoryParametersQuerySource obj) GHC.Base.<> ((Data.Aeson..=) "queryStarting_after" (getBalanceHistoryParametersQueryStartingAfter obj) GHC.Base.<> (Data.Aeson..=) "queryType" (getBalanceHistoryParametersQueryType obj))))))))))

instance Data.Aeson.Types.FromJSON.FromJSON GetBalanceHistoryParameters where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "GetBalanceHistoryParameters" (\obj -> (((((((((GHC.Base.pure GetBalanceHistoryParameters GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryAvailable_on")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryCreated")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryCurrency")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryEnding_before")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryExpand")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryLimit")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryPayout")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "querySource")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryStarting_after")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryType"))

-- | Defines the data type for the schema getBalanceHistoryParametersQueryAvailable_on\'OneOf2
data GetBalanceHistoryParametersQueryAvailableOn'OneOf2
  = GetBalanceHistoryParametersQueryAvailableOn'OneOf2
      { -- | gt
        getBalanceHistoryParametersQueryAvailableOn'OneOf2Gt :: (GHC.Maybe.Maybe GHC.Types.Int),
        -- | gte
        getBalanceHistoryParametersQueryAvailableOn'OneOf2Gte :: (GHC.Maybe.Maybe GHC.Types.Int),
        -- | lt
        getBalanceHistoryParametersQueryAvailableOn'OneOf2Lt :: (GHC.Maybe.Maybe GHC.Types.Int),
        -- | lte
        getBalanceHistoryParametersQueryAvailableOn'OneOf2Lte :: (GHC.Maybe.Maybe GHC.Types.Int)
      }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.ToJSON GetBalanceHistoryParametersQueryAvailableOn'OneOf2 where
  toJSON obj = Data.Aeson.object ((Data.Aeson..=) "gt" (getBalanceHistoryParametersQueryAvailableOn'OneOf2Gt obj) : (Data.Aeson..=) "gte" (getBalanceHistoryParametersQueryAvailableOn'OneOf2Gte obj) : (Data.Aeson..=) "lt" (getBalanceHistoryParametersQueryAvailableOn'OneOf2Lt obj) : (Data.Aeson..=) "lte" (getBalanceHistoryParametersQueryAvailableOn'OneOf2Lte obj) : [])
  toEncoding obj = Data.Aeson.pairs ((Data.Aeson..=) "gt" (getBalanceHistoryParametersQueryAvailableOn'OneOf2Gt obj) GHC.Base.<> ((Data.Aeson..=) "gte" (getBalanceHistoryParametersQueryAvailableOn'OneOf2Gte obj) GHC.Base.<> ((Data.Aeson..=) "lt" (getBalanceHistoryParametersQueryAvailableOn'OneOf2Lt obj) GHC.Base.<> (Data.Aeson..=) "lte" (getBalanceHistoryParametersQueryAvailableOn'OneOf2Lte obj))))

instance Data.Aeson.Types.FromJSON.FromJSON GetBalanceHistoryParametersQueryAvailableOn'OneOf2 where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "GetBalanceHistoryParametersQueryAvailableOn'OneOf2" (\obj -> (((GHC.Base.pure GetBalanceHistoryParametersQueryAvailableOn'OneOf2 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "gt")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "gte")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "lt")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "lte"))

-- | Define the one-of schema getBalanceHistoryParametersQueryAvailable_on\'
--
-- Represents the parameter named \'available_on\'
data GetBalanceHistoryParametersQueryAvailableOn'Variants
  = GetBalanceHistoryParametersQueryAvailableOn'Int GHC.Types.Int
  | GetBalanceHistoryParametersQueryAvailableOn'GetBalanceHistoryParametersQueryAvailableOn'OneOf2 GetBalanceHistoryParametersQueryAvailableOn'OneOf2
  deriving (GHC.Show.Show, GHC.Classes.Eq, GHC.Generics.Generic)

instance Data.Aeson.ToJSON GetBalanceHistoryParametersQueryAvailableOn'Variants where
  toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions {Data.Aeson.Types.Internal.sumEncoding = Data.Aeson.Types.Internal.UntaggedValue}

instance Data.Aeson.FromJSON GetBalanceHistoryParametersQueryAvailableOn'Variants where
  parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions {Data.Aeson.Types.Internal.sumEncoding = Data.Aeson.Types.Internal.UntaggedValue}

-- | Defines the data type for the schema getBalanceHistoryParametersQueryCreated\'OneOf2
data GetBalanceHistoryParametersQueryCreated'OneOf2
  = GetBalanceHistoryParametersQueryCreated'OneOf2
      { -- | gt
        getBalanceHistoryParametersQueryCreated'OneOf2Gt :: (GHC.Maybe.Maybe GHC.Types.Int),
        -- | gte
        getBalanceHistoryParametersQueryCreated'OneOf2Gte :: (GHC.Maybe.Maybe GHC.Types.Int),
        -- | lt
        getBalanceHistoryParametersQueryCreated'OneOf2Lt :: (GHC.Maybe.Maybe GHC.Types.Int),
        -- | lte
        getBalanceHistoryParametersQueryCreated'OneOf2Lte :: (GHC.Maybe.Maybe GHC.Types.Int)
      }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.ToJSON GetBalanceHistoryParametersQueryCreated'OneOf2 where
  toJSON obj = Data.Aeson.object ((Data.Aeson..=) "gt" (getBalanceHistoryParametersQueryCreated'OneOf2Gt obj) : (Data.Aeson..=) "gte" (getBalanceHistoryParametersQueryCreated'OneOf2Gte obj) : (Data.Aeson..=) "lt" (getBalanceHistoryParametersQueryCreated'OneOf2Lt obj) : (Data.Aeson..=) "lte" (getBalanceHistoryParametersQueryCreated'OneOf2Lte obj) : [])
  toEncoding obj = Data.Aeson.pairs ((Data.Aeson..=) "gt" (getBalanceHistoryParametersQueryCreated'OneOf2Gt obj) GHC.Base.<> ((Data.Aeson..=) "gte" (getBalanceHistoryParametersQueryCreated'OneOf2Gte obj) GHC.Base.<> ((Data.Aeson..=) "lt" (getBalanceHistoryParametersQueryCreated'OneOf2Lt obj) GHC.Base.<> (Data.Aeson..=) "lte" (getBalanceHistoryParametersQueryCreated'OneOf2Lte obj))))

instance Data.Aeson.Types.FromJSON.FromJSON GetBalanceHistoryParametersQueryCreated'OneOf2 where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "GetBalanceHistoryParametersQueryCreated'OneOf2" (\obj -> (((GHC.Base.pure GetBalanceHistoryParametersQueryCreated'OneOf2 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "gt")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "gte")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "lt")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "lte"))

-- | Define the one-of schema getBalanceHistoryParametersQueryCreated\'
--
-- Represents the parameter named \'created\'
data GetBalanceHistoryParametersQueryCreated'Variants
  = GetBalanceHistoryParametersQueryCreated'Int GHC.Types.Int
  | GetBalanceHistoryParametersQueryCreated'GetBalanceHistoryParametersQueryCreated'OneOf2 GetBalanceHistoryParametersQueryCreated'OneOf2
  deriving (GHC.Show.Show, GHC.Classes.Eq, GHC.Generics.Generic)

instance Data.Aeson.ToJSON GetBalanceHistoryParametersQueryCreated'Variants where
  toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions {Data.Aeson.Types.Internal.sumEncoding = Data.Aeson.Types.Internal.UntaggedValue}

instance Data.Aeson.FromJSON GetBalanceHistoryParametersQueryCreated'Variants where
  parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions {Data.Aeson.Types.Internal.sumEncoding = Data.Aeson.Types.Internal.UntaggedValue}

-- | Represents a response of the operation 'getBalanceHistory'.
--
-- The response constructor is chosen by the status code of the response. If no case matches (no specific case for the response code, no range case, no default case), 'GetBalanceHistoryResponseError' is used.
data GetBalanceHistoryResponse
  = -- | Means either no matching case available or a parse error
    GetBalanceHistoryResponseError GHC.Base.String
  | -- | Successful response.
    GetBalanceHistoryResponse200 GetBalanceHistoryResponseBody200
  | -- | Error response.
    GetBalanceHistoryResponseDefault Error
  deriving (GHC.Show.Show, GHC.Classes.Eq)

-- | Defines the data type for the schema GetBalanceHistoryResponseBody200
data GetBalanceHistoryResponseBody200
  = GetBalanceHistoryResponseBody200
      { -- | data
        getBalanceHistoryResponseBody200Data :: ([] BalanceTransaction),
        -- | has_more: True if this list has another page of items after this one that can be fetched.
        getBalanceHistoryResponseBody200HasMore :: GHC.Types.Bool,
        -- | object: String representing the object\'s type. Objects of the same type share the same value. Always has the value \`list\`.
        getBalanceHistoryResponseBody200Object :: GetBalanceHistoryResponseBody200Object',
        -- | url: The URL where this list can be accessed.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        -- * Must match pattern \'^\/v1\/balance_transactions\'
        getBalanceHistoryResponseBody200Url :: Data.Text.Internal.Text
      }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.ToJSON GetBalanceHistoryResponseBody200 where
  toJSON obj = Data.Aeson.object ((Data.Aeson..=) "data" (getBalanceHistoryResponseBody200Data obj) : (Data.Aeson..=) "has_more" (getBalanceHistoryResponseBody200HasMore obj) : (Data.Aeson..=) "object" (getBalanceHistoryResponseBody200Object obj) : (Data.Aeson..=) "url" (getBalanceHistoryResponseBody200Url obj) : [])
  toEncoding obj = Data.Aeson.pairs ((Data.Aeson..=) "data" (getBalanceHistoryResponseBody200Data obj) GHC.Base.<> ((Data.Aeson..=) "has_more" (getBalanceHistoryResponseBody200HasMore obj) GHC.Base.<> ((Data.Aeson..=) "object" (getBalanceHistoryResponseBody200Object obj) GHC.Base.<> (Data.Aeson..=) "url" (getBalanceHistoryResponseBody200Url obj))))

instance Data.Aeson.Types.FromJSON.FromJSON GetBalanceHistoryResponseBody200 where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "GetBalanceHistoryResponseBody200" (\obj -> (((GHC.Base.pure GetBalanceHistoryResponseBody200 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "data")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "has_more")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "object")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "url"))

-- | Defines the enum schema GetBalanceHistoryResponseBody200Object\'
--
-- String representing the object\'s type. Objects of the same type share the same value. Always has the value \`list\`.
data GetBalanceHistoryResponseBody200Object'
  = GetBalanceHistoryResponseBody200Object'EnumOther Data.Aeson.Types.Internal.Value
  | GetBalanceHistoryResponseBody200Object'EnumTyped Data.Text.Internal.Text
  | GetBalanceHistoryResponseBody200Object'EnumStringList
  deriving (GHC.Show.Show, GHC.Classes.Eq)

instance Data.Aeson.ToJSON GetBalanceHistoryResponseBody200Object' where
  toJSON (GetBalanceHistoryResponseBody200Object'EnumOther patternName) = Data.Aeson.Types.ToJSON.toJSON patternName
  toJSON (GetBalanceHistoryResponseBody200Object'EnumTyped patternName) = Data.Aeson.Types.ToJSON.toJSON patternName
  toJSON (GetBalanceHistoryResponseBody200Object'EnumStringList) = Data.Aeson.Types.Internal.String GHC.Base.$ Data.Text.pack "list"

instance Data.Aeson.FromJSON GetBalanceHistoryResponseBody200Object' where
  parseJSON val =
    GHC.Base.pure
      ( if val GHC.Classes.== (Data.Aeson.Types.Internal.String GHC.Base.$ Data.Text.pack "list")
          then GetBalanceHistoryResponseBody200Object'EnumStringList
          else GetBalanceHistoryResponseBody200Object'EnumOther val
      )

-- | > GET /v1/balance/history
--
-- The same as 'getBalanceHistory' but accepts an explicit configuration.
getBalanceHistoryWithConfiguration ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | The configuration to use in the request
  StripeAPI.Common.Configuration ->
  -- | Contains all available parameters of this operation (query and path parameters)
  GetBalanceHistoryParameters ->
  -- | Monadic computation which returns the result of the operation
  m (Network.HTTP.Client.Types.Response GetBalanceHistoryResponse)
getBalanceHistoryWithConfiguration
  config
  parameters =
    GHC.Base.fmap
      ( \response_2 ->
          GHC.Base.fmap
            ( Data.Either.either GetBalanceHistoryResponseError GHC.Base.id
                GHC.Base.. ( \response body ->
                               if  | (\status_3 -> Network.HTTP.Types.Status.statusCode status_3 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) ->
                                     GetBalanceHistoryResponse200
                                       Data.Functor.<$> ( Data.Aeson.eitherDecodeStrict body ::
                                                            Data.Either.Either GHC.Base.String
                                                              GetBalanceHistoryResponseBody200
                                                        )
                                   | GHC.Base.const GHC.Types.True (Network.HTTP.Client.Types.responseStatus response) ->
                                     GetBalanceHistoryResponseDefault
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
          (Data.Text.pack "/v1/balance/history")
          [ StripeAPI.Common.QueryParameter (Data.Text.pack "available_on") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryAvailableOn parameters) (Data.Text.pack "deepObject") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "created") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryCreated parameters) (Data.Text.pack "deepObject") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "currency") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryCurrency parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "ending_before") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryEndingBefore parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "limit") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryLimit parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "payout") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryPayout parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "source") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQuerySource parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "starting_after") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryStartingAfter parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "type") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryType parameters) (Data.Text.pack "form") GHC.Types.True
          ]
      )

-- | > GET /v1/balance/history
--
-- The same as 'getBalanceHistory' but returns the raw 'Data.ByteString.Char8.ByteString'.
getBalanceHistoryRaw ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | Contains all available parameters of this operation (query and path parameters)
  GetBalanceHistoryParameters ->
  -- | Monadic computation which returns the result of the operation
  StripeAPI.Common.StripeT m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.ByteString)
getBalanceHistoryRaw parameters =
  GHC.Base.id
    ( StripeAPI.Common.doCallWithConfigurationM
        (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET")
        (Data.Text.pack "/v1/balance/history")
        [ StripeAPI.Common.QueryParameter (Data.Text.pack "available_on") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryAvailableOn parameters) (Data.Text.pack "deepObject") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "created") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryCreated parameters) (Data.Text.pack "deepObject") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "currency") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryCurrency parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "ending_before") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryEndingBefore parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "limit") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryLimit parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "payout") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryPayout parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "source") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQuerySource parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "starting_after") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryStartingAfter parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "type") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryType parameters) (Data.Text.pack "form") GHC.Types.True
        ]
    )

-- | > GET /v1/balance/history
--
-- The same as 'getBalanceHistory' but accepts an explicit configuration and returns the raw 'Data.ByteString.Char8.ByteString'.
getBalanceHistoryWithConfigurationRaw ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | The configuration to use in the request
  StripeAPI.Common.Configuration ->
  -- | Contains all available parameters of this operation (query and path parameters)
  GetBalanceHistoryParameters ->
  -- | Monadic computation which returns the result of the operation
  m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.ByteString)
getBalanceHistoryWithConfigurationRaw
  config
  parameters =
    GHC.Base.id
      ( StripeAPI.Common.doCallWithConfiguration
          config
          (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET")
          (Data.Text.pack "/v1/balance/history")
          [ StripeAPI.Common.QueryParameter (Data.Text.pack "available_on") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryAvailableOn parameters) (Data.Text.pack "deepObject") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "created") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryCreated parameters) (Data.Text.pack "deepObject") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "currency") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryCurrency parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "ending_before") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryEndingBefore parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "limit") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryLimit parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "payout") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryPayout parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "source") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQuerySource parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "starting_after") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryStartingAfter parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "type") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceHistoryParametersQueryType parameters) (Data.Text.pack "form") GHC.Types.True
          ]
      )
