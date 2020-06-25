{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE OverloadedStrings #-}

-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.

-- | Contains the different functions to run the operation getBitcoinTransactions
module StripeAPI.Operations.GetBitcoinTransactions where

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

-- | > GET /v1/bitcoin/transactions
--
-- \<p>List bitcoin transacitons for a given receiver.\<\/p>
getBitcoinTransactions ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | Contains all available parameters of this operation (query and path parameters)
  GetBitcoinTransactionsParameters ->
  -- | Monadic computation which returns the result of the operation
  StripeAPI.Common.StripeT m (Network.HTTP.Client.Types.Response GetBitcoinTransactionsResponse)
getBitcoinTransactions parameters =
  GHC.Base.fmap
    ( \response_0 ->
        GHC.Base.fmap
          ( Data.Either.either GetBitcoinTransactionsResponseError GHC.Base.id
              GHC.Base.. ( \response body ->
                             if  | (\status_1 -> Network.HTTP.Types.Status.statusCode status_1 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) ->
                                   GetBitcoinTransactionsResponse200
                                     Data.Functor.<$> ( Data.Aeson.eitherDecodeStrict body ::
                                                          Data.Either.Either GHC.Base.String
                                                            GetBitcoinTransactionsResponseBody200
                                                      )
                                 | GHC.Base.const GHC.Types.True (Network.HTTP.Client.Types.responseStatus response) ->
                                   GetBitcoinTransactionsResponseDefault
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
        (Data.Text.pack "/v1/bitcoin/transactions")
        [ StripeAPI.Common.QueryParameter (Data.Text.pack "customer") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBitcoinTransactionsParametersQueryCustomer parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "ending_before") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBitcoinTransactionsParametersQueryEndingBefore parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBitcoinTransactionsParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "limit") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBitcoinTransactionsParametersQueryLimit parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "receiver") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBitcoinTransactionsParametersQueryReceiver parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "starting_after") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBitcoinTransactionsParametersQueryStartingAfter parameters) (Data.Text.pack "form") GHC.Types.True
        ]
    )

-- | Defines the data type for the schema getBitcoinTransactionsParameters
data GetBitcoinTransactionsParameters
  = GetBitcoinTransactionsParameters
      { -- | queryCustomer: Represents the parameter named \'customer\'
        --
        -- Only return transactions for the customer specified by this customer ID.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        getBitcoinTransactionsParametersQueryCustomer :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
        -- | queryEnding_before: Represents the parameter named \'ending_before\'
        --
        -- A cursor for use in pagination. \`ending_before\` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with \`obj_bar\`, your subsequent call can include \`ending_before=obj_bar\` in order to fetch the previous page of the list.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        getBitcoinTransactionsParametersQueryEndingBefore :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
        -- | queryExpand: Represents the parameter named \'expand\'
        --
        -- Specifies which fields in the response should be expanded.
        getBitcoinTransactionsParametersQueryExpand :: (GHC.Maybe.Maybe ([] Data.Text.Internal.Text)),
        -- | queryLimit: Represents the parameter named \'limit\'
        --
        -- A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
        getBitcoinTransactionsParametersQueryLimit :: (GHC.Maybe.Maybe GHC.Types.Int),
        -- | queryReceiver: Represents the parameter named \'receiver\'
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        getBitcoinTransactionsParametersQueryReceiver :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
        -- | queryStarting_after: Represents the parameter named \'starting_after\'
        --
        -- A cursor for use in pagination. \`starting_after\` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with \`obj_foo\`, your subsequent call can include \`starting_after=obj_foo\` in order to fetch the next page of the list.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        getBitcoinTransactionsParametersQueryStartingAfter :: (GHC.Maybe.Maybe Data.Text.Internal.Text)
      }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.ToJSON GetBitcoinTransactionsParameters where
  toJSON obj = Data.Aeson.object ((Data.Aeson..=) "queryCustomer" (getBitcoinTransactionsParametersQueryCustomer obj) : (Data.Aeson..=) "queryEnding_before" (getBitcoinTransactionsParametersQueryEndingBefore obj) : (Data.Aeson..=) "queryExpand" (getBitcoinTransactionsParametersQueryExpand obj) : (Data.Aeson..=) "queryLimit" (getBitcoinTransactionsParametersQueryLimit obj) : (Data.Aeson..=) "queryReceiver" (getBitcoinTransactionsParametersQueryReceiver obj) : (Data.Aeson..=) "queryStarting_after" (getBitcoinTransactionsParametersQueryStartingAfter obj) : [])
  toEncoding obj = Data.Aeson.pairs ((Data.Aeson..=) "queryCustomer" (getBitcoinTransactionsParametersQueryCustomer obj) GHC.Base.<> ((Data.Aeson..=) "queryEnding_before" (getBitcoinTransactionsParametersQueryEndingBefore obj) GHC.Base.<> ((Data.Aeson..=) "queryExpand" (getBitcoinTransactionsParametersQueryExpand obj) GHC.Base.<> ((Data.Aeson..=) "queryLimit" (getBitcoinTransactionsParametersQueryLimit obj) GHC.Base.<> ((Data.Aeson..=) "queryReceiver" (getBitcoinTransactionsParametersQueryReceiver obj) GHC.Base.<> (Data.Aeson..=) "queryStarting_after" (getBitcoinTransactionsParametersQueryStartingAfter obj))))))

instance Data.Aeson.Types.FromJSON.FromJSON GetBitcoinTransactionsParameters where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "GetBitcoinTransactionsParameters" (\obj -> (((((GHC.Base.pure GetBitcoinTransactionsParameters GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryCustomer")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryEnding_before")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryExpand")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryLimit")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryReceiver")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryStarting_after"))

-- | Represents a response of the operation 'getBitcoinTransactions'.
--
-- The response constructor is chosen by the status code of the response. If no case matches (no specific case for the response code, no range case, no default case), 'GetBitcoinTransactionsResponseError' is used.
data GetBitcoinTransactionsResponse
  = -- | Means either no matching case available or a parse error
    GetBitcoinTransactionsResponseError GHC.Base.String
  | -- | Successful response.
    GetBitcoinTransactionsResponse200 GetBitcoinTransactionsResponseBody200
  | -- | Error response.
    GetBitcoinTransactionsResponseDefault Error
  deriving (GHC.Show.Show, GHC.Classes.Eq)

-- | Defines the data type for the schema GetBitcoinTransactionsResponseBody200
data GetBitcoinTransactionsResponseBody200
  = GetBitcoinTransactionsResponseBody200
      { -- | data: Details about each object.
        getBitcoinTransactionsResponseBody200Data :: ([] BitcoinTransaction),
        -- | has_more: True if this list has another page of items after this one that can be fetched.
        getBitcoinTransactionsResponseBody200HasMore :: GHC.Types.Bool,
        -- | object: String representing the object\'s type. Objects of the same type share the same value. Always has the value \`list\`.
        getBitcoinTransactionsResponseBody200Object :: GetBitcoinTransactionsResponseBody200Object',
        -- | url: The URL where this list can be accessed.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        getBitcoinTransactionsResponseBody200Url :: Data.Text.Internal.Text
      }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.ToJSON GetBitcoinTransactionsResponseBody200 where
  toJSON obj = Data.Aeson.object ((Data.Aeson..=) "data" (getBitcoinTransactionsResponseBody200Data obj) : (Data.Aeson..=) "has_more" (getBitcoinTransactionsResponseBody200HasMore obj) : (Data.Aeson..=) "object" (getBitcoinTransactionsResponseBody200Object obj) : (Data.Aeson..=) "url" (getBitcoinTransactionsResponseBody200Url obj) : [])
  toEncoding obj = Data.Aeson.pairs ((Data.Aeson..=) "data" (getBitcoinTransactionsResponseBody200Data obj) GHC.Base.<> ((Data.Aeson..=) "has_more" (getBitcoinTransactionsResponseBody200HasMore obj) GHC.Base.<> ((Data.Aeson..=) "object" (getBitcoinTransactionsResponseBody200Object obj) GHC.Base.<> (Data.Aeson..=) "url" (getBitcoinTransactionsResponseBody200Url obj))))

instance Data.Aeson.Types.FromJSON.FromJSON GetBitcoinTransactionsResponseBody200 where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "GetBitcoinTransactionsResponseBody200" (\obj -> (((GHC.Base.pure GetBitcoinTransactionsResponseBody200 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "data")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "has_more")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "object")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "url"))

-- | Defines the enum schema GetBitcoinTransactionsResponseBody200Object\'
--
-- String representing the object\'s type. Objects of the same type share the same value. Always has the value \`list\`.
data GetBitcoinTransactionsResponseBody200Object'
  = GetBitcoinTransactionsResponseBody200Object'EnumOther Data.Aeson.Types.Internal.Value
  | GetBitcoinTransactionsResponseBody200Object'EnumTyped Data.Text.Internal.Text
  | GetBitcoinTransactionsResponseBody200Object'EnumStringList
  deriving (GHC.Show.Show, GHC.Classes.Eq)

instance Data.Aeson.ToJSON GetBitcoinTransactionsResponseBody200Object' where
  toJSON (GetBitcoinTransactionsResponseBody200Object'EnumOther patternName) = Data.Aeson.Types.ToJSON.toJSON patternName
  toJSON (GetBitcoinTransactionsResponseBody200Object'EnumTyped patternName) = Data.Aeson.Types.ToJSON.toJSON patternName
  toJSON (GetBitcoinTransactionsResponseBody200Object'EnumStringList) = Data.Aeson.Types.Internal.String GHC.Base.$ Data.Text.pack "list"

instance Data.Aeson.FromJSON GetBitcoinTransactionsResponseBody200Object' where
  parseJSON val =
    GHC.Base.pure
      ( if val GHC.Classes.== (Data.Aeson.Types.Internal.String GHC.Base.$ Data.Text.pack "list")
          then GetBitcoinTransactionsResponseBody200Object'EnumStringList
          else GetBitcoinTransactionsResponseBody200Object'EnumOther val
      )

-- | > GET /v1/bitcoin/transactions
--
-- The same as 'getBitcoinTransactions' but accepts an explicit configuration.
getBitcoinTransactionsWithConfiguration ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | The configuration to use in the request
  StripeAPI.Common.Configuration ->
  -- | Contains all available parameters of this operation (query and path parameters)
  GetBitcoinTransactionsParameters ->
  -- | Monadic computation which returns the result of the operation
  m (Network.HTTP.Client.Types.Response GetBitcoinTransactionsResponse)
getBitcoinTransactionsWithConfiguration
  config
  parameters =
    GHC.Base.fmap
      ( \response_2 ->
          GHC.Base.fmap
            ( Data.Either.either GetBitcoinTransactionsResponseError GHC.Base.id
                GHC.Base.. ( \response body ->
                               if  | (\status_3 -> Network.HTTP.Types.Status.statusCode status_3 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) ->
                                     GetBitcoinTransactionsResponse200
                                       Data.Functor.<$> ( Data.Aeson.eitherDecodeStrict body ::
                                                            Data.Either.Either GHC.Base.String
                                                              GetBitcoinTransactionsResponseBody200
                                                        )
                                   | GHC.Base.const GHC.Types.True (Network.HTTP.Client.Types.responseStatus response) ->
                                     GetBitcoinTransactionsResponseDefault
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
          (Data.Text.pack "/v1/bitcoin/transactions")
          [ StripeAPI.Common.QueryParameter (Data.Text.pack "customer") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBitcoinTransactionsParametersQueryCustomer parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "ending_before") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBitcoinTransactionsParametersQueryEndingBefore parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBitcoinTransactionsParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "limit") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBitcoinTransactionsParametersQueryLimit parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "receiver") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBitcoinTransactionsParametersQueryReceiver parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "starting_after") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBitcoinTransactionsParametersQueryStartingAfter parameters) (Data.Text.pack "form") GHC.Types.True
          ]
      )

-- | > GET /v1/bitcoin/transactions
--
-- The same as 'getBitcoinTransactions' but returns the raw 'Data.ByteString.Char8.ByteString'.
getBitcoinTransactionsRaw ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | Contains all available parameters of this operation (query and path parameters)
  GetBitcoinTransactionsParameters ->
  -- | Monadic computation which returns the result of the operation
  StripeAPI.Common.StripeT m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.ByteString)
getBitcoinTransactionsRaw parameters =
  GHC.Base.id
    ( StripeAPI.Common.doCallWithConfigurationM
        (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET")
        (Data.Text.pack "/v1/bitcoin/transactions")
        [ StripeAPI.Common.QueryParameter (Data.Text.pack "customer") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBitcoinTransactionsParametersQueryCustomer parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "ending_before") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBitcoinTransactionsParametersQueryEndingBefore parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBitcoinTransactionsParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "limit") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBitcoinTransactionsParametersQueryLimit parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "receiver") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBitcoinTransactionsParametersQueryReceiver parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "starting_after") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBitcoinTransactionsParametersQueryStartingAfter parameters) (Data.Text.pack "form") GHC.Types.True
        ]
    )

-- | > GET /v1/bitcoin/transactions
--
-- The same as 'getBitcoinTransactions' but accepts an explicit configuration and returns the raw 'Data.ByteString.Char8.ByteString'.
getBitcoinTransactionsWithConfigurationRaw ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | The configuration to use in the request
  StripeAPI.Common.Configuration ->
  -- | Contains all available parameters of this operation (query and path parameters)
  GetBitcoinTransactionsParameters ->
  -- | Monadic computation which returns the result of the operation
  m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.ByteString)
getBitcoinTransactionsWithConfigurationRaw
  config
  parameters =
    GHC.Base.id
      ( StripeAPI.Common.doCallWithConfiguration
          config
          (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET")
          (Data.Text.pack "/v1/bitcoin/transactions")
          [ StripeAPI.Common.QueryParameter (Data.Text.pack "customer") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBitcoinTransactionsParametersQueryCustomer parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "ending_before") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBitcoinTransactionsParametersQueryEndingBefore parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBitcoinTransactionsParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "limit") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBitcoinTransactionsParametersQueryLimit parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "receiver") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBitcoinTransactionsParametersQueryReceiver parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "starting_after") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getBitcoinTransactionsParametersQueryStartingAfter parameters) (Data.Text.pack "form") GHC.Types.True
          ]
      )
