{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE MultiWayIf #-}
-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.
{-# LANGUAGE OverloadedStrings #-}

-- | Contains the different functions to run the operation getBalanceTransactions
module StripeAPI.Operations.GetBalanceTransactions where

import qualified Control.Monad.Fail
import qualified Control.Monad.Trans.Reader
import qualified Data.Aeson
import qualified Data.Aeson as Data.Aeson.Encoding.Internal
import qualified Data.Aeson as Data.Aeson.Types
import qualified Data.Aeson as Data.Aeson.Types.FromJSON
import qualified Data.Aeson as Data.Aeson.Types.Internal
import qualified Data.Aeson as Data.Aeson.Types.ToJSON
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

-- | > GET /v1/balance_transactions
--
-- \<p>Returns a list of transactions that have contributed to the Stripe account balance (e.g., charges, transfers, and so forth). The transactions are returned in sorted order, with the most recent transactions appearing first.\<\/p>
--
-- \<p>Note that this endpoint was previously called “Balance history” and used the path \<code>\/v1\/balance\/history\<\/code>.\<\/p>
getBalanceTransactions ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | Contains all available parameters of this operation (query and path parameters)
  GetBalanceTransactionsParameters ->
  -- | Monadic computation which returns the result of the operation
  StripeAPI.Common.ClientT m (Network.HTTP.Client.Types.Response GetBalanceTransactionsResponse)
getBalanceTransactions parameters =
  GHC.Base.fmap
    ( \response_0 ->
        GHC.Base.fmap
          ( Data.Either.either GetBalanceTransactionsResponseError GHC.Base.id
              GHC.Base.. ( \response body ->
                             if
                                 | (\status_1 -> Network.HTTP.Types.Status.statusCode status_1 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) ->
                                   GetBalanceTransactionsResponse200
                                     Data.Functor.<$> ( Data.Aeson.eitherDecodeStrict body ::
                                                          Data.Either.Either
                                                            GHC.Base.String
                                                            GetBalanceTransactionsResponseBody200
                                                      )
                                 | GHC.Base.const GHC.Types.True (Network.HTTP.Client.Types.responseStatus response) ->
                                   GetBalanceTransactionsResponseDefault
                                     Data.Functor.<$> ( Data.Aeson.eitherDecodeStrict body ::
                                                          Data.Either.Either
                                                            GHC.Base.String
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
        (Data.Text.pack "/v1/balance_transactions")
        [ StripeAPI.Common.QueryParameter (Data.Text.pack "created") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceTransactionsParametersQueryCreated parameters) (Data.Text.pack "deepObject") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "currency") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceTransactionsParametersQueryCurrency parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "ending_before") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceTransactionsParametersQueryEndingBefore parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceTransactionsParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "limit") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceTransactionsParametersQueryLimit parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "payout") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceTransactionsParametersQueryPayout parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "source") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceTransactionsParametersQuerySource parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "starting_after") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceTransactionsParametersQueryStartingAfter parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "type") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBalanceTransactionsParametersQueryType parameters) (Data.Text.pack "form") GHC.Types.True
        ]
    )

-- | Defines the object schema located at @paths.\/v1\/balance_transactions.GET.parameters@ in the specification.
data GetBalanceTransactionsParameters = GetBalanceTransactionsParameters
  { -- | queryCreated: Represents the parameter named \'created\'
    getBalanceTransactionsParametersQueryCreated :: (GHC.Maybe.Maybe GetBalanceTransactionsParametersQueryCreated'Variants),
    -- | queryCurrency: Represents the parameter named \'currency\'
    --
    -- Only return transactions in a certain currency. Three-letter [ISO currency code](https:\/\/www.iso.org\/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https:\/\/stripe.com\/docs\/currencies).
    getBalanceTransactionsParametersQueryCurrency :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
    -- | queryEnding_before: Represents the parameter named \'ending_before\'
    --
    -- A cursor for use in pagination. \`ending_before\` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with \`obj_bar\`, your subsequent call can include \`ending_before=obj_bar\` in order to fetch the previous page of the list.
    --
    -- Constraints:
    --
    -- * Maximum length of 5000
    getBalanceTransactionsParametersQueryEndingBefore :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
    -- | queryExpand: Represents the parameter named \'expand\'
    --
    -- Specifies which fields in the response should be expanded.
    getBalanceTransactionsParametersQueryExpand :: (GHC.Maybe.Maybe ([Data.Text.Internal.Text])),
    -- | queryLimit: Represents the parameter named \'limit\'
    --
    -- A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
    getBalanceTransactionsParametersQueryLimit :: (GHC.Maybe.Maybe GHC.Types.Int),
    -- | queryPayout: Represents the parameter named \'payout\'
    --
    -- For automatic Stripe payouts only, only returns transactions that were paid out on the specified payout ID.
    --
    -- Constraints:
    --
    -- * Maximum length of 5000
    getBalanceTransactionsParametersQueryPayout :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
    -- | querySource: Represents the parameter named \'source\'
    --
    -- Only returns the original transaction.
    --
    -- Constraints:
    --
    -- * Maximum length of 5000
    getBalanceTransactionsParametersQuerySource :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
    -- | queryStarting_after: Represents the parameter named \'starting_after\'
    --
    -- A cursor for use in pagination. \`starting_after\` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with \`obj_foo\`, your subsequent call can include \`starting_after=obj_foo\` in order to fetch the next page of the list.
    --
    -- Constraints:
    --
    -- * Maximum length of 5000
    getBalanceTransactionsParametersQueryStartingAfter :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
    -- | queryType: Represents the parameter named \'type\'
    --
    -- Only returns transactions of the given type. One of: \`adjustment\`, \`advance\`, \`advance_funding\`, \`anticipation_repayment\`, \`application_fee\`, \`application_fee_refund\`, \`charge\`, \`connect_collection_transfer\`, \`contribution\`, \`issuing_authorization_hold\`, \`issuing_authorization_release\`, \`issuing_dispute\`, \`issuing_transaction\`, \`payment\`, \`payment_failure_refund\`, \`payment_refund\`, \`payout\`, \`payout_cancel\`, \`payout_failure\`, \`refund\`, \`refund_failure\`, \`reserve_transaction\`, \`reserved_funds\`, \`stripe_fee\`, \`stripe_fx_fee\`, \`tax_fee\`, \`topup\`, \`topup_reversal\`, \`transfer\`, \`transfer_cancel\`, \`transfer_failure\`, or \`transfer_refund\`.
    --
    -- Constraints:
    --
    -- * Maximum length of 5000
    getBalanceTransactionsParametersQueryType :: (GHC.Maybe.Maybe Data.Text.Internal.Text)
  }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.Types.ToJSON.ToJSON GetBalanceTransactionsParameters where
  toJSON obj = Data.Aeson.Types.Internal.object ("queryCreated" Data.Aeson.Types.ToJSON..= getBalanceTransactionsParametersQueryCreated obj : "queryCurrency" Data.Aeson.Types.ToJSON..= getBalanceTransactionsParametersQueryCurrency obj : "queryEnding_before" Data.Aeson.Types.ToJSON..= getBalanceTransactionsParametersQueryEndingBefore obj : "queryExpand" Data.Aeson.Types.ToJSON..= getBalanceTransactionsParametersQueryExpand obj : "queryLimit" Data.Aeson.Types.ToJSON..= getBalanceTransactionsParametersQueryLimit obj : "queryPayout" Data.Aeson.Types.ToJSON..= getBalanceTransactionsParametersQueryPayout obj : "querySource" Data.Aeson.Types.ToJSON..= getBalanceTransactionsParametersQuerySource obj : "queryStarting_after" Data.Aeson.Types.ToJSON..= getBalanceTransactionsParametersQueryStartingAfter obj : "queryType" Data.Aeson.Types.ToJSON..= getBalanceTransactionsParametersQueryType obj : GHC.Base.mempty)
  toEncoding obj = Data.Aeson.Encoding.Internal.pairs (("queryCreated" Data.Aeson.Types.ToJSON..= getBalanceTransactionsParametersQueryCreated obj) GHC.Base.<> (("queryCurrency" Data.Aeson.Types.ToJSON..= getBalanceTransactionsParametersQueryCurrency obj) GHC.Base.<> (("queryEnding_before" Data.Aeson.Types.ToJSON..= getBalanceTransactionsParametersQueryEndingBefore obj) GHC.Base.<> (("queryExpand" Data.Aeson.Types.ToJSON..= getBalanceTransactionsParametersQueryExpand obj) GHC.Base.<> (("queryLimit" Data.Aeson.Types.ToJSON..= getBalanceTransactionsParametersQueryLimit obj) GHC.Base.<> (("queryPayout" Data.Aeson.Types.ToJSON..= getBalanceTransactionsParametersQueryPayout obj) GHC.Base.<> (("querySource" Data.Aeson.Types.ToJSON..= getBalanceTransactionsParametersQuerySource obj) GHC.Base.<> (("queryStarting_after" Data.Aeson.Types.ToJSON..= getBalanceTransactionsParametersQueryStartingAfter obj) GHC.Base.<> ("queryType" Data.Aeson.Types.ToJSON..= getBalanceTransactionsParametersQueryType obj)))))))))

instance Data.Aeson.Types.FromJSON.FromJSON GetBalanceTransactionsParameters where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "GetBalanceTransactionsParameters" (\obj -> ((((((((GHC.Base.pure GetBalanceTransactionsParameters GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryCreated")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryCurrency")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryEnding_before")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryExpand")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryLimit")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryPayout")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "querySource")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryStarting_after")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryType"))

-- | Create a new 'GetBalanceTransactionsParameters' with all required fields.
mkGetBalanceTransactionsParameters :: GetBalanceTransactionsParameters
mkGetBalanceTransactionsParameters =
  GetBalanceTransactionsParameters
    { getBalanceTransactionsParametersQueryCreated = GHC.Maybe.Nothing,
      getBalanceTransactionsParametersQueryCurrency = GHC.Maybe.Nothing,
      getBalanceTransactionsParametersQueryEndingBefore = GHC.Maybe.Nothing,
      getBalanceTransactionsParametersQueryExpand = GHC.Maybe.Nothing,
      getBalanceTransactionsParametersQueryLimit = GHC.Maybe.Nothing,
      getBalanceTransactionsParametersQueryPayout = GHC.Maybe.Nothing,
      getBalanceTransactionsParametersQuerySource = GHC.Maybe.Nothing,
      getBalanceTransactionsParametersQueryStartingAfter = GHC.Maybe.Nothing,
      getBalanceTransactionsParametersQueryType = GHC.Maybe.Nothing
    }

-- | Defines the object schema located at @paths.\/v1\/balance_transactions.GET.parameters.properties.queryCreated.anyOf@ in the specification.
data GetBalanceTransactionsParametersQueryCreated'OneOf1 = GetBalanceTransactionsParametersQueryCreated'OneOf1
  { -- | gt
    getBalanceTransactionsParametersQueryCreated'OneOf1Gt :: (GHC.Maybe.Maybe GHC.Types.Int),
    -- | gte
    getBalanceTransactionsParametersQueryCreated'OneOf1Gte :: (GHC.Maybe.Maybe GHC.Types.Int),
    -- | lt
    getBalanceTransactionsParametersQueryCreated'OneOf1Lt :: (GHC.Maybe.Maybe GHC.Types.Int),
    -- | lte
    getBalanceTransactionsParametersQueryCreated'OneOf1Lte :: (GHC.Maybe.Maybe GHC.Types.Int)
  }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.Types.ToJSON.ToJSON GetBalanceTransactionsParametersQueryCreated'OneOf1 where
  toJSON obj = Data.Aeson.Types.Internal.object ("gt" Data.Aeson.Types.ToJSON..= getBalanceTransactionsParametersQueryCreated'OneOf1Gt obj : "gte" Data.Aeson.Types.ToJSON..= getBalanceTransactionsParametersQueryCreated'OneOf1Gte obj : "lt" Data.Aeson.Types.ToJSON..= getBalanceTransactionsParametersQueryCreated'OneOf1Lt obj : "lte" Data.Aeson.Types.ToJSON..= getBalanceTransactionsParametersQueryCreated'OneOf1Lte obj : GHC.Base.mempty)
  toEncoding obj = Data.Aeson.Encoding.Internal.pairs (("gt" Data.Aeson.Types.ToJSON..= getBalanceTransactionsParametersQueryCreated'OneOf1Gt obj) GHC.Base.<> (("gte" Data.Aeson.Types.ToJSON..= getBalanceTransactionsParametersQueryCreated'OneOf1Gte obj) GHC.Base.<> (("lt" Data.Aeson.Types.ToJSON..= getBalanceTransactionsParametersQueryCreated'OneOf1Lt obj) GHC.Base.<> ("lte" Data.Aeson.Types.ToJSON..= getBalanceTransactionsParametersQueryCreated'OneOf1Lte obj))))

instance Data.Aeson.Types.FromJSON.FromJSON GetBalanceTransactionsParametersQueryCreated'OneOf1 where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "GetBalanceTransactionsParametersQueryCreated'OneOf1" (\obj -> (((GHC.Base.pure GetBalanceTransactionsParametersQueryCreated'OneOf1 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "gt")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "gte")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "lt")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "lte"))

-- | Create a new 'GetBalanceTransactionsParametersQueryCreated'OneOf1' with all required fields.
mkGetBalanceTransactionsParametersQueryCreated'OneOf1 :: GetBalanceTransactionsParametersQueryCreated'OneOf1
mkGetBalanceTransactionsParametersQueryCreated'OneOf1 =
  GetBalanceTransactionsParametersQueryCreated'OneOf1
    { getBalanceTransactionsParametersQueryCreated'OneOf1Gt = GHC.Maybe.Nothing,
      getBalanceTransactionsParametersQueryCreated'OneOf1Gte = GHC.Maybe.Nothing,
      getBalanceTransactionsParametersQueryCreated'OneOf1Lt = GHC.Maybe.Nothing,
      getBalanceTransactionsParametersQueryCreated'OneOf1Lte = GHC.Maybe.Nothing
    }

-- | Defines the oneOf schema located at @paths.\/v1\/balance_transactions.GET.parameters.properties.queryCreated.anyOf@ in the specification.
--
-- Represents the parameter named \'created\'
data GetBalanceTransactionsParametersQueryCreated'Variants
  = GetBalanceTransactionsParametersQueryCreated'GetBalanceTransactionsParametersQueryCreated'OneOf1 GetBalanceTransactionsParametersQueryCreated'OneOf1
  | GetBalanceTransactionsParametersQueryCreated'Int GHC.Types.Int
  deriving (GHC.Show.Show, GHC.Classes.Eq)

instance Data.Aeson.Types.ToJSON.ToJSON GetBalanceTransactionsParametersQueryCreated'Variants where
  toJSON (GetBalanceTransactionsParametersQueryCreated'GetBalanceTransactionsParametersQueryCreated'OneOf1 a) = Data.Aeson.Types.ToJSON.toJSON a
  toJSON (GetBalanceTransactionsParametersQueryCreated'Int a) = Data.Aeson.Types.ToJSON.toJSON a

instance Data.Aeson.Types.FromJSON.FromJSON GetBalanceTransactionsParametersQueryCreated'Variants where
  parseJSON val = case (GetBalanceTransactionsParametersQueryCreated'GetBalanceTransactionsParametersQueryCreated'OneOf1 Data.Functor.<$> Data.Aeson.Types.FromJSON.fromJSON val) GHC.Base.<|> ((GetBalanceTransactionsParametersQueryCreated'Int Data.Functor.<$> Data.Aeson.Types.FromJSON.fromJSON val) GHC.Base.<|> Data.Aeson.Types.Internal.Error "No variant matched") of
    Data.Aeson.Types.Internal.Success a -> GHC.Base.pure a
    Data.Aeson.Types.Internal.Error a -> Control.Monad.Fail.fail a

-- | Represents a response of the operation 'getBalanceTransactions'.
--
-- The response constructor is chosen by the status code of the response. If no case matches (no specific case for the response code, no range case, no default case), 'GetBalanceTransactionsResponseError' is used.
data GetBalanceTransactionsResponse
  = -- | Means either no matching case available or a parse error
    GetBalanceTransactionsResponseError GHC.Base.String
  | -- | Successful response.
    GetBalanceTransactionsResponse200 GetBalanceTransactionsResponseBody200
  | -- | Error response.
    GetBalanceTransactionsResponseDefault Error
  deriving (GHC.Show.Show, GHC.Classes.Eq)

-- | Defines the object schema located at @paths.\/v1\/balance_transactions.GET.responses.200.content.application\/json.schema@ in the specification.
data GetBalanceTransactionsResponseBody200 = GetBalanceTransactionsResponseBody200
  { -- | data
    getBalanceTransactionsResponseBody200Data :: ([BalanceTransaction]),
    -- | has_more: True if this list has another page of items after this one that can be fetched.
    getBalanceTransactionsResponseBody200HasMore :: GHC.Types.Bool,
    -- | url: The URL where this list can be accessed.
    --
    -- Constraints:
    --
    -- * Maximum length of 5000
    -- * Must match pattern \'^\/v1\/balance_transactions\'
    getBalanceTransactionsResponseBody200Url :: Data.Text.Internal.Text
  }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.Types.ToJSON.ToJSON GetBalanceTransactionsResponseBody200 where
  toJSON obj = Data.Aeson.Types.Internal.object ("data" Data.Aeson.Types.ToJSON..= getBalanceTransactionsResponseBody200Data obj : "has_more" Data.Aeson.Types.ToJSON..= getBalanceTransactionsResponseBody200HasMore obj : "url" Data.Aeson.Types.ToJSON..= getBalanceTransactionsResponseBody200Url obj : "object" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "list" : GHC.Base.mempty)
  toEncoding obj = Data.Aeson.Encoding.Internal.pairs (("data" Data.Aeson.Types.ToJSON..= getBalanceTransactionsResponseBody200Data obj) GHC.Base.<> (("has_more" Data.Aeson.Types.ToJSON..= getBalanceTransactionsResponseBody200HasMore obj) GHC.Base.<> (("url" Data.Aeson.Types.ToJSON..= getBalanceTransactionsResponseBody200Url obj) GHC.Base.<> ("object" Data.Aeson.Types.ToJSON..= Data.Aeson.Types.Internal.String "list"))))

instance Data.Aeson.Types.FromJSON.FromJSON GetBalanceTransactionsResponseBody200 where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "GetBalanceTransactionsResponseBody200" (\obj -> ((GHC.Base.pure GetBalanceTransactionsResponseBody200 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "data")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "has_more")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "url"))

-- | Create a new 'GetBalanceTransactionsResponseBody200' with all required fields.
mkGetBalanceTransactionsResponseBody200 ::
  -- | 'getBalanceTransactionsResponseBody200Data'
  [BalanceTransaction] ->
  -- | 'getBalanceTransactionsResponseBody200HasMore'
  GHC.Types.Bool ->
  -- | 'getBalanceTransactionsResponseBody200Url'
  Data.Text.Internal.Text ->
  GetBalanceTransactionsResponseBody200
mkGetBalanceTransactionsResponseBody200 getBalanceTransactionsResponseBody200Data getBalanceTransactionsResponseBody200HasMore getBalanceTransactionsResponseBody200Url =
  GetBalanceTransactionsResponseBody200
    { getBalanceTransactionsResponseBody200Data = getBalanceTransactionsResponseBody200Data,
      getBalanceTransactionsResponseBody200HasMore = getBalanceTransactionsResponseBody200HasMore,
      getBalanceTransactionsResponseBody200Url = getBalanceTransactionsResponseBody200Url
    }
