{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE OverloadedStrings #-}

-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.

-- | Contains the different functions to run the operation postAccountsAccountExternalAccounts
module StripeAPI.Operations.PostAccountsAccountExternalAccounts where

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

-- | > POST /v1/accounts/{account}/external_accounts
--
-- \<p>Create an external account for a given account.\<\/p>
postAccountsAccountExternalAccounts ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | account | Constraints: Maximum length of 5000
  Data.Text.Internal.Text ->
  -- | The request body to send
  GHC.Maybe.Maybe PostAccountsAccountExternalAccountsRequestBody ->
  -- | Monadic computation which returns the result of the operation
  StripeAPI.Common.StripeT m (Network.HTTP.Client.Types.Response PostAccountsAccountExternalAccountsResponse)
postAccountsAccountExternalAccounts
  account
  body =
    GHC.Base.fmap
      ( \response_0 ->
          GHC.Base.fmap
            ( Data.Either.either PostAccountsAccountExternalAccountsResponseError GHC.Base.id
                GHC.Base.. ( \response body ->
                               if  | (\status_1 -> Network.HTTP.Types.Status.statusCode status_1 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) ->
                                     PostAccountsAccountExternalAccountsResponse200
                                       Data.Functor.<$> ( Data.Aeson.eitherDecodeStrict body ::
                                                            Data.Either.Either GHC.Base.String
                                                              ExternalAccount
                                                        )
                                   | GHC.Base.const GHC.Types.True (Network.HTTP.Client.Types.responseStatus response) ->
                                     PostAccountsAccountExternalAccountsResponseDefault
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
      (StripeAPI.Common.doBodyCallWithConfigurationM (Data.Text.toUpper GHC.Base.$ Data.Text.pack "POST") (Data.Text.pack ("/v1/accounts/" GHC.Base.++ (Data.ByteString.Char8.unpack (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Data.ByteString.Char8.pack GHC.Base.$ StripeAPI.Common.stringifyModel account)) GHC.Base.++ "/external_accounts"))) [] body StripeAPI.Common.RequestBodyEncodingFormData)

-- | Defines the data type for the schema postAccountsAccountExternalAccountsRequestBody
data PostAccountsAccountExternalAccountsRequestBody
  = PostAccountsAccountExternalAccountsRequestBody
      { -- | bank_account: Either a token, like the ones returned by [Stripe.js](https:\/\/stripe.com\/docs\/stripe.js), or a dictionary containing a user\'s bank account details.
        postAccountsAccountExternalAccountsRequestBodyBankAccount :: (GHC.Maybe.Maybe PostAccountsAccountExternalAccountsRequestBodyBankAccount'Variants),
        -- | default_for_currency: When set to true, or if this is the first external account added in this currency, this account becomes the default external account for its currency.
        postAccountsAccountExternalAccountsRequestBodyDefaultForCurrency :: (GHC.Maybe.Maybe GHC.Types.Bool),
        -- | expand: Specifies which fields in the response should be expanded.
        postAccountsAccountExternalAccountsRequestBodyExpand :: (GHC.Maybe.Maybe ([] Data.Text.Internal.Text)),
        -- | external_account: Please refer to full [documentation](https:\/\/stripe.com\/docs\/api) instead.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        postAccountsAccountExternalAccountsRequestBodyExternalAccount :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
        -- | metadata: Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to \`metadata\`.
        postAccountsAccountExternalAccountsRequestBodyMetadata :: (GHC.Maybe.Maybe Data.Aeson.Types.Internal.Object)
      }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.ToJSON PostAccountsAccountExternalAccountsRequestBody where
  toJSON obj = Data.Aeson.object ((Data.Aeson..=) "bank_account" (postAccountsAccountExternalAccountsRequestBodyBankAccount obj) : (Data.Aeson..=) "default_for_currency" (postAccountsAccountExternalAccountsRequestBodyDefaultForCurrency obj) : (Data.Aeson..=) "expand" (postAccountsAccountExternalAccountsRequestBodyExpand obj) : (Data.Aeson..=) "external_account" (postAccountsAccountExternalAccountsRequestBodyExternalAccount obj) : (Data.Aeson..=) "metadata" (postAccountsAccountExternalAccountsRequestBodyMetadata obj) : [])
  toEncoding obj = Data.Aeson.pairs ((Data.Aeson..=) "bank_account" (postAccountsAccountExternalAccountsRequestBodyBankAccount obj) GHC.Base.<> ((Data.Aeson..=) "default_for_currency" (postAccountsAccountExternalAccountsRequestBodyDefaultForCurrency obj) GHC.Base.<> ((Data.Aeson..=) "expand" (postAccountsAccountExternalAccountsRequestBodyExpand obj) GHC.Base.<> ((Data.Aeson..=) "external_account" (postAccountsAccountExternalAccountsRequestBodyExternalAccount obj) GHC.Base.<> (Data.Aeson..=) "metadata" (postAccountsAccountExternalAccountsRequestBodyMetadata obj)))))

instance Data.Aeson.Types.FromJSON.FromJSON PostAccountsAccountExternalAccountsRequestBody where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "PostAccountsAccountExternalAccountsRequestBody" (\obj -> ((((GHC.Base.pure PostAccountsAccountExternalAccountsRequestBody GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "bank_account")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "default_for_currency")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "expand")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "external_account")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "metadata"))

-- | Defines the data type for the schema postAccountsAccountExternalAccountsRequestBodyBank_account\'OneOf2
data PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2
  = PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2
      { -- | account_holder_name
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        postAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2AccountHolderName :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
        -- | account_holder_type
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        postAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2AccountHolderType :: (GHC.Maybe.Maybe PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2AccountHolderType'),
        -- | account_number
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        postAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2AccountNumber :: Data.Text.Internal.Text,
        -- | country
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        postAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2Country :: Data.Text.Internal.Text,
        -- | currency
        postAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2Currency :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
        -- | object
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        postAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2Object :: (GHC.Maybe.Maybe PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2Object'),
        -- | routing_number
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        postAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2RoutingNumber :: (GHC.Maybe.Maybe Data.Text.Internal.Text)
      }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.ToJSON PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2 where
  toJSON obj = Data.Aeson.object ((Data.Aeson..=) "account_holder_name" (postAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2AccountHolderName obj) : (Data.Aeson..=) "account_holder_type" (postAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2AccountHolderType obj) : (Data.Aeson..=) "account_number" (postAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2AccountNumber obj) : (Data.Aeson..=) "country" (postAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2Country obj) : (Data.Aeson..=) "currency" (postAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2Currency obj) : (Data.Aeson..=) "object" (postAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2Object obj) : (Data.Aeson..=) "routing_number" (postAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2RoutingNumber obj) : [])
  toEncoding obj = Data.Aeson.pairs ((Data.Aeson..=) "account_holder_name" (postAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2AccountHolderName obj) GHC.Base.<> ((Data.Aeson..=) "account_holder_type" (postAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2AccountHolderType obj) GHC.Base.<> ((Data.Aeson..=) "account_number" (postAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2AccountNumber obj) GHC.Base.<> ((Data.Aeson..=) "country" (postAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2Country obj) GHC.Base.<> ((Data.Aeson..=) "currency" (postAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2Currency obj) GHC.Base.<> ((Data.Aeson..=) "object" (postAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2Object obj) GHC.Base.<> (Data.Aeson..=) "routing_number" (postAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2RoutingNumber obj)))))))

instance Data.Aeson.Types.FromJSON.FromJSON PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2 where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2" (\obj -> ((((((GHC.Base.pure PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "account_holder_name")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "account_holder_type")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "account_number")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "country")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "currency")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "object")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "routing_number"))

-- | Defines the enum schema postAccountsAccountExternalAccountsRequestBodyBank_account\'OneOf2Account_holder_type\'
data PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2AccountHolderType'
  = PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2AccountHolderType'EnumOther Data.Aeson.Types.Internal.Value
  | PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2AccountHolderType'EnumTyped Data.Text.Internal.Text
  | PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2AccountHolderType'EnumStringCompany
  | PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2AccountHolderType'EnumStringIndividual
  deriving (GHC.Show.Show, GHC.Classes.Eq)

instance Data.Aeson.ToJSON PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2AccountHolderType' where
  toJSON (PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2AccountHolderType'EnumOther patternName) = Data.Aeson.Types.ToJSON.toJSON patternName
  toJSON (PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2AccountHolderType'EnumTyped patternName) = Data.Aeson.Types.ToJSON.toJSON patternName
  toJSON (PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2AccountHolderType'EnumStringCompany) = Data.Aeson.Types.Internal.String GHC.Base.$ Data.Text.pack "company"
  toJSON (PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2AccountHolderType'EnumStringIndividual) = Data.Aeson.Types.Internal.String GHC.Base.$ Data.Text.pack "individual"

instance Data.Aeson.FromJSON PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2AccountHolderType' where
  parseJSON val =
    GHC.Base.pure
      ( if val GHC.Classes.== (Data.Aeson.Types.Internal.String GHC.Base.$ Data.Text.pack "company")
          then PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2AccountHolderType'EnumStringCompany
          else
            if val GHC.Classes.== (Data.Aeson.Types.Internal.String GHC.Base.$ Data.Text.pack "individual")
              then PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2AccountHolderType'EnumStringIndividual
              else PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2AccountHolderType'EnumOther val
      )

-- | Defines the enum schema postAccountsAccountExternalAccountsRequestBodyBank_account\'OneOf2Object\'
data PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2Object'
  = PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2Object'EnumOther Data.Aeson.Types.Internal.Value
  | PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2Object'EnumTyped Data.Text.Internal.Text
  | PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2Object'EnumStringBankAccount
  deriving (GHC.Show.Show, GHC.Classes.Eq)

instance Data.Aeson.ToJSON PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2Object' where
  toJSON (PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2Object'EnumOther patternName) = Data.Aeson.Types.ToJSON.toJSON patternName
  toJSON (PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2Object'EnumTyped patternName) = Data.Aeson.Types.ToJSON.toJSON patternName
  toJSON (PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2Object'EnumStringBankAccount) = Data.Aeson.Types.Internal.String GHC.Base.$ Data.Text.pack "bank_account"

instance Data.Aeson.FromJSON PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2Object' where
  parseJSON val =
    GHC.Base.pure
      ( if val GHC.Classes.== (Data.Aeson.Types.Internal.String GHC.Base.$ Data.Text.pack "bank_account")
          then PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2Object'EnumStringBankAccount
          else PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2Object'EnumOther val
      )

-- | Define the one-of schema postAccountsAccountExternalAccountsRequestBodyBank_account\'
--
-- Either a token, like the ones returned by [Stripe.js](https:\/\/stripe.com\/docs\/stripe.js), or a dictionary containing a user\'s bank account details.
data PostAccountsAccountExternalAccountsRequestBodyBankAccount'Variants
  = PostAccountsAccountExternalAccountsRequestBodyBankAccount'Text Data.Text.Internal.Text
  | PostAccountsAccountExternalAccountsRequestBodyBankAccount'PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2 PostAccountsAccountExternalAccountsRequestBodyBankAccount'OneOf2
  deriving (GHC.Show.Show, GHC.Classes.Eq, GHC.Generics.Generic)

instance Data.Aeson.ToJSON PostAccountsAccountExternalAccountsRequestBodyBankAccount'Variants where
  toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions {Data.Aeson.Types.Internal.sumEncoding = Data.Aeson.Types.Internal.UntaggedValue}

instance Data.Aeson.FromJSON PostAccountsAccountExternalAccountsRequestBodyBankAccount'Variants where
  parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions {Data.Aeson.Types.Internal.sumEncoding = Data.Aeson.Types.Internal.UntaggedValue}

-- | Represents a response of the operation 'postAccountsAccountExternalAccounts'.
--
-- The response constructor is chosen by the status code of the response. If no case matches (no specific case for the response code, no range case, no default case), 'PostAccountsAccountExternalAccountsResponseError' is used.
data PostAccountsAccountExternalAccountsResponse
  = -- | Means either no matching case available or a parse error
    PostAccountsAccountExternalAccountsResponseError GHC.Base.String
  | -- | Successful response.
    PostAccountsAccountExternalAccountsResponse200 ExternalAccount
  | -- | Error response.
    PostAccountsAccountExternalAccountsResponseDefault Error
  deriving (GHC.Show.Show, GHC.Classes.Eq)

-- | > POST /v1/accounts/{account}/external_accounts
--
-- The same as 'postAccountsAccountExternalAccounts' but accepts an explicit configuration.
postAccountsAccountExternalAccountsWithConfiguration ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | The configuration to use in the request
  StripeAPI.Common.Configuration ->
  -- | account | Constraints: Maximum length of 5000
  Data.Text.Internal.Text ->
  -- | The request body to send
  GHC.Maybe.Maybe PostAccountsAccountExternalAccountsRequestBody ->
  -- | Monadic computation which returns the result of the operation
  m (Network.HTTP.Client.Types.Response PostAccountsAccountExternalAccountsResponse)
postAccountsAccountExternalAccountsWithConfiguration
  config
  account
  body =
    GHC.Base.fmap
      ( \response_2 ->
          GHC.Base.fmap
            ( Data.Either.either PostAccountsAccountExternalAccountsResponseError GHC.Base.id
                GHC.Base.. ( \response body ->
                               if  | (\status_3 -> Network.HTTP.Types.Status.statusCode status_3 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) ->
                                     PostAccountsAccountExternalAccountsResponse200
                                       Data.Functor.<$> ( Data.Aeson.eitherDecodeStrict body ::
                                                            Data.Either.Either GHC.Base.String
                                                              ExternalAccount
                                                        )
                                   | GHC.Base.const GHC.Types.True (Network.HTTP.Client.Types.responseStatus response) ->
                                     PostAccountsAccountExternalAccountsResponseDefault
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
      (StripeAPI.Common.doBodyCallWithConfiguration config (Data.Text.toUpper GHC.Base.$ Data.Text.pack "POST") (Data.Text.pack ("/v1/accounts/" GHC.Base.++ (Data.ByteString.Char8.unpack (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Data.ByteString.Char8.pack GHC.Base.$ StripeAPI.Common.stringifyModel account)) GHC.Base.++ "/external_accounts"))) [] body StripeAPI.Common.RequestBodyEncodingFormData)

-- | > POST /v1/accounts/{account}/external_accounts
--
-- The same as 'postAccountsAccountExternalAccounts' but returns the raw 'Data.ByteString.Char8.ByteString'.
postAccountsAccountExternalAccountsRaw ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | account | Constraints: Maximum length of 5000
  Data.Text.Internal.Text ->
  -- | The request body to send
  GHC.Maybe.Maybe PostAccountsAccountExternalAccountsRequestBody ->
  -- | Monadic computation which returns the result of the operation
  StripeAPI.Common.StripeT m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.ByteString)
postAccountsAccountExternalAccountsRaw
  account
  body = GHC.Base.id (StripeAPI.Common.doBodyCallWithConfigurationM (Data.Text.toUpper GHC.Base.$ Data.Text.pack "POST") (Data.Text.pack ("/v1/accounts/" GHC.Base.++ (Data.ByteString.Char8.unpack (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Data.ByteString.Char8.pack GHC.Base.$ StripeAPI.Common.stringifyModel account)) GHC.Base.++ "/external_accounts"))) [] body StripeAPI.Common.RequestBodyEncodingFormData)

-- | > POST /v1/accounts/{account}/external_accounts
--
-- The same as 'postAccountsAccountExternalAccounts' but accepts an explicit configuration and returns the raw 'Data.ByteString.Char8.ByteString'.
postAccountsAccountExternalAccountsWithConfigurationRaw ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | The configuration to use in the request
  StripeAPI.Common.Configuration ->
  -- | account | Constraints: Maximum length of 5000
  Data.Text.Internal.Text ->
  -- | The request body to send
  GHC.Maybe.Maybe PostAccountsAccountExternalAccountsRequestBody ->
  -- | Monadic computation which returns the result of the operation
  m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.ByteString)
postAccountsAccountExternalAccountsWithConfigurationRaw
  config
  account
  body = GHC.Base.id (StripeAPI.Common.doBodyCallWithConfiguration config (Data.Text.toUpper GHC.Base.$ Data.Text.pack "POST") (Data.Text.pack ("/v1/accounts/" GHC.Base.++ (Data.ByteString.Char8.unpack (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Data.ByteString.Char8.pack GHC.Base.$ StripeAPI.Common.stringifyModel account)) GHC.Base.++ "/external_accounts"))) [] body StripeAPI.Common.RequestBodyEncodingFormData)
