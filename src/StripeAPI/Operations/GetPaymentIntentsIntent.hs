{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE OverloadedStrings #-}

-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.

-- | Contains the different functions to run the operation getPaymentIntentsIntent
module StripeAPI.Operations.GetPaymentIntentsIntent where

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

-- | > GET /v1/payment_intents/{intent}
--
-- \<p>Retrieves the details of a PaymentIntent that has previously been created. \<\/p>
--
-- \<p>Client-side retrieval using a publishable key is allowed when the \<code>client_secret\<\/code> is provided in the query string. \<\/p>
--
-- \<p>When retrieved with a publishable key, only a subset of properties will be returned. Please refer to the \<a href=\"\#payment_intent_object\">payment intent\<\/a> object reference for more details.\<\/p>
getPaymentIntentsIntent ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | Contains all available parameters of this operation (query and path parameters)
  GetPaymentIntentsIntentParameters ->
  -- | Monadic computation which returns the result of the operation
  StripeAPI.Common.StripeT m (Network.HTTP.Client.Types.Response GetPaymentIntentsIntentResponse)
getPaymentIntentsIntent parameters =
  GHC.Base.fmap
    ( \response_0 ->
        GHC.Base.fmap
          ( Data.Either.either GetPaymentIntentsIntentResponseError GHC.Base.id
              GHC.Base.. ( \response body ->
                             if  | (\status_1 -> Network.HTTP.Types.Status.statusCode status_1 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) ->
                                   GetPaymentIntentsIntentResponse200
                                     Data.Functor.<$> ( Data.Aeson.eitherDecodeStrict body ::
                                                          Data.Either.Either GHC.Base.String
                                                            PaymentIntent
                                                      )
                                 | GHC.Base.const GHC.Types.True (Network.HTTP.Client.Types.responseStatus response) ->
                                   GetPaymentIntentsIntentResponseDefault
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
        (Data.Text.pack ("/v1/payment_intents/" GHC.Base.++ (Data.ByteString.Char8.unpack (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Data.ByteString.Char8.pack GHC.Base.$ StripeAPI.Common.stringifyModel (getPaymentIntentsIntentParametersPathIntent parameters))) GHC.Base.++ "")))
        [ StripeAPI.Common.QueryParameter (Data.Text.pack "client_secret") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPaymentIntentsIntentParametersQueryClientSecret parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPaymentIntentsIntentParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True
        ]
    )

-- | Defines the data type for the schema getPaymentIntentsIntentParameters
data GetPaymentIntentsIntentParameters
  = GetPaymentIntentsIntentParameters
      { -- | pathIntent: Represents the parameter named \'intent\'
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        getPaymentIntentsIntentParametersPathIntent :: Data.Text.Internal.Text,
        -- | queryClient_secret: Represents the parameter named \'client_secret\'
        --
        -- The client secret of the PaymentIntent. Required if a publishable key is used to retrieve the source.
        getPaymentIntentsIntentParametersQueryClientSecret :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
        -- | queryExpand: Represents the parameter named \'expand\'
        --
        -- Specifies which fields in the response should be expanded.
        getPaymentIntentsIntentParametersQueryExpand :: (GHC.Maybe.Maybe ([] Data.Text.Internal.Text))
      }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.ToJSON GetPaymentIntentsIntentParameters where
  toJSON obj = Data.Aeson.object ((Data.Aeson..=) "pathIntent" (getPaymentIntentsIntentParametersPathIntent obj) : (Data.Aeson..=) "queryClient_secret" (getPaymentIntentsIntentParametersQueryClientSecret obj) : (Data.Aeson..=) "queryExpand" (getPaymentIntentsIntentParametersQueryExpand obj) : [])
  toEncoding obj = Data.Aeson.pairs ((Data.Aeson..=) "pathIntent" (getPaymentIntentsIntentParametersPathIntent obj) GHC.Base.<> ((Data.Aeson..=) "queryClient_secret" (getPaymentIntentsIntentParametersQueryClientSecret obj) GHC.Base.<> (Data.Aeson..=) "queryExpand" (getPaymentIntentsIntentParametersQueryExpand obj)))

instance Data.Aeson.Types.FromJSON.FromJSON GetPaymentIntentsIntentParameters where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "GetPaymentIntentsIntentParameters" (\obj -> ((GHC.Base.pure GetPaymentIntentsIntentParameters GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "pathIntent")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryClient_secret")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryExpand"))

-- | Represents a response of the operation 'getPaymentIntentsIntent'.
--
-- The response constructor is chosen by the status code of the response. If no case matches (no specific case for the response code, no range case, no default case), 'GetPaymentIntentsIntentResponseError' is used.
data GetPaymentIntentsIntentResponse
  = -- | Means either no matching case available or a parse error
    GetPaymentIntentsIntentResponseError GHC.Base.String
  | -- | Successful response.
    GetPaymentIntentsIntentResponse200 PaymentIntent
  | -- | Error response.
    GetPaymentIntentsIntentResponseDefault Error
  deriving (GHC.Show.Show, GHC.Classes.Eq)

-- | > GET /v1/payment_intents/{intent}
--
-- The same as 'getPaymentIntentsIntent' but accepts an explicit configuration.
getPaymentIntentsIntentWithConfiguration ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | The configuration to use in the request
  StripeAPI.Common.Configuration ->
  -- | Contains all available parameters of this operation (query and path parameters)
  GetPaymentIntentsIntentParameters ->
  -- | Monadic computation which returns the result of the operation
  m (Network.HTTP.Client.Types.Response GetPaymentIntentsIntentResponse)
getPaymentIntentsIntentWithConfiguration
  config
  parameters =
    GHC.Base.fmap
      ( \response_2 ->
          GHC.Base.fmap
            ( Data.Either.either GetPaymentIntentsIntentResponseError GHC.Base.id
                GHC.Base.. ( \response body ->
                               if  | (\status_3 -> Network.HTTP.Types.Status.statusCode status_3 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) ->
                                     GetPaymentIntentsIntentResponse200
                                       Data.Functor.<$> ( Data.Aeson.eitherDecodeStrict body ::
                                                            Data.Either.Either GHC.Base.String
                                                              PaymentIntent
                                                        )
                                   | GHC.Base.const GHC.Types.True (Network.HTTP.Client.Types.responseStatus response) ->
                                     GetPaymentIntentsIntentResponseDefault
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
          (Data.Text.pack ("/v1/payment_intents/" GHC.Base.++ (Data.ByteString.Char8.unpack (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Data.ByteString.Char8.pack GHC.Base.$ StripeAPI.Common.stringifyModel (getPaymentIntentsIntentParametersPathIntent parameters))) GHC.Base.++ "")))
          [ StripeAPI.Common.QueryParameter (Data.Text.pack "client_secret") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPaymentIntentsIntentParametersQueryClientSecret parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPaymentIntentsIntentParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True
          ]
      )

-- | > GET /v1/payment_intents/{intent}
--
-- The same as 'getPaymentIntentsIntent' but returns the raw 'Data.ByteString.Char8.ByteString'.
getPaymentIntentsIntentRaw ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | Contains all available parameters of this operation (query and path parameters)
  GetPaymentIntentsIntentParameters ->
  -- | Monadic computation which returns the result of the operation
  StripeAPI.Common.StripeT m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.ByteString)
getPaymentIntentsIntentRaw parameters =
  GHC.Base.id
    ( StripeAPI.Common.doCallWithConfigurationM
        (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET")
        (Data.Text.pack ("/v1/payment_intents/" GHC.Base.++ (Data.ByteString.Char8.unpack (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Data.ByteString.Char8.pack GHC.Base.$ StripeAPI.Common.stringifyModel (getPaymentIntentsIntentParametersPathIntent parameters))) GHC.Base.++ "")))
        [ StripeAPI.Common.QueryParameter (Data.Text.pack "client_secret") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPaymentIntentsIntentParametersQueryClientSecret parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPaymentIntentsIntentParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True
        ]
    )

-- | > GET /v1/payment_intents/{intent}
--
-- The same as 'getPaymentIntentsIntent' but accepts an explicit configuration and returns the raw 'Data.ByteString.Char8.ByteString'.
getPaymentIntentsIntentWithConfigurationRaw ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | The configuration to use in the request
  StripeAPI.Common.Configuration ->
  -- | Contains all available parameters of this operation (query and path parameters)
  GetPaymentIntentsIntentParameters ->
  -- | Monadic computation which returns the result of the operation
  m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.ByteString)
getPaymentIntentsIntentWithConfigurationRaw
  config
  parameters =
    GHC.Base.id
      ( StripeAPI.Common.doCallWithConfiguration
          config
          (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET")
          (Data.Text.pack ("/v1/payment_intents/" GHC.Base.++ (Data.ByteString.Char8.unpack (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Data.ByteString.Char8.pack GHC.Base.$ StripeAPI.Common.stringifyModel (getPaymentIntentsIntentParametersPathIntent parameters))) GHC.Base.++ "")))
          [ StripeAPI.Common.QueryParameter (Data.Text.pack "client_secret") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPaymentIntentsIntentParametersQueryClientSecret parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getPaymentIntentsIntentParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True
          ]
      )
