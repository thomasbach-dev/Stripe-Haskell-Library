{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE MultiWayIf #-}
-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.
{-# LANGUAGE OverloadedStrings #-}

-- | Contains the different functions to run the operation postAccountBankAccounts
module StripeAPI.Operations.PostAccountBankAccounts where

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

-- | > POST /v1/account/bank_accounts
--
-- \<p>Create an external account for a given account.\<\/p>
postAccountBankAccounts ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | The request body to send
  GHC.Maybe.Maybe PostAccountBankAccountsRequestBody ->
  -- | Monadic computation which returns the result of the operation
  StripeAPI.Common.ClientT m (Network.HTTP.Client.Types.Response PostAccountBankAccountsResponse)
postAccountBankAccounts body =
  GHC.Base.fmap
    ( \response_0 ->
        GHC.Base.fmap
          ( Data.Either.either PostAccountBankAccountsResponseError GHC.Base.id
              GHC.Base.. ( \response body ->
                             if
                                 | (\status_1 -> Network.HTTP.Types.Status.statusCode status_1 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) ->
                                   PostAccountBankAccountsResponse200
                                     Data.Functor.<$> ( Data.Aeson.eitherDecodeStrict body ::
                                                          Data.Either.Either
                                                            GHC.Base.String
                                                            ExternalAccount
                                                      )
                                 | GHC.Base.const GHC.Types.True (Network.HTTP.Client.Types.responseStatus response) ->
                                   PostAccountBankAccountsResponseDefault
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
    (StripeAPI.Common.doBodyCallWithConfigurationM (Data.Text.toUpper GHC.Base.$ Data.Text.pack "POST") (Data.Text.pack "/v1/account/bank_accounts") GHC.Base.mempty body StripeAPI.Common.RequestBodyEncodingFormData)

-- | Defines the object schema located at @paths.\/v1\/account\/bank_accounts.POST.requestBody.content.application\/x-www-form-urlencoded.schema@ in the specification.
data PostAccountBankAccountsRequestBody = PostAccountBankAccountsRequestBody
  { -- | bank_account: Either a token, like the ones returned by [Stripe.js](https:\/\/stripe.com\/docs\/js), or a dictionary containing a user\'s bank account details.
    postAccountBankAccountsRequestBodyBankAccount :: (GHC.Maybe.Maybe PostAccountBankAccountsRequestBodyBankAccount'Variants),
    -- | default_for_currency: When set to true, or if this is the first external account added in this currency, this account becomes the default external account for its currency.
    postAccountBankAccountsRequestBodyDefaultForCurrency :: (GHC.Maybe.Maybe GHC.Types.Bool),
    -- | expand: Specifies which fields in the response should be expanded.
    postAccountBankAccountsRequestBodyExpand :: (GHC.Maybe.Maybe ([Data.Text.Internal.Text])),
    -- | external_account: Please refer to full [documentation](https:\/\/stripe.com\/docs\/api) instead.
    --
    -- Constraints:
    --
    -- * Maximum length of 5000
    postAccountBankAccountsRequestBodyExternalAccount :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
    -- | metadata: Set of [key-value pairs](https:\/\/stripe.com\/docs\/api\/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to \`metadata\`.
    postAccountBankAccountsRequestBodyMetadata :: (GHC.Maybe.Maybe Data.Aeson.Types.Internal.Object)
  }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.Types.ToJSON.ToJSON PostAccountBankAccountsRequestBody where
  toJSON obj = Data.Aeson.Types.Internal.object ("bank_account" Data.Aeson.Types.ToJSON..= postAccountBankAccountsRequestBodyBankAccount obj : "default_for_currency" Data.Aeson.Types.ToJSON..= postAccountBankAccountsRequestBodyDefaultForCurrency obj : "expand" Data.Aeson.Types.ToJSON..= postAccountBankAccountsRequestBodyExpand obj : "external_account" Data.Aeson.Types.ToJSON..= postAccountBankAccountsRequestBodyExternalAccount obj : "metadata" Data.Aeson.Types.ToJSON..= postAccountBankAccountsRequestBodyMetadata obj : GHC.Base.mempty)
  toEncoding obj = Data.Aeson.Encoding.Internal.pairs (("bank_account" Data.Aeson.Types.ToJSON..= postAccountBankAccountsRequestBodyBankAccount obj) GHC.Base.<> (("default_for_currency" Data.Aeson.Types.ToJSON..= postAccountBankAccountsRequestBodyDefaultForCurrency obj) GHC.Base.<> (("expand" Data.Aeson.Types.ToJSON..= postAccountBankAccountsRequestBodyExpand obj) GHC.Base.<> (("external_account" Data.Aeson.Types.ToJSON..= postAccountBankAccountsRequestBodyExternalAccount obj) GHC.Base.<> ("metadata" Data.Aeson.Types.ToJSON..= postAccountBankAccountsRequestBodyMetadata obj)))))

instance Data.Aeson.Types.FromJSON.FromJSON PostAccountBankAccountsRequestBody where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "PostAccountBankAccountsRequestBody" (\obj -> ((((GHC.Base.pure PostAccountBankAccountsRequestBody GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "bank_account")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "default_for_currency")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "expand")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "external_account")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "metadata"))

-- | Create a new 'PostAccountBankAccountsRequestBody' with all required fields.
mkPostAccountBankAccountsRequestBody :: PostAccountBankAccountsRequestBody
mkPostAccountBankAccountsRequestBody =
  PostAccountBankAccountsRequestBody
    { postAccountBankAccountsRequestBodyBankAccount = GHC.Maybe.Nothing,
      postAccountBankAccountsRequestBodyDefaultForCurrency = GHC.Maybe.Nothing,
      postAccountBankAccountsRequestBodyExpand = GHC.Maybe.Nothing,
      postAccountBankAccountsRequestBodyExternalAccount = GHC.Maybe.Nothing,
      postAccountBankAccountsRequestBodyMetadata = GHC.Maybe.Nothing
    }

-- | Defines the object schema located at @paths.\/v1\/account\/bank_accounts.POST.requestBody.content.application\/x-www-form-urlencoded.schema.properties.bank_account.anyOf@ in the specification.
data PostAccountBankAccountsRequestBodyBankAccount'OneOf1 = PostAccountBankAccountsRequestBodyBankAccount'OneOf1
  { -- | account_holder_name
    --
    -- Constraints:
    --
    -- * Maximum length of 5000
    postAccountBankAccountsRequestBodyBankAccount'OneOf1AccountHolderName :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
    -- | account_holder_type
    --
    -- Constraints:
    --
    -- * Maximum length of 5000
    postAccountBankAccountsRequestBodyBankAccount'OneOf1AccountHolderType :: (GHC.Maybe.Maybe PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountHolderType'),
    -- | account_number
    --
    -- Constraints:
    --
    -- * Maximum length of 5000
    postAccountBankAccountsRequestBodyBankAccount'OneOf1AccountNumber :: Data.Text.Internal.Text,
    -- | account_type
    --
    -- Constraints:
    --
    -- * Maximum length of 5000
    postAccountBankAccountsRequestBodyBankAccount'OneOf1AccountType :: (GHC.Maybe.Maybe PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountType'),
    -- | country
    --
    -- Constraints:
    --
    -- * Maximum length of 5000
    postAccountBankAccountsRequestBodyBankAccount'OneOf1Country :: Data.Text.Internal.Text,
    -- | currency
    postAccountBankAccountsRequestBodyBankAccount'OneOf1Currency :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
    -- | object
    --
    -- Constraints:
    --
    -- * Maximum length of 5000
    postAccountBankAccountsRequestBodyBankAccount'OneOf1Object :: (GHC.Maybe.Maybe PostAccountBankAccountsRequestBodyBankAccount'OneOf1Object'),
    -- | routing_number
    --
    -- Constraints:
    --
    -- * Maximum length of 5000
    postAccountBankAccountsRequestBodyBankAccount'OneOf1RoutingNumber :: (GHC.Maybe.Maybe Data.Text.Internal.Text)
  }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.Types.ToJSON.ToJSON PostAccountBankAccountsRequestBodyBankAccount'OneOf1 where
  toJSON obj = Data.Aeson.Types.Internal.object ("account_holder_name" Data.Aeson.Types.ToJSON..= postAccountBankAccountsRequestBodyBankAccount'OneOf1AccountHolderName obj : "account_holder_type" Data.Aeson.Types.ToJSON..= postAccountBankAccountsRequestBodyBankAccount'OneOf1AccountHolderType obj : "account_number" Data.Aeson.Types.ToJSON..= postAccountBankAccountsRequestBodyBankAccount'OneOf1AccountNumber obj : "account_type" Data.Aeson.Types.ToJSON..= postAccountBankAccountsRequestBodyBankAccount'OneOf1AccountType obj : "country" Data.Aeson.Types.ToJSON..= postAccountBankAccountsRequestBodyBankAccount'OneOf1Country obj : "currency" Data.Aeson.Types.ToJSON..= postAccountBankAccountsRequestBodyBankAccount'OneOf1Currency obj : "object" Data.Aeson.Types.ToJSON..= postAccountBankAccountsRequestBodyBankAccount'OneOf1Object obj : "routing_number" Data.Aeson.Types.ToJSON..= postAccountBankAccountsRequestBodyBankAccount'OneOf1RoutingNumber obj : GHC.Base.mempty)
  toEncoding obj = Data.Aeson.Encoding.Internal.pairs (("account_holder_name" Data.Aeson.Types.ToJSON..= postAccountBankAccountsRequestBodyBankAccount'OneOf1AccountHolderName obj) GHC.Base.<> (("account_holder_type" Data.Aeson.Types.ToJSON..= postAccountBankAccountsRequestBodyBankAccount'OneOf1AccountHolderType obj) GHC.Base.<> (("account_number" Data.Aeson.Types.ToJSON..= postAccountBankAccountsRequestBodyBankAccount'OneOf1AccountNumber obj) GHC.Base.<> (("account_type" Data.Aeson.Types.ToJSON..= postAccountBankAccountsRequestBodyBankAccount'OneOf1AccountType obj) GHC.Base.<> (("country" Data.Aeson.Types.ToJSON..= postAccountBankAccountsRequestBodyBankAccount'OneOf1Country obj) GHC.Base.<> (("currency" Data.Aeson.Types.ToJSON..= postAccountBankAccountsRequestBodyBankAccount'OneOf1Currency obj) GHC.Base.<> (("object" Data.Aeson.Types.ToJSON..= postAccountBankAccountsRequestBodyBankAccount'OneOf1Object obj) GHC.Base.<> ("routing_number" Data.Aeson.Types.ToJSON..= postAccountBankAccountsRequestBodyBankAccount'OneOf1RoutingNumber obj))))))))

instance Data.Aeson.Types.FromJSON.FromJSON PostAccountBankAccountsRequestBodyBankAccount'OneOf1 where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "PostAccountBankAccountsRequestBodyBankAccount'OneOf1" (\obj -> (((((((GHC.Base.pure PostAccountBankAccountsRequestBodyBankAccount'OneOf1 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "account_holder_name")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "account_holder_type")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "account_number")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "account_type")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "country")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "currency")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "object")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "routing_number"))

-- | Create a new 'PostAccountBankAccountsRequestBodyBankAccount'OneOf1' with all required fields.
mkPostAccountBankAccountsRequestBodyBankAccount'OneOf1 ::
  -- | 'postAccountBankAccountsRequestBodyBankAccount'OneOf1AccountNumber'
  Data.Text.Internal.Text ->
  -- | 'postAccountBankAccountsRequestBodyBankAccount'OneOf1Country'
  Data.Text.Internal.Text ->
  PostAccountBankAccountsRequestBodyBankAccount'OneOf1
mkPostAccountBankAccountsRequestBodyBankAccount'OneOf1 postAccountBankAccountsRequestBodyBankAccount'OneOf1AccountNumber postAccountBankAccountsRequestBodyBankAccount'OneOf1Country =
  PostAccountBankAccountsRequestBodyBankAccount'OneOf1
    { postAccountBankAccountsRequestBodyBankAccount'OneOf1AccountHolderName = GHC.Maybe.Nothing,
      postAccountBankAccountsRequestBodyBankAccount'OneOf1AccountHolderType = GHC.Maybe.Nothing,
      postAccountBankAccountsRequestBodyBankAccount'OneOf1AccountNumber = postAccountBankAccountsRequestBodyBankAccount'OneOf1AccountNumber,
      postAccountBankAccountsRequestBodyBankAccount'OneOf1AccountType = GHC.Maybe.Nothing,
      postAccountBankAccountsRequestBodyBankAccount'OneOf1Country = postAccountBankAccountsRequestBodyBankAccount'OneOf1Country,
      postAccountBankAccountsRequestBodyBankAccount'OneOf1Currency = GHC.Maybe.Nothing,
      postAccountBankAccountsRequestBodyBankAccount'OneOf1Object = GHC.Maybe.Nothing,
      postAccountBankAccountsRequestBodyBankAccount'OneOf1RoutingNumber = GHC.Maybe.Nothing
    }

-- | Defines the enum schema located at @paths.\/v1\/account\/bank_accounts.POST.requestBody.content.application\/x-www-form-urlencoded.schema.properties.bank_account.anyOf.properties.account_holder_type@ in the specification.
data PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountHolderType'
  = -- | This case is used if the value encountered during decoding does not match any of the provided cases in the specification.
    PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountHolderType'Other Data.Aeson.Types.Internal.Value
  | -- | This constructor can be used to send values to the server which are not present in the specification yet.
    PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountHolderType'Typed Data.Text.Internal.Text
  | -- | Represents the JSON value @"company"@
    PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountHolderType'EnumCompany
  | -- | Represents the JSON value @"individual"@
    PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountHolderType'EnumIndividual
  deriving (GHC.Show.Show, GHC.Classes.Eq)

instance Data.Aeson.Types.ToJSON.ToJSON PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountHolderType' where
  toJSON (PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountHolderType'Other val) = val
  toJSON (PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountHolderType'Typed val) = Data.Aeson.Types.ToJSON.toJSON val
  toJSON (PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountHolderType'EnumCompany) = "company"
  toJSON (PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountHolderType'EnumIndividual) = "individual"

instance Data.Aeson.Types.FromJSON.FromJSON PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountHolderType' where
  parseJSON val =
    GHC.Base.pure
      ( if
            | val GHC.Classes.== "company" -> PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountHolderType'EnumCompany
            | val GHC.Classes.== "individual" -> PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountHolderType'EnumIndividual
            | GHC.Base.otherwise -> PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountHolderType'Other val
      )

-- | Defines the enum schema located at @paths.\/v1\/account\/bank_accounts.POST.requestBody.content.application\/x-www-form-urlencoded.schema.properties.bank_account.anyOf.properties.account_type@ in the specification.
data PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountType'
  = -- | This case is used if the value encountered during decoding does not match any of the provided cases in the specification.
    PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountType'Other Data.Aeson.Types.Internal.Value
  | -- | This constructor can be used to send values to the server which are not present in the specification yet.
    PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountType'Typed Data.Text.Internal.Text
  | -- | Represents the JSON value @"checking"@
    PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountType'EnumChecking
  | -- | Represents the JSON value @"futsu"@
    PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountType'EnumFutsu
  | -- | Represents the JSON value @"savings"@
    PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountType'EnumSavings
  | -- | Represents the JSON value @"toza"@
    PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountType'EnumToza
  deriving (GHC.Show.Show, GHC.Classes.Eq)

instance Data.Aeson.Types.ToJSON.ToJSON PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountType' where
  toJSON (PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountType'Other val) = val
  toJSON (PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountType'Typed val) = Data.Aeson.Types.ToJSON.toJSON val
  toJSON (PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountType'EnumChecking) = "checking"
  toJSON (PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountType'EnumFutsu) = "futsu"
  toJSON (PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountType'EnumSavings) = "savings"
  toJSON (PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountType'EnumToza) = "toza"

instance Data.Aeson.Types.FromJSON.FromJSON PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountType' where
  parseJSON val =
    GHC.Base.pure
      ( if
            | val GHC.Classes.== "checking" -> PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountType'EnumChecking
            | val GHC.Classes.== "futsu" -> PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountType'EnumFutsu
            | val GHC.Classes.== "savings" -> PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountType'EnumSavings
            | val GHC.Classes.== "toza" -> PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountType'EnumToza
            | GHC.Base.otherwise -> PostAccountBankAccountsRequestBodyBankAccount'OneOf1AccountType'Other val
      )

-- | Defines the enum schema located at @paths.\/v1\/account\/bank_accounts.POST.requestBody.content.application\/x-www-form-urlencoded.schema.properties.bank_account.anyOf.properties.object@ in the specification.
data PostAccountBankAccountsRequestBodyBankAccount'OneOf1Object'
  = -- | This case is used if the value encountered during decoding does not match any of the provided cases in the specification.
    PostAccountBankAccountsRequestBodyBankAccount'OneOf1Object'Other Data.Aeson.Types.Internal.Value
  | -- | This constructor can be used to send values to the server which are not present in the specification yet.
    PostAccountBankAccountsRequestBodyBankAccount'OneOf1Object'Typed Data.Text.Internal.Text
  | -- | Represents the JSON value @"bank_account"@
    PostAccountBankAccountsRequestBodyBankAccount'OneOf1Object'EnumBankAccount
  deriving (GHC.Show.Show, GHC.Classes.Eq)

instance Data.Aeson.Types.ToJSON.ToJSON PostAccountBankAccountsRequestBodyBankAccount'OneOf1Object' where
  toJSON (PostAccountBankAccountsRequestBodyBankAccount'OneOf1Object'Other val) = val
  toJSON (PostAccountBankAccountsRequestBodyBankAccount'OneOf1Object'Typed val) = Data.Aeson.Types.ToJSON.toJSON val
  toJSON (PostAccountBankAccountsRequestBodyBankAccount'OneOf1Object'EnumBankAccount) = "bank_account"

instance Data.Aeson.Types.FromJSON.FromJSON PostAccountBankAccountsRequestBodyBankAccount'OneOf1Object' where
  parseJSON val =
    GHC.Base.pure
      ( if
            | val GHC.Classes.== "bank_account" -> PostAccountBankAccountsRequestBodyBankAccount'OneOf1Object'EnumBankAccount
            | GHC.Base.otherwise -> PostAccountBankAccountsRequestBodyBankAccount'OneOf1Object'Other val
      )

-- | Defines the oneOf schema located at @paths.\/v1\/account\/bank_accounts.POST.requestBody.content.application\/x-www-form-urlencoded.schema.properties.bank_account.anyOf@ in the specification.
--
-- Either a token, like the ones returned by [Stripe.js](https:\/\/stripe.com\/docs\/js), or a dictionary containing a user\'s bank account details.
data PostAccountBankAccountsRequestBodyBankAccount'Variants
  = PostAccountBankAccountsRequestBodyBankAccount'PostAccountBankAccountsRequestBodyBankAccount'OneOf1 PostAccountBankAccountsRequestBodyBankAccount'OneOf1
  | PostAccountBankAccountsRequestBodyBankAccount'Text Data.Text.Internal.Text
  deriving (GHC.Show.Show, GHC.Classes.Eq)

instance Data.Aeson.Types.ToJSON.ToJSON PostAccountBankAccountsRequestBodyBankAccount'Variants where
  toJSON (PostAccountBankAccountsRequestBodyBankAccount'PostAccountBankAccountsRequestBodyBankAccount'OneOf1 a) = Data.Aeson.Types.ToJSON.toJSON a
  toJSON (PostAccountBankAccountsRequestBodyBankAccount'Text a) = Data.Aeson.Types.ToJSON.toJSON a

instance Data.Aeson.Types.FromJSON.FromJSON PostAccountBankAccountsRequestBodyBankAccount'Variants where
  parseJSON val = case (PostAccountBankAccountsRequestBodyBankAccount'PostAccountBankAccountsRequestBodyBankAccount'OneOf1 Data.Functor.<$> Data.Aeson.Types.FromJSON.fromJSON val) GHC.Base.<|> ((PostAccountBankAccountsRequestBodyBankAccount'Text Data.Functor.<$> Data.Aeson.Types.FromJSON.fromJSON val) GHC.Base.<|> Data.Aeson.Types.Internal.Error "No variant matched") of
    Data.Aeson.Types.Internal.Success a -> GHC.Base.pure a
    Data.Aeson.Types.Internal.Error a -> Control.Monad.Fail.fail a

-- | Represents a response of the operation 'postAccountBankAccounts'.
--
-- The response constructor is chosen by the status code of the response. If no case matches (no specific case for the response code, no range case, no default case), 'PostAccountBankAccountsResponseError' is used.
data PostAccountBankAccountsResponse
  = -- | Means either no matching case available or a parse error
    PostAccountBankAccountsResponseError GHC.Base.String
  | -- | Successful response.
    PostAccountBankAccountsResponse200 ExternalAccount
  | -- | Error response.
    PostAccountBankAccountsResponseDefault Error
  deriving (GHC.Show.Show, GHC.Classes.Eq)
