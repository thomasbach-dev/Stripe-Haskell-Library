{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE OverloadedStrings #-}

-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.

-- | Contains the different functions to run the operation getIssuingCardsCardDetails
module StripeAPI.Operations.GetIssuingCardsCardDetails where

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

-- | > GET /v1/issuing/cards/{card}/details
--
-- \<p>For virtual cards only. Retrieves an Issuing \<code>card_details\<\/code> object that contains \<a href=\"\/docs\/issuing\/cards\/management\#virtual-card-info\">the sensitive details\<\/a> of a virtual card.\<\/p>
getIssuingCardsCardDetails ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | Contains all available parameters of this operation (query and path parameters)
  GetIssuingCardsCardDetailsParameters ->
  -- | Monadic computation which returns the result of the operation
  StripeAPI.Common.StripeT m (Network.HTTP.Client.Types.Response GetIssuingCardsCardDetailsResponse)
getIssuingCardsCardDetails parameters =
  GHC.Base.fmap
    ( \response_0 ->
        GHC.Base.fmap
          ( Data.Either.either GetIssuingCardsCardDetailsResponseError GHC.Base.id
              GHC.Base.. ( \response body ->
                             if  | (\status_1 -> Network.HTTP.Types.Status.statusCode status_1 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) ->
                                   GetIssuingCardsCardDetailsResponse200
                                     Data.Functor.<$> ( Data.Aeson.eitherDecodeStrict body ::
                                                          Data.Either.Either GHC.Base.String
                                                            Issuing'cardDetails
                                                      )
                                 | GHC.Base.const GHC.Types.True (Network.HTTP.Client.Types.responseStatus response) ->
                                   GetIssuingCardsCardDetailsResponseDefault
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
    (StripeAPI.Common.doCallWithConfigurationM (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET") (Data.Text.pack ("/v1/issuing/cards/" GHC.Base.++ (Data.ByteString.Char8.unpack (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Data.ByteString.Char8.pack GHC.Base.$ StripeAPI.Common.stringifyModel (getIssuingCardsCardDetailsParametersPathCard parameters))) GHC.Base.++ "/details"))) [StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getIssuingCardsCardDetailsParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True])

-- | Defines the data type for the schema getIssuingCardsCardDetailsParameters
data GetIssuingCardsCardDetailsParameters
  = GetIssuingCardsCardDetailsParameters
      { -- | pathCard: Represents the parameter named \'card\'
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        getIssuingCardsCardDetailsParametersPathCard :: Data.Text.Internal.Text,
        -- | queryExpand: Represents the parameter named \'expand\'
        --
        -- Specifies which fields in the response should be expanded.
        getIssuingCardsCardDetailsParametersQueryExpand :: (GHC.Maybe.Maybe ([] Data.Text.Internal.Text))
      }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.ToJSON GetIssuingCardsCardDetailsParameters where
  toJSON obj = Data.Aeson.object ((Data.Aeson..=) "pathCard" (getIssuingCardsCardDetailsParametersPathCard obj) : (Data.Aeson..=) "queryExpand" (getIssuingCardsCardDetailsParametersQueryExpand obj) : [])
  toEncoding obj = Data.Aeson.pairs ((Data.Aeson..=) "pathCard" (getIssuingCardsCardDetailsParametersPathCard obj) GHC.Base.<> (Data.Aeson..=) "queryExpand" (getIssuingCardsCardDetailsParametersQueryExpand obj))

instance Data.Aeson.Types.FromJSON.FromJSON GetIssuingCardsCardDetailsParameters where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "GetIssuingCardsCardDetailsParameters" (\obj -> (GHC.Base.pure GetIssuingCardsCardDetailsParameters GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "pathCard")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryExpand"))

-- | Represents a response of the operation 'getIssuingCardsCardDetails'.
--
-- The response constructor is chosen by the status code of the response. If no case matches (no specific case for the response code, no range case, no default case), 'GetIssuingCardsCardDetailsResponseError' is used.
data GetIssuingCardsCardDetailsResponse
  = -- | Means either no matching case available or a parse error
    GetIssuingCardsCardDetailsResponseError GHC.Base.String
  | -- | Successful response.
    GetIssuingCardsCardDetailsResponse200 Issuing'cardDetails
  | -- | Error response.
    GetIssuingCardsCardDetailsResponseDefault Error
  deriving (GHC.Show.Show, GHC.Classes.Eq)

-- | > GET /v1/issuing/cards/{card}/details
--
-- The same as 'getIssuingCardsCardDetails' but accepts an explicit configuration.
getIssuingCardsCardDetailsWithConfiguration ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | The configuration to use in the request
  StripeAPI.Common.Configuration ->
  -- | Contains all available parameters of this operation (query and path parameters)
  GetIssuingCardsCardDetailsParameters ->
  -- | Monadic computation which returns the result of the operation
  m (Network.HTTP.Client.Types.Response GetIssuingCardsCardDetailsResponse)
getIssuingCardsCardDetailsWithConfiguration
  config
  parameters =
    GHC.Base.fmap
      ( \response_2 ->
          GHC.Base.fmap
            ( Data.Either.either GetIssuingCardsCardDetailsResponseError GHC.Base.id
                GHC.Base.. ( \response body ->
                               if  | (\status_3 -> Network.HTTP.Types.Status.statusCode status_3 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) ->
                                     GetIssuingCardsCardDetailsResponse200
                                       Data.Functor.<$> ( Data.Aeson.eitherDecodeStrict body ::
                                                            Data.Either.Either GHC.Base.String
                                                              Issuing'cardDetails
                                                        )
                                   | GHC.Base.const GHC.Types.True (Network.HTTP.Client.Types.responseStatus response) ->
                                     GetIssuingCardsCardDetailsResponseDefault
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
      (StripeAPI.Common.doCallWithConfiguration config (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET") (Data.Text.pack ("/v1/issuing/cards/" GHC.Base.++ (Data.ByteString.Char8.unpack (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Data.ByteString.Char8.pack GHC.Base.$ StripeAPI.Common.stringifyModel (getIssuingCardsCardDetailsParametersPathCard parameters))) GHC.Base.++ "/details"))) [StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getIssuingCardsCardDetailsParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True])

-- | > GET /v1/issuing/cards/{card}/details
--
-- The same as 'getIssuingCardsCardDetails' but returns the raw 'Data.ByteString.Char8.ByteString'.
getIssuingCardsCardDetailsRaw ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | Contains all available parameters of this operation (query and path parameters)
  GetIssuingCardsCardDetailsParameters ->
  -- | Monadic computation which returns the result of the operation
  StripeAPI.Common.StripeT m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.ByteString)
getIssuingCardsCardDetailsRaw parameters = GHC.Base.id (StripeAPI.Common.doCallWithConfigurationM (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET") (Data.Text.pack ("/v1/issuing/cards/" GHC.Base.++ (Data.ByteString.Char8.unpack (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Data.ByteString.Char8.pack GHC.Base.$ StripeAPI.Common.stringifyModel (getIssuingCardsCardDetailsParametersPathCard parameters))) GHC.Base.++ "/details"))) [StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getIssuingCardsCardDetailsParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True])

-- | > GET /v1/issuing/cards/{card}/details
--
-- The same as 'getIssuingCardsCardDetails' but accepts an explicit configuration and returns the raw 'Data.ByteString.Char8.ByteString'.
getIssuingCardsCardDetailsWithConfigurationRaw ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | The configuration to use in the request
  StripeAPI.Common.Configuration ->
  -- | Contains all available parameters of this operation (query and path parameters)
  GetIssuingCardsCardDetailsParameters ->
  -- | Monadic computation which returns the result of the operation
  m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.ByteString)
getIssuingCardsCardDetailsWithConfigurationRaw
  config
  parameters = GHC.Base.id (StripeAPI.Common.doCallWithConfiguration config (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET") (Data.Text.pack ("/v1/issuing/cards/" GHC.Base.++ (Data.ByteString.Char8.unpack (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Data.ByteString.Char8.pack GHC.Base.$ StripeAPI.Common.stringifyModel (getIssuingCardsCardDetailsParametersPathCard parameters))) GHC.Base.++ "/details"))) [StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getIssuingCardsCardDetailsParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True])
