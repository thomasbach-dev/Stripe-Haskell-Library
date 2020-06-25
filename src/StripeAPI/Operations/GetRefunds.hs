{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE OverloadedStrings #-}

-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.

-- | Contains the different functions to run the operation getRefunds
module StripeAPI.Operations.GetRefunds where

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

-- | > GET /v1/refunds
--
-- \<p>Returns a list of all refunds you’ve previously created. The refunds are returned in sorted order, with the most recent refunds appearing first. For convenience, the 10 most recent refunds are always available by default on the charge object.\<\/p>
getRefunds ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | Contains all available parameters of this operation (query and path parameters)
  GetRefundsParameters ->
  -- | Monadic computation which returns the result of the operation
  StripeAPI.Common.StripeT m (Network.HTTP.Client.Types.Response GetRefundsResponse)
getRefunds parameters =
  GHC.Base.fmap
    ( \response_0 ->
        GHC.Base.fmap
          ( Data.Either.either GetRefundsResponseError GHC.Base.id
              GHC.Base.. ( \response body ->
                             if  | (\status_1 -> Network.HTTP.Types.Status.statusCode status_1 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) ->
                                   GetRefundsResponse200
                                     Data.Functor.<$> ( Data.Aeson.eitherDecodeStrict body ::
                                                          Data.Either.Either GHC.Base.String
                                                            GetRefundsResponseBody200
                                                      )
                                 | GHC.Base.const GHC.Types.True (Network.HTTP.Client.Types.responseStatus response) ->
                                   GetRefundsResponseDefault
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
        (Data.Text.pack "/v1/refunds")
        [ StripeAPI.Common.QueryParameter (Data.Text.pack "charge") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getRefundsParametersQueryCharge parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "created") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getRefundsParametersQueryCreated parameters) (Data.Text.pack "deepObject") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "ending_before") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getRefundsParametersQueryEndingBefore parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getRefundsParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "limit") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getRefundsParametersQueryLimit parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "payment_intent") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getRefundsParametersQueryPaymentIntent parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "starting_after") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getRefundsParametersQueryStartingAfter parameters) (Data.Text.pack "form") GHC.Types.True
        ]
    )

-- | Defines the data type for the schema getRefundsParameters
data GetRefundsParameters
  = GetRefundsParameters
      { -- | queryCharge: Represents the parameter named \'charge\'
        --
        -- Only return refunds for the charge specified by this charge ID.
        getRefundsParametersQueryCharge :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
        -- | queryCreated: Represents the parameter named \'created\'
        getRefundsParametersQueryCreated :: (GHC.Maybe.Maybe GetRefundsParametersQueryCreated'Variants),
        -- | queryEnding_before: Represents the parameter named \'ending_before\'
        --
        -- A cursor for use in pagination. \`ending_before\` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with \`obj_bar\`, your subsequent call can include \`ending_before=obj_bar\` in order to fetch the previous page of the list.
        getRefundsParametersQueryEndingBefore :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
        -- | queryExpand: Represents the parameter named \'expand\'
        --
        -- Specifies which fields in the response should be expanded.
        getRefundsParametersQueryExpand :: (GHC.Maybe.Maybe ([] Data.Text.Internal.Text)),
        -- | queryLimit: Represents the parameter named \'limit\'
        --
        -- A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
        getRefundsParametersQueryLimit :: (GHC.Maybe.Maybe GHC.Types.Int),
        -- | queryPayment_intent: Represents the parameter named \'payment_intent\'
        --
        -- Only return refunds for the PaymentIntent specified by this ID.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        getRefundsParametersQueryPaymentIntent :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
        -- | queryStarting_after: Represents the parameter named \'starting_after\'
        --
        -- A cursor for use in pagination. \`starting_after\` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with \`obj_foo\`, your subsequent call can include \`starting_after=obj_foo\` in order to fetch the next page of the list.
        getRefundsParametersQueryStartingAfter :: (GHC.Maybe.Maybe Data.Text.Internal.Text)
      }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.ToJSON GetRefundsParameters where
  toJSON obj = Data.Aeson.object ((Data.Aeson..=) "queryCharge" (getRefundsParametersQueryCharge obj) : (Data.Aeson..=) "queryCreated" (getRefundsParametersQueryCreated obj) : (Data.Aeson..=) "queryEnding_before" (getRefundsParametersQueryEndingBefore obj) : (Data.Aeson..=) "queryExpand" (getRefundsParametersQueryExpand obj) : (Data.Aeson..=) "queryLimit" (getRefundsParametersQueryLimit obj) : (Data.Aeson..=) "queryPayment_intent" (getRefundsParametersQueryPaymentIntent obj) : (Data.Aeson..=) "queryStarting_after" (getRefundsParametersQueryStartingAfter obj) : [])
  toEncoding obj = Data.Aeson.pairs ((Data.Aeson..=) "queryCharge" (getRefundsParametersQueryCharge obj) GHC.Base.<> ((Data.Aeson..=) "queryCreated" (getRefundsParametersQueryCreated obj) GHC.Base.<> ((Data.Aeson..=) "queryEnding_before" (getRefundsParametersQueryEndingBefore obj) GHC.Base.<> ((Data.Aeson..=) "queryExpand" (getRefundsParametersQueryExpand obj) GHC.Base.<> ((Data.Aeson..=) "queryLimit" (getRefundsParametersQueryLimit obj) GHC.Base.<> ((Data.Aeson..=) "queryPayment_intent" (getRefundsParametersQueryPaymentIntent obj) GHC.Base.<> (Data.Aeson..=) "queryStarting_after" (getRefundsParametersQueryStartingAfter obj)))))))

instance Data.Aeson.Types.FromJSON.FromJSON GetRefundsParameters where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "GetRefundsParameters" (\obj -> ((((((GHC.Base.pure GetRefundsParameters GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryCharge")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryCreated")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryEnding_before")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryExpand")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryLimit")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryPayment_intent")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryStarting_after"))

-- | Defines the data type for the schema getRefundsParametersQueryCreated\'OneOf2
data GetRefundsParametersQueryCreated'OneOf2
  = GetRefundsParametersQueryCreated'OneOf2
      { -- | gt
        getRefundsParametersQueryCreated'OneOf2Gt :: (GHC.Maybe.Maybe GHC.Types.Int),
        -- | gte
        getRefundsParametersQueryCreated'OneOf2Gte :: (GHC.Maybe.Maybe GHC.Types.Int),
        -- | lt
        getRefundsParametersQueryCreated'OneOf2Lt :: (GHC.Maybe.Maybe GHC.Types.Int),
        -- | lte
        getRefundsParametersQueryCreated'OneOf2Lte :: (GHC.Maybe.Maybe GHC.Types.Int)
      }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.ToJSON GetRefundsParametersQueryCreated'OneOf2 where
  toJSON obj = Data.Aeson.object ((Data.Aeson..=) "gt" (getRefundsParametersQueryCreated'OneOf2Gt obj) : (Data.Aeson..=) "gte" (getRefundsParametersQueryCreated'OneOf2Gte obj) : (Data.Aeson..=) "lt" (getRefundsParametersQueryCreated'OneOf2Lt obj) : (Data.Aeson..=) "lte" (getRefundsParametersQueryCreated'OneOf2Lte obj) : [])
  toEncoding obj = Data.Aeson.pairs ((Data.Aeson..=) "gt" (getRefundsParametersQueryCreated'OneOf2Gt obj) GHC.Base.<> ((Data.Aeson..=) "gte" (getRefundsParametersQueryCreated'OneOf2Gte obj) GHC.Base.<> ((Data.Aeson..=) "lt" (getRefundsParametersQueryCreated'OneOf2Lt obj) GHC.Base.<> (Data.Aeson..=) "lte" (getRefundsParametersQueryCreated'OneOf2Lte obj))))

instance Data.Aeson.Types.FromJSON.FromJSON GetRefundsParametersQueryCreated'OneOf2 where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "GetRefundsParametersQueryCreated'OneOf2" (\obj -> (((GHC.Base.pure GetRefundsParametersQueryCreated'OneOf2 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "gt")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "gte")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "lt")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "lte"))

-- | Define the one-of schema getRefundsParametersQueryCreated\'
--
-- Represents the parameter named \'created\'
data GetRefundsParametersQueryCreated'Variants
  = GetRefundsParametersQueryCreated'Int GHC.Types.Int
  | GetRefundsParametersQueryCreated'GetRefundsParametersQueryCreated'OneOf2 GetRefundsParametersQueryCreated'OneOf2
  deriving (GHC.Show.Show, GHC.Classes.Eq, GHC.Generics.Generic)

instance Data.Aeson.ToJSON GetRefundsParametersQueryCreated'Variants where
  toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions {Data.Aeson.Types.Internal.sumEncoding = Data.Aeson.Types.Internal.UntaggedValue}

instance Data.Aeson.FromJSON GetRefundsParametersQueryCreated'Variants where
  parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions {Data.Aeson.Types.Internal.sumEncoding = Data.Aeson.Types.Internal.UntaggedValue}

-- | Represents a response of the operation 'getRefunds'.
--
-- The response constructor is chosen by the status code of the response. If no case matches (no specific case for the response code, no range case, no default case), 'GetRefundsResponseError' is used.
data GetRefundsResponse
  = -- | Means either no matching case available or a parse error
    GetRefundsResponseError GHC.Base.String
  | -- | Successful response.
    GetRefundsResponse200 GetRefundsResponseBody200
  | -- | Error response.
    GetRefundsResponseDefault Error
  deriving (GHC.Show.Show, GHC.Classes.Eq)

-- | Defines the data type for the schema GetRefundsResponseBody200
data GetRefundsResponseBody200
  = GetRefundsResponseBody200
      { -- | data
        getRefundsResponseBody200Data :: ([] Refund),
        -- | has_more: True if this list has another page of items after this one that can be fetched.
        getRefundsResponseBody200HasMore :: GHC.Types.Bool,
        -- | object: String representing the object\'s type. Objects of the same type share the same value. Always has the value \`list\`.
        getRefundsResponseBody200Object :: GetRefundsResponseBody200Object',
        -- | url: The URL where this list can be accessed.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        -- * Must match pattern \'^\/v1\/refunds\'
        getRefundsResponseBody200Url :: Data.Text.Internal.Text
      }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.ToJSON GetRefundsResponseBody200 where
  toJSON obj = Data.Aeson.object ((Data.Aeson..=) "data" (getRefundsResponseBody200Data obj) : (Data.Aeson..=) "has_more" (getRefundsResponseBody200HasMore obj) : (Data.Aeson..=) "object" (getRefundsResponseBody200Object obj) : (Data.Aeson..=) "url" (getRefundsResponseBody200Url obj) : [])
  toEncoding obj = Data.Aeson.pairs ((Data.Aeson..=) "data" (getRefundsResponseBody200Data obj) GHC.Base.<> ((Data.Aeson..=) "has_more" (getRefundsResponseBody200HasMore obj) GHC.Base.<> ((Data.Aeson..=) "object" (getRefundsResponseBody200Object obj) GHC.Base.<> (Data.Aeson..=) "url" (getRefundsResponseBody200Url obj))))

instance Data.Aeson.Types.FromJSON.FromJSON GetRefundsResponseBody200 where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "GetRefundsResponseBody200" (\obj -> (((GHC.Base.pure GetRefundsResponseBody200 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "data")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "has_more")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "object")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "url"))

-- | Defines the enum schema GetRefundsResponseBody200Object\'
--
-- String representing the object\'s type. Objects of the same type share the same value. Always has the value \`list\`.
data GetRefundsResponseBody200Object'
  = GetRefundsResponseBody200Object'EnumOther Data.Aeson.Types.Internal.Value
  | GetRefundsResponseBody200Object'EnumTyped Data.Text.Internal.Text
  | GetRefundsResponseBody200Object'EnumStringList
  deriving (GHC.Show.Show, GHC.Classes.Eq)

instance Data.Aeson.ToJSON GetRefundsResponseBody200Object' where
  toJSON (GetRefundsResponseBody200Object'EnumOther patternName) = Data.Aeson.Types.ToJSON.toJSON patternName
  toJSON (GetRefundsResponseBody200Object'EnumTyped patternName) = Data.Aeson.Types.ToJSON.toJSON patternName
  toJSON (GetRefundsResponseBody200Object'EnumStringList) = Data.Aeson.Types.Internal.String GHC.Base.$ Data.Text.pack "list"

instance Data.Aeson.FromJSON GetRefundsResponseBody200Object' where
  parseJSON val =
    GHC.Base.pure
      ( if val GHC.Classes.== (Data.Aeson.Types.Internal.String GHC.Base.$ Data.Text.pack "list")
          then GetRefundsResponseBody200Object'EnumStringList
          else GetRefundsResponseBody200Object'EnumOther val
      )

-- | > GET /v1/refunds
--
-- The same as 'getRefunds' but accepts an explicit configuration.
getRefundsWithConfiguration ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | The configuration to use in the request
  StripeAPI.Common.Configuration ->
  -- | Contains all available parameters of this operation (query and path parameters)
  GetRefundsParameters ->
  -- | Monadic computation which returns the result of the operation
  m (Network.HTTP.Client.Types.Response GetRefundsResponse)
getRefundsWithConfiguration
  config
  parameters =
    GHC.Base.fmap
      ( \response_2 ->
          GHC.Base.fmap
            ( Data.Either.either GetRefundsResponseError GHC.Base.id
                GHC.Base.. ( \response body ->
                               if  | (\status_3 -> Network.HTTP.Types.Status.statusCode status_3 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) ->
                                     GetRefundsResponse200
                                       Data.Functor.<$> ( Data.Aeson.eitherDecodeStrict body ::
                                                            Data.Either.Either GHC.Base.String
                                                              GetRefundsResponseBody200
                                                        )
                                   | GHC.Base.const GHC.Types.True (Network.HTTP.Client.Types.responseStatus response) ->
                                     GetRefundsResponseDefault
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
          (Data.Text.pack "/v1/refunds")
          [ StripeAPI.Common.QueryParameter (Data.Text.pack "charge") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getRefundsParametersQueryCharge parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "created") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getRefundsParametersQueryCreated parameters) (Data.Text.pack "deepObject") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "ending_before") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getRefundsParametersQueryEndingBefore parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getRefundsParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "limit") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getRefundsParametersQueryLimit parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "payment_intent") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getRefundsParametersQueryPaymentIntent parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "starting_after") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getRefundsParametersQueryStartingAfter parameters) (Data.Text.pack "form") GHC.Types.True
          ]
      )

-- | > GET /v1/refunds
--
-- The same as 'getRefunds' but returns the raw 'Data.ByteString.Char8.ByteString'.
getRefundsRaw ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | Contains all available parameters of this operation (query and path parameters)
  GetRefundsParameters ->
  -- | Monadic computation which returns the result of the operation
  StripeAPI.Common.StripeT m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.ByteString)
getRefundsRaw parameters =
  GHC.Base.id
    ( StripeAPI.Common.doCallWithConfigurationM
        (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET")
        (Data.Text.pack "/v1/refunds")
        [ StripeAPI.Common.QueryParameter (Data.Text.pack "charge") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getRefundsParametersQueryCharge parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "created") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getRefundsParametersQueryCreated parameters) (Data.Text.pack "deepObject") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "ending_before") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getRefundsParametersQueryEndingBefore parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getRefundsParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "limit") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getRefundsParametersQueryLimit parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "payment_intent") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getRefundsParametersQueryPaymentIntent parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "starting_after") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getRefundsParametersQueryStartingAfter parameters) (Data.Text.pack "form") GHC.Types.True
        ]
    )

-- | > GET /v1/refunds
--
-- The same as 'getRefunds' but accepts an explicit configuration and returns the raw 'Data.ByteString.Char8.ByteString'.
getRefundsWithConfigurationRaw ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | The configuration to use in the request
  StripeAPI.Common.Configuration ->
  -- | Contains all available parameters of this operation (query and path parameters)
  GetRefundsParameters ->
  -- | Monadic computation which returns the result of the operation
  m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.ByteString)
getRefundsWithConfigurationRaw
  config
  parameters =
    GHC.Base.id
      ( StripeAPI.Common.doCallWithConfiguration
          config
          (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET")
          (Data.Text.pack "/v1/refunds")
          [ StripeAPI.Common.QueryParameter (Data.Text.pack "charge") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getRefundsParametersQueryCharge parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "created") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getRefundsParametersQueryCreated parameters) (Data.Text.pack "deepObject") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "ending_before") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getRefundsParametersQueryEndingBefore parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getRefundsParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "limit") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getRefundsParametersQueryLimit parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "payment_intent") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getRefundsParametersQueryPaymentIntent parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "starting_after") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getRefundsParametersQueryStartingAfter parameters) (Data.Text.pack "form") GHC.Types.True
          ]
      )
