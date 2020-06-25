{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE OverloadedStrings #-}

-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.

-- | Contains the different functions to run the operation postCouponsCoupon
module StripeAPI.Operations.PostCouponsCoupon where

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

-- | > POST /v1/coupons/{coupon}
--
-- \<p>Updates the metadata of a coupon. Other coupon details (currency, duration, amount_off) are, by design, not editable.\<\/p>
postCouponsCoupon ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | coupon | Constraints: Maximum length of 5000
  Data.Text.Internal.Text ->
  -- | The request body to send
  GHC.Maybe.Maybe PostCouponsCouponRequestBody ->
  -- | Monadic computation which returns the result of the operation
  StripeAPI.Common.StripeT m (Network.HTTP.Client.Types.Response PostCouponsCouponResponse)
postCouponsCoupon
  coupon
  body =
    GHC.Base.fmap
      ( \response_0 ->
          GHC.Base.fmap
            ( Data.Either.either PostCouponsCouponResponseError GHC.Base.id
                GHC.Base.. ( \response body ->
                               if  | (\status_1 -> Network.HTTP.Types.Status.statusCode status_1 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) ->
                                     PostCouponsCouponResponse200
                                       Data.Functor.<$> ( Data.Aeson.eitherDecodeStrict body ::
                                                            Data.Either.Either GHC.Base.String
                                                              Coupon
                                                        )
                                   | GHC.Base.const GHC.Types.True (Network.HTTP.Client.Types.responseStatus response) ->
                                     PostCouponsCouponResponseDefault
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
      (StripeAPI.Common.doBodyCallWithConfigurationM (Data.Text.toUpper GHC.Base.$ Data.Text.pack "POST") (Data.Text.pack ("/v1/coupons/" GHC.Base.++ (Data.ByteString.Char8.unpack (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Data.ByteString.Char8.pack GHC.Base.$ StripeAPI.Common.stringifyModel coupon)) GHC.Base.++ ""))) [] body StripeAPI.Common.RequestBodyEncodingFormData)

-- | Defines the data type for the schema postCouponsCouponRequestBody
data PostCouponsCouponRequestBody
  = PostCouponsCouponRequestBody
      { -- | expand: Specifies which fields in the response should be expanded.
        postCouponsCouponRequestBodyExpand :: (GHC.Maybe.Maybe ([] Data.Text.Internal.Text)),
        -- | metadata: Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to \`metadata\`.
        postCouponsCouponRequestBodyMetadata :: (GHC.Maybe.Maybe Data.Aeson.Types.Internal.Object),
        -- | name: Name of the coupon displayed to customers on, for instance invoices, or receipts. By default the \`id\` is shown if \`name\` is not set.
        --
        -- Constraints:
        --
        -- * Maximum length of 40
        postCouponsCouponRequestBodyName :: (GHC.Maybe.Maybe Data.Text.Internal.Text)
      }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.ToJSON PostCouponsCouponRequestBody where
  toJSON obj = Data.Aeson.object ((Data.Aeson..=) "expand" (postCouponsCouponRequestBodyExpand obj) : (Data.Aeson..=) "metadata" (postCouponsCouponRequestBodyMetadata obj) : (Data.Aeson..=) "name" (postCouponsCouponRequestBodyName obj) : [])
  toEncoding obj = Data.Aeson.pairs ((Data.Aeson..=) "expand" (postCouponsCouponRequestBodyExpand obj) GHC.Base.<> ((Data.Aeson..=) "metadata" (postCouponsCouponRequestBodyMetadata obj) GHC.Base.<> (Data.Aeson..=) "name" (postCouponsCouponRequestBodyName obj)))

instance Data.Aeson.Types.FromJSON.FromJSON PostCouponsCouponRequestBody where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "PostCouponsCouponRequestBody" (\obj -> ((GHC.Base.pure PostCouponsCouponRequestBody GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "expand")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "metadata")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "name"))

-- | Represents a response of the operation 'postCouponsCoupon'.
--
-- The response constructor is chosen by the status code of the response. If no case matches (no specific case for the response code, no range case, no default case), 'PostCouponsCouponResponseError' is used.
data PostCouponsCouponResponse
  = -- | Means either no matching case available or a parse error
    PostCouponsCouponResponseError GHC.Base.String
  | -- | Successful response.
    PostCouponsCouponResponse200 Coupon
  | -- | Error response.
    PostCouponsCouponResponseDefault Error
  deriving (GHC.Show.Show, GHC.Classes.Eq)

-- | > POST /v1/coupons/{coupon}
--
-- The same as 'postCouponsCoupon' but accepts an explicit configuration.
postCouponsCouponWithConfiguration ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | The configuration to use in the request
  StripeAPI.Common.Configuration ->
  -- | coupon | Constraints: Maximum length of 5000
  Data.Text.Internal.Text ->
  -- | The request body to send
  GHC.Maybe.Maybe PostCouponsCouponRequestBody ->
  -- | Monadic computation which returns the result of the operation
  m (Network.HTTP.Client.Types.Response PostCouponsCouponResponse)
postCouponsCouponWithConfiguration
  config
  coupon
  body =
    GHC.Base.fmap
      ( \response_2 ->
          GHC.Base.fmap
            ( Data.Either.either PostCouponsCouponResponseError GHC.Base.id
                GHC.Base.. ( \response body ->
                               if  | (\status_3 -> Network.HTTP.Types.Status.statusCode status_3 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) ->
                                     PostCouponsCouponResponse200
                                       Data.Functor.<$> ( Data.Aeson.eitherDecodeStrict body ::
                                                            Data.Either.Either GHC.Base.String
                                                              Coupon
                                                        )
                                   | GHC.Base.const GHC.Types.True (Network.HTTP.Client.Types.responseStatus response) ->
                                     PostCouponsCouponResponseDefault
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
      (StripeAPI.Common.doBodyCallWithConfiguration config (Data.Text.toUpper GHC.Base.$ Data.Text.pack "POST") (Data.Text.pack ("/v1/coupons/" GHC.Base.++ (Data.ByteString.Char8.unpack (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Data.ByteString.Char8.pack GHC.Base.$ StripeAPI.Common.stringifyModel coupon)) GHC.Base.++ ""))) [] body StripeAPI.Common.RequestBodyEncodingFormData)

-- | > POST /v1/coupons/{coupon}
--
-- The same as 'postCouponsCoupon' but returns the raw 'Data.ByteString.Char8.ByteString'.
postCouponsCouponRaw ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | coupon | Constraints: Maximum length of 5000
  Data.Text.Internal.Text ->
  -- | The request body to send
  GHC.Maybe.Maybe PostCouponsCouponRequestBody ->
  -- | Monadic computation which returns the result of the operation
  StripeAPI.Common.StripeT m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.ByteString)
postCouponsCouponRaw
  coupon
  body = GHC.Base.id (StripeAPI.Common.doBodyCallWithConfigurationM (Data.Text.toUpper GHC.Base.$ Data.Text.pack "POST") (Data.Text.pack ("/v1/coupons/" GHC.Base.++ (Data.ByteString.Char8.unpack (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Data.ByteString.Char8.pack GHC.Base.$ StripeAPI.Common.stringifyModel coupon)) GHC.Base.++ ""))) [] body StripeAPI.Common.RequestBodyEncodingFormData)

-- | > POST /v1/coupons/{coupon}
--
-- The same as 'postCouponsCoupon' but accepts an explicit configuration and returns the raw 'Data.ByteString.Char8.ByteString'.
postCouponsCouponWithConfigurationRaw ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | The configuration to use in the request
  StripeAPI.Common.Configuration ->
  -- | coupon | Constraints: Maximum length of 5000
  Data.Text.Internal.Text ->
  -- | The request body to send
  GHC.Maybe.Maybe PostCouponsCouponRequestBody ->
  -- | Monadic computation which returns the result of the operation
  m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.ByteString)
postCouponsCouponWithConfigurationRaw
  config
  coupon
  body = GHC.Base.id (StripeAPI.Common.doBodyCallWithConfiguration config (Data.Text.toUpper GHC.Base.$ Data.Text.pack "POST") (Data.Text.pack ("/v1/coupons/" GHC.Base.++ (Data.ByteString.Char8.unpack (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Data.ByteString.Char8.pack GHC.Base.$ StripeAPI.Common.stringifyModel coupon)) GHC.Base.++ ""))) [] body StripeAPI.Common.RequestBodyEncodingFormData)
