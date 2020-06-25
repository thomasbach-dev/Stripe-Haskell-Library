{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE OverloadedStrings #-}

-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.

-- | Contains the different functions to run the operation getCheckoutSessions
module StripeAPI.Operations.GetCheckoutSessions where

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

-- | > GET /v1/checkout/sessions
--
-- \<p>Returns a list of Checkout Sessions.\<\/p>
getCheckoutSessions ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | Contains all available parameters of this operation (query and path parameters)
  GetCheckoutSessionsParameters ->
  -- | Monadic computation which returns the result of the operation
  StripeAPI.Common.StripeT m (Network.HTTP.Client.Types.Response GetCheckoutSessionsResponse)
getCheckoutSessions parameters =
  GHC.Base.fmap
    ( \response_0 ->
        GHC.Base.fmap
          ( Data.Either.either GetCheckoutSessionsResponseError GHC.Base.id
              GHC.Base.. ( \response body ->
                             if  | (\status_1 -> Network.HTTP.Types.Status.statusCode status_1 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) ->
                                   GetCheckoutSessionsResponse200
                                     Data.Functor.<$> ( Data.Aeson.eitherDecodeStrict body ::
                                                          Data.Either.Either GHC.Base.String
                                                            GetCheckoutSessionsResponseBody200
                                                      )
                                 | GHC.Base.const GHC.Types.True (Network.HTTP.Client.Types.responseStatus response) ->
                                   GetCheckoutSessionsResponseDefault
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
        (Data.Text.pack "/v1/checkout/sessions")
        [ StripeAPI.Common.QueryParameter (Data.Text.pack "ending_before") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCheckoutSessionsParametersQueryEndingBefore parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCheckoutSessionsParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "limit") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCheckoutSessionsParametersQueryLimit parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "payment_intent") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCheckoutSessionsParametersQueryPaymentIntent parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "starting_after") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCheckoutSessionsParametersQueryStartingAfter parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "subscription") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCheckoutSessionsParametersQuerySubscription parameters) (Data.Text.pack "form") GHC.Types.True
        ]
    )

-- | Defines the data type for the schema getCheckoutSessionsParameters
data GetCheckoutSessionsParameters
  = GetCheckoutSessionsParameters
      { -- | queryEnding_before: Represents the parameter named \'ending_before\'
        --
        -- A cursor for use in pagination. \`ending_before\` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with \`obj_bar\`, your subsequent call can include \`ending_before=obj_bar\` in order to fetch the previous page of the list.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        getCheckoutSessionsParametersQueryEndingBefore :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
        -- | queryExpand: Represents the parameter named \'expand\'
        --
        -- Specifies which fields in the response should be expanded.
        getCheckoutSessionsParametersQueryExpand :: (GHC.Maybe.Maybe ([] Data.Text.Internal.Text)),
        -- | queryLimit: Represents the parameter named \'limit\'
        --
        -- A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
        getCheckoutSessionsParametersQueryLimit :: (GHC.Maybe.Maybe GHC.Types.Int),
        -- | queryPayment_intent: Represents the parameter named \'payment_intent\'
        --
        -- Only return the Checkout Session for the PaymentIntent specified.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        getCheckoutSessionsParametersQueryPaymentIntent :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
        -- | queryStarting_after: Represents the parameter named \'starting_after\'
        --
        -- A cursor for use in pagination. \`starting_after\` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with \`obj_foo\`, your subsequent call can include \`starting_after=obj_foo\` in order to fetch the next page of the list.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        getCheckoutSessionsParametersQueryStartingAfter :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
        -- | querySubscription: Represents the parameter named \'subscription\'
        --
        -- Only return the Checkout Session for the subscription specified.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        getCheckoutSessionsParametersQuerySubscription :: (GHC.Maybe.Maybe Data.Text.Internal.Text)
      }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.ToJSON GetCheckoutSessionsParameters where
  toJSON obj = Data.Aeson.object ((Data.Aeson..=) "queryEnding_before" (getCheckoutSessionsParametersQueryEndingBefore obj) : (Data.Aeson..=) "queryExpand" (getCheckoutSessionsParametersQueryExpand obj) : (Data.Aeson..=) "queryLimit" (getCheckoutSessionsParametersQueryLimit obj) : (Data.Aeson..=) "queryPayment_intent" (getCheckoutSessionsParametersQueryPaymentIntent obj) : (Data.Aeson..=) "queryStarting_after" (getCheckoutSessionsParametersQueryStartingAfter obj) : (Data.Aeson..=) "querySubscription" (getCheckoutSessionsParametersQuerySubscription obj) : [])
  toEncoding obj = Data.Aeson.pairs ((Data.Aeson..=) "queryEnding_before" (getCheckoutSessionsParametersQueryEndingBefore obj) GHC.Base.<> ((Data.Aeson..=) "queryExpand" (getCheckoutSessionsParametersQueryExpand obj) GHC.Base.<> ((Data.Aeson..=) "queryLimit" (getCheckoutSessionsParametersQueryLimit obj) GHC.Base.<> ((Data.Aeson..=) "queryPayment_intent" (getCheckoutSessionsParametersQueryPaymentIntent obj) GHC.Base.<> ((Data.Aeson..=) "queryStarting_after" (getCheckoutSessionsParametersQueryStartingAfter obj) GHC.Base.<> (Data.Aeson..=) "querySubscription" (getCheckoutSessionsParametersQuerySubscription obj))))))

instance Data.Aeson.Types.FromJSON.FromJSON GetCheckoutSessionsParameters where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "GetCheckoutSessionsParameters" (\obj -> (((((GHC.Base.pure GetCheckoutSessionsParameters GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryEnding_before")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryExpand")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryLimit")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryPayment_intent")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryStarting_after")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "querySubscription"))

-- | Represents a response of the operation 'getCheckoutSessions'.
--
-- The response constructor is chosen by the status code of the response. If no case matches (no specific case for the response code, no range case, no default case), 'GetCheckoutSessionsResponseError' is used.
data GetCheckoutSessionsResponse
  = -- | Means either no matching case available or a parse error
    GetCheckoutSessionsResponseError GHC.Base.String
  | -- | Successful response.
    GetCheckoutSessionsResponse200 GetCheckoutSessionsResponseBody200
  | -- | Error response.
    GetCheckoutSessionsResponseDefault Error
  deriving (GHC.Show.Show, GHC.Classes.Eq)

-- | Defines the data type for the schema GetCheckoutSessionsResponseBody200
data GetCheckoutSessionsResponseBody200
  = GetCheckoutSessionsResponseBody200
      { -- | data
        getCheckoutSessionsResponseBody200Data :: ([] Checkout'session),
        -- | has_more: True if this list has another page of items after this one that can be fetched.
        getCheckoutSessionsResponseBody200HasMore :: GHC.Types.Bool,
        -- | object: String representing the object\'s type. Objects of the same type share the same value. Always has the value \`list\`.
        getCheckoutSessionsResponseBody200Object :: GetCheckoutSessionsResponseBody200Object',
        -- | url: The URL where this list can be accessed.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        getCheckoutSessionsResponseBody200Url :: Data.Text.Internal.Text
      }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.ToJSON GetCheckoutSessionsResponseBody200 where
  toJSON obj = Data.Aeson.object ((Data.Aeson..=) "data" (getCheckoutSessionsResponseBody200Data obj) : (Data.Aeson..=) "has_more" (getCheckoutSessionsResponseBody200HasMore obj) : (Data.Aeson..=) "object" (getCheckoutSessionsResponseBody200Object obj) : (Data.Aeson..=) "url" (getCheckoutSessionsResponseBody200Url obj) : [])
  toEncoding obj = Data.Aeson.pairs ((Data.Aeson..=) "data" (getCheckoutSessionsResponseBody200Data obj) GHC.Base.<> ((Data.Aeson..=) "has_more" (getCheckoutSessionsResponseBody200HasMore obj) GHC.Base.<> ((Data.Aeson..=) "object" (getCheckoutSessionsResponseBody200Object obj) GHC.Base.<> (Data.Aeson..=) "url" (getCheckoutSessionsResponseBody200Url obj))))

instance Data.Aeson.Types.FromJSON.FromJSON GetCheckoutSessionsResponseBody200 where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "GetCheckoutSessionsResponseBody200" (\obj -> (((GHC.Base.pure GetCheckoutSessionsResponseBody200 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "data")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "has_more")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "object")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "url"))

-- | Defines the enum schema GetCheckoutSessionsResponseBody200Object\'
--
-- String representing the object\'s type. Objects of the same type share the same value. Always has the value \`list\`.
data GetCheckoutSessionsResponseBody200Object'
  = GetCheckoutSessionsResponseBody200Object'EnumOther Data.Aeson.Types.Internal.Value
  | GetCheckoutSessionsResponseBody200Object'EnumTyped Data.Text.Internal.Text
  | GetCheckoutSessionsResponseBody200Object'EnumStringList
  deriving (GHC.Show.Show, GHC.Classes.Eq)

instance Data.Aeson.ToJSON GetCheckoutSessionsResponseBody200Object' where
  toJSON (GetCheckoutSessionsResponseBody200Object'EnumOther patternName) = Data.Aeson.Types.ToJSON.toJSON patternName
  toJSON (GetCheckoutSessionsResponseBody200Object'EnumTyped patternName) = Data.Aeson.Types.ToJSON.toJSON patternName
  toJSON (GetCheckoutSessionsResponseBody200Object'EnumStringList) = Data.Aeson.Types.Internal.String GHC.Base.$ Data.Text.pack "list"

instance Data.Aeson.FromJSON GetCheckoutSessionsResponseBody200Object' where
  parseJSON val =
    GHC.Base.pure
      ( if val GHC.Classes.== (Data.Aeson.Types.Internal.String GHC.Base.$ Data.Text.pack "list")
          then GetCheckoutSessionsResponseBody200Object'EnumStringList
          else GetCheckoutSessionsResponseBody200Object'EnumOther val
      )

-- | > GET /v1/checkout/sessions
--
-- The same as 'getCheckoutSessions' but accepts an explicit configuration.
getCheckoutSessionsWithConfiguration ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | The configuration to use in the request
  StripeAPI.Common.Configuration ->
  -- | Contains all available parameters of this operation (query and path parameters)
  GetCheckoutSessionsParameters ->
  -- | Monadic computation which returns the result of the operation
  m (Network.HTTP.Client.Types.Response GetCheckoutSessionsResponse)
getCheckoutSessionsWithConfiguration
  config
  parameters =
    GHC.Base.fmap
      ( \response_2 ->
          GHC.Base.fmap
            ( Data.Either.either GetCheckoutSessionsResponseError GHC.Base.id
                GHC.Base.. ( \response body ->
                               if  | (\status_3 -> Network.HTTP.Types.Status.statusCode status_3 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) ->
                                     GetCheckoutSessionsResponse200
                                       Data.Functor.<$> ( Data.Aeson.eitherDecodeStrict body ::
                                                            Data.Either.Either GHC.Base.String
                                                              GetCheckoutSessionsResponseBody200
                                                        )
                                   | GHC.Base.const GHC.Types.True (Network.HTTP.Client.Types.responseStatus response) ->
                                     GetCheckoutSessionsResponseDefault
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
          (Data.Text.pack "/v1/checkout/sessions")
          [ StripeAPI.Common.QueryParameter (Data.Text.pack "ending_before") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCheckoutSessionsParametersQueryEndingBefore parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCheckoutSessionsParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "limit") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCheckoutSessionsParametersQueryLimit parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "payment_intent") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCheckoutSessionsParametersQueryPaymentIntent parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "starting_after") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCheckoutSessionsParametersQueryStartingAfter parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "subscription") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCheckoutSessionsParametersQuerySubscription parameters) (Data.Text.pack "form") GHC.Types.True
          ]
      )

-- | > GET /v1/checkout/sessions
--
-- The same as 'getCheckoutSessions' but returns the raw 'Data.ByteString.Char8.ByteString'.
getCheckoutSessionsRaw ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | Contains all available parameters of this operation (query and path parameters)
  GetCheckoutSessionsParameters ->
  -- | Monadic computation which returns the result of the operation
  StripeAPI.Common.StripeT m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.ByteString)
getCheckoutSessionsRaw parameters =
  GHC.Base.id
    ( StripeAPI.Common.doCallWithConfigurationM
        (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET")
        (Data.Text.pack "/v1/checkout/sessions")
        [ StripeAPI.Common.QueryParameter (Data.Text.pack "ending_before") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCheckoutSessionsParametersQueryEndingBefore parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCheckoutSessionsParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "limit") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCheckoutSessionsParametersQueryLimit parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "payment_intent") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCheckoutSessionsParametersQueryPaymentIntent parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "starting_after") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCheckoutSessionsParametersQueryStartingAfter parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "subscription") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCheckoutSessionsParametersQuerySubscription parameters) (Data.Text.pack "form") GHC.Types.True
        ]
    )

-- | > GET /v1/checkout/sessions
--
-- The same as 'getCheckoutSessions' but accepts an explicit configuration and returns the raw 'Data.ByteString.Char8.ByteString'.
getCheckoutSessionsWithConfigurationRaw ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | The configuration to use in the request
  StripeAPI.Common.Configuration ->
  -- | Contains all available parameters of this operation (query and path parameters)
  GetCheckoutSessionsParameters ->
  -- | Monadic computation which returns the result of the operation
  m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.ByteString)
getCheckoutSessionsWithConfigurationRaw
  config
  parameters =
    GHC.Base.id
      ( StripeAPI.Common.doCallWithConfiguration
          config
          (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET")
          (Data.Text.pack "/v1/checkout/sessions")
          [ StripeAPI.Common.QueryParameter (Data.Text.pack "ending_before") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCheckoutSessionsParametersQueryEndingBefore parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCheckoutSessionsParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "limit") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCheckoutSessionsParametersQueryLimit parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "payment_intent") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCheckoutSessionsParametersQueryPaymentIntent parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "starting_after") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCheckoutSessionsParametersQueryStartingAfter parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "subscription") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCheckoutSessionsParametersQuerySubscription parameters) (Data.Text.pack "form") GHC.Types.True
          ]
      )
