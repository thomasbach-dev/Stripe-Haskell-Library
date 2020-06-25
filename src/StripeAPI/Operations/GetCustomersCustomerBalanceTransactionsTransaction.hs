{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE OverloadedStrings #-}

-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.

-- | Contains the different functions to run the operation getCustomersCustomerBalanceTransactionsTransaction
module StripeAPI.Operations.GetCustomersCustomerBalanceTransactionsTransaction where

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

-- | > GET /v1/customers/{customer}/balance_transactions/{transaction}
--
-- \<p>Retrieves a specific transaction that updated the customer’s \<a href=\"\/docs\/api\/customers\/object\#customer_object-balance\">\<code>balance\<\/code>\<\/a>.\<\/p>
getCustomersCustomerBalanceTransactionsTransaction ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | Contains all available parameters of this operation (query and path parameters)
  GetCustomersCustomerBalanceTransactionsTransactionParameters ->
  -- | Monadic computation which returns the result of the operation
  StripeAPI.Common.StripeT m (Network.HTTP.Client.Types.Response GetCustomersCustomerBalanceTransactionsTransactionResponse)
getCustomersCustomerBalanceTransactionsTransaction parameters =
  GHC.Base.fmap
    ( \response_0 ->
        GHC.Base.fmap
          ( Data.Either.either GetCustomersCustomerBalanceTransactionsTransactionResponseError GHC.Base.id
              GHC.Base.. ( \response body ->
                             if  | (\status_1 -> Network.HTTP.Types.Status.statusCode status_1 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) ->
                                   GetCustomersCustomerBalanceTransactionsTransactionResponse200
                                     Data.Functor.<$> ( Data.Aeson.eitherDecodeStrict body ::
                                                          Data.Either.Either GHC.Base.String
                                                            CustomerBalanceTransaction
                                                      )
                                 | GHC.Base.const GHC.Types.True (Network.HTTP.Client.Types.responseStatus response) ->
                                   GetCustomersCustomerBalanceTransactionsTransactionResponseDefault
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
    (StripeAPI.Common.doCallWithConfigurationM (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET") (Data.Text.pack ("/v1/customers/" GHC.Base.++ (Data.ByteString.Char8.unpack (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Data.ByteString.Char8.pack GHC.Base.$ StripeAPI.Common.stringifyModel (getCustomersCustomerBalanceTransactionsTransactionParametersPathCustomer parameters))) GHC.Base.++ ("/balance_transactions/" GHC.Base.++ (Data.ByteString.Char8.unpack (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Data.ByteString.Char8.pack GHC.Base.$ StripeAPI.Common.stringifyModel (getCustomersCustomerBalanceTransactionsTransactionParametersPathTransaction parameters))) GHC.Base.++ ""))))) [StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCustomersCustomerBalanceTransactionsTransactionParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True])

-- | Defines the data type for the schema getCustomersCustomerBalanceTransactionsTransactionParameters
data GetCustomersCustomerBalanceTransactionsTransactionParameters
  = GetCustomersCustomerBalanceTransactionsTransactionParameters
      { -- | pathCustomer: Represents the parameter named \'customer\'
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        getCustomersCustomerBalanceTransactionsTransactionParametersPathCustomer :: Data.Text.Internal.Text,
        -- | pathTransaction: Represents the parameter named \'transaction\'
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        getCustomersCustomerBalanceTransactionsTransactionParametersPathTransaction :: Data.Text.Internal.Text,
        -- | queryExpand: Represents the parameter named \'expand\'
        --
        -- Specifies which fields in the response should be expanded.
        getCustomersCustomerBalanceTransactionsTransactionParametersQueryExpand :: (GHC.Maybe.Maybe ([] Data.Text.Internal.Text))
      }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.ToJSON GetCustomersCustomerBalanceTransactionsTransactionParameters where
  toJSON obj = Data.Aeson.object ((Data.Aeson..=) "pathCustomer" (getCustomersCustomerBalanceTransactionsTransactionParametersPathCustomer obj) : (Data.Aeson..=) "pathTransaction" (getCustomersCustomerBalanceTransactionsTransactionParametersPathTransaction obj) : (Data.Aeson..=) "queryExpand" (getCustomersCustomerBalanceTransactionsTransactionParametersQueryExpand obj) : [])
  toEncoding obj = Data.Aeson.pairs ((Data.Aeson..=) "pathCustomer" (getCustomersCustomerBalanceTransactionsTransactionParametersPathCustomer obj) GHC.Base.<> ((Data.Aeson..=) "pathTransaction" (getCustomersCustomerBalanceTransactionsTransactionParametersPathTransaction obj) GHC.Base.<> (Data.Aeson..=) "queryExpand" (getCustomersCustomerBalanceTransactionsTransactionParametersQueryExpand obj)))

instance Data.Aeson.Types.FromJSON.FromJSON GetCustomersCustomerBalanceTransactionsTransactionParameters where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "GetCustomersCustomerBalanceTransactionsTransactionParameters" (\obj -> ((GHC.Base.pure GetCustomersCustomerBalanceTransactionsTransactionParameters GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "pathCustomer")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "pathTransaction")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryExpand"))

-- | Represents a response of the operation 'getCustomersCustomerBalanceTransactionsTransaction'.
--
-- The response constructor is chosen by the status code of the response. If no case matches (no specific case for the response code, no range case, no default case), 'GetCustomersCustomerBalanceTransactionsTransactionResponseError' is used.
data GetCustomersCustomerBalanceTransactionsTransactionResponse
  = -- | Means either no matching case available or a parse error
    GetCustomersCustomerBalanceTransactionsTransactionResponseError GHC.Base.String
  | -- | Successful response.
    GetCustomersCustomerBalanceTransactionsTransactionResponse200 CustomerBalanceTransaction
  | -- | Error response.
    GetCustomersCustomerBalanceTransactionsTransactionResponseDefault Error
  deriving (GHC.Show.Show, GHC.Classes.Eq)

-- | > GET /v1/customers/{customer}/balance_transactions/{transaction}
--
-- The same as 'getCustomersCustomerBalanceTransactionsTransaction' but accepts an explicit configuration.
getCustomersCustomerBalanceTransactionsTransactionWithConfiguration ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | The configuration to use in the request
  StripeAPI.Common.Configuration ->
  -- | Contains all available parameters of this operation (query and path parameters)
  GetCustomersCustomerBalanceTransactionsTransactionParameters ->
  -- | Monadic computation which returns the result of the operation
  m (Network.HTTP.Client.Types.Response GetCustomersCustomerBalanceTransactionsTransactionResponse)
getCustomersCustomerBalanceTransactionsTransactionWithConfiguration
  config
  parameters =
    GHC.Base.fmap
      ( \response_2 ->
          GHC.Base.fmap
            ( Data.Either.either GetCustomersCustomerBalanceTransactionsTransactionResponseError GHC.Base.id
                GHC.Base.. ( \response body ->
                               if  | (\status_3 -> Network.HTTP.Types.Status.statusCode status_3 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) ->
                                     GetCustomersCustomerBalanceTransactionsTransactionResponse200
                                       Data.Functor.<$> ( Data.Aeson.eitherDecodeStrict body ::
                                                            Data.Either.Either GHC.Base.String
                                                              CustomerBalanceTransaction
                                                        )
                                   | GHC.Base.const GHC.Types.True (Network.HTTP.Client.Types.responseStatus response) ->
                                     GetCustomersCustomerBalanceTransactionsTransactionResponseDefault
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
      (StripeAPI.Common.doCallWithConfiguration config (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET") (Data.Text.pack ("/v1/customers/" GHC.Base.++ (Data.ByteString.Char8.unpack (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Data.ByteString.Char8.pack GHC.Base.$ StripeAPI.Common.stringifyModel (getCustomersCustomerBalanceTransactionsTransactionParametersPathCustomer parameters))) GHC.Base.++ ("/balance_transactions/" GHC.Base.++ (Data.ByteString.Char8.unpack (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Data.ByteString.Char8.pack GHC.Base.$ StripeAPI.Common.stringifyModel (getCustomersCustomerBalanceTransactionsTransactionParametersPathTransaction parameters))) GHC.Base.++ ""))))) [StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCustomersCustomerBalanceTransactionsTransactionParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True])

-- | > GET /v1/customers/{customer}/balance_transactions/{transaction}
--
-- The same as 'getCustomersCustomerBalanceTransactionsTransaction' but returns the raw 'Data.ByteString.Char8.ByteString'.
getCustomersCustomerBalanceTransactionsTransactionRaw ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | Contains all available parameters of this operation (query and path parameters)
  GetCustomersCustomerBalanceTransactionsTransactionParameters ->
  -- | Monadic computation which returns the result of the operation
  StripeAPI.Common.StripeT m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.ByteString)
getCustomersCustomerBalanceTransactionsTransactionRaw parameters = GHC.Base.id (StripeAPI.Common.doCallWithConfigurationM (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET") (Data.Text.pack ("/v1/customers/" GHC.Base.++ (Data.ByteString.Char8.unpack (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Data.ByteString.Char8.pack GHC.Base.$ StripeAPI.Common.stringifyModel (getCustomersCustomerBalanceTransactionsTransactionParametersPathCustomer parameters))) GHC.Base.++ ("/balance_transactions/" GHC.Base.++ (Data.ByteString.Char8.unpack (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Data.ByteString.Char8.pack GHC.Base.$ StripeAPI.Common.stringifyModel (getCustomersCustomerBalanceTransactionsTransactionParametersPathTransaction parameters))) GHC.Base.++ ""))))) [StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCustomersCustomerBalanceTransactionsTransactionParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True])

-- | > GET /v1/customers/{customer}/balance_transactions/{transaction}
--
-- The same as 'getCustomersCustomerBalanceTransactionsTransaction' but accepts an explicit configuration and returns the raw 'Data.ByteString.Char8.ByteString'.
getCustomersCustomerBalanceTransactionsTransactionWithConfigurationRaw ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | The configuration to use in the request
  StripeAPI.Common.Configuration ->
  -- | Contains all available parameters of this operation (query and path parameters)
  GetCustomersCustomerBalanceTransactionsTransactionParameters ->
  -- | Monadic computation which returns the result of the operation
  m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.ByteString)
getCustomersCustomerBalanceTransactionsTransactionWithConfigurationRaw
  config
  parameters = GHC.Base.id (StripeAPI.Common.doCallWithConfiguration config (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET") (Data.Text.pack ("/v1/customers/" GHC.Base.++ (Data.ByteString.Char8.unpack (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Data.ByteString.Char8.pack GHC.Base.$ StripeAPI.Common.stringifyModel (getCustomersCustomerBalanceTransactionsTransactionParametersPathCustomer parameters))) GHC.Base.++ ("/balance_transactions/" GHC.Base.++ (Data.ByteString.Char8.unpack (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Data.ByteString.Char8.pack GHC.Base.$ StripeAPI.Common.stringifyModel (getCustomersCustomerBalanceTransactionsTransactionParametersPathTransaction parameters))) GHC.Base.++ ""))))) [StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCustomersCustomerBalanceTransactionsTransactionParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True])
