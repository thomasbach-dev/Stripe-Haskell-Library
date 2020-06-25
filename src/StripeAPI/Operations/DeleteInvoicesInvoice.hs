{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE OverloadedStrings #-}

-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.

-- | Contains the different functions to run the operation deleteInvoicesInvoice
module StripeAPI.Operations.DeleteInvoicesInvoice where

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

-- | > DELETE /v1/invoices/{invoice}
--
-- \<p>Permanently deletes a draft invoice. This cannot be undone. Attempts to delete invoices that are no longer in a draft state will fail; once an invoice has been finalized, it must be \<a href=\"\#void_invoice\">voided\<\/a>.\<\/p>
deleteInvoicesInvoice ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | invoice | Constraints: Maximum length of 5000
  Data.Text.Internal.Text ->
  -- | Monadic computation which returns the result of the operation
  StripeAPI.Common.StripeT m (Network.HTTP.Client.Types.Response DeleteInvoicesInvoiceResponse)
deleteInvoicesInvoice invoice =
  GHC.Base.fmap
    ( \response_0 ->
        GHC.Base.fmap
          ( Data.Either.either DeleteInvoicesInvoiceResponseError GHC.Base.id
              GHC.Base.. ( \response body ->
                             if  | (\status_1 -> Network.HTTP.Types.Status.statusCode status_1 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) ->
                                   DeleteInvoicesInvoiceResponse200
                                     Data.Functor.<$> ( Data.Aeson.eitherDecodeStrict body ::
                                                          Data.Either.Either GHC.Base.String
                                                            DeletedInvoice
                                                      )
                                 | GHC.Base.const GHC.Types.True (Network.HTTP.Client.Types.responseStatus response) ->
                                   DeleteInvoicesInvoiceResponseDefault
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
    (StripeAPI.Common.doCallWithConfigurationM (Data.Text.toUpper GHC.Base.$ Data.Text.pack "DELETE") (Data.Text.pack ("/v1/invoices/" GHC.Base.++ (Data.ByteString.Char8.unpack (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Data.ByteString.Char8.pack GHC.Base.$ StripeAPI.Common.stringifyModel invoice)) GHC.Base.++ ""))) [])

-- | Represents a response of the operation 'deleteInvoicesInvoice'.
--
-- The response constructor is chosen by the status code of the response. If no case matches (no specific case for the response code, no range case, no default case), 'DeleteInvoicesInvoiceResponseError' is used.
data DeleteInvoicesInvoiceResponse
  = -- | Means either no matching case available or a parse error
    DeleteInvoicesInvoiceResponseError GHC.Base.String
  | -- | Successful response.
    DeleteInvoicesInvoiceResponse200 DeletedInvoice
  | -- | Error response.
    DeleteInvoicesInvoiceResponseDefault Error
  deriving (GHC.Show.Show, GHC.Classes.Eq)

-- | > DELETE /v1/invoices/{invoice}
--
-- The same as 'deleteInvoicesInvoice' but accepts an explicit configuration.
deleteInvoicesInvoiceWithConfiguration ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | The configuration to use in the request
  StripeAPI.Common.Configuration ->
  -- | invoice | Constraints: Maximum length of 5000
  Data.Text.Internal.Text ->
  -- | Monadic computation which returns the result of the operation
  m (Network.HTTP.Client.Types.Response DeleteInvoicesInvoiceResponse)
deleteInvoicesInvoiceWithConfiguration
  config
  invoice =
    GHC.Base.fmap
      ( \response_2 ->
          GHC.Base.fmap
            ( Data.Either.either DeleteInvoicesInvoiceResponseError GHC.Base.id
                GHC.Base.. ( \response body ->
                               if  | (\status_3 -> Network.HTTP.Types.Status.statusCode status_3 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) ->
                                     DeleteInvoicesInvoiceResponse200
                                       Data.Functor.<$> ( Data.Aeson.eitherDecodeStrict body ::
                                                            Data.Either.Either GHC.Base.String
                                                              DeletedInvoice
                                                        )
                                   | GHC.Base.const GHC.Types.True (Network.HTTP.Client.Types.responseStatus response) ->
                                     DeleteInvoicesInvoiceResponseDefault
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
      (StripeAPI.Common.doCallWithConfiguration config (Data.Text.toUpper GHC.Base.$ Data.Text.pack "DELETE") (Data.Text.pack ("/v1/invoices/" GHC.Base.++ (Data.ByteString.Char8.unpack (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Data.ByteString.Char8.pack GHC.Base.$ StripeAPI.Common.stringifyModel invoice)) GHC.Base.++ ""))) [])

-- | > DELETE /v1/invoices/{invoice}
--
-- The same as 'deleteInvoicesInvoice' but returns the raw 'Data.ByteString.Char8.ByteString'.
deleteInvoicesInvoiceRaw ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | invoice | Constraints: Maximum length of 5000
  Data.Text.Internal.Text ->
  -- | Monadic computation which returns the result of the operation
  StripeAPI.Common.StripeT m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.ByteString)
deleteInvoicesInvoiceRaw invoice = GHC.Base.id (StripeAPI.Common.doCallWithConfigurationM (Data.Text.toUpper GHC.Base.$ Data.Text.pack "DELETE") (Data.Text.pack ("/v1/invoices/" GHC.Base.++ (Data.ByteString.Char8.unpack (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Data.ByteString.Char8.pack GHC.Base.$ StripeAPI.Common.stringifyModel invoice)) GHC.Base.++ ""))) [])

-- | > DELETE /v1/invoices/{invoice}
--
-- The same as 'deleteInvoicesInvoice' but accepts an explicit configuration and returns the raw 'Data.ByteString.Char8.ByteString'.
deleteInvoicesInvoiceWithConfigurationRaw ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | The configuration to use in the request
  StripeAPI.Common.Configuration ->
  -- | invoice | Constraints: Maximum length of 5000
  Data.Text.Internal.Text ->
  -- | Monadic computation which returns the result of the operation
  m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.ByteString)
deleteInvoicesInvoiceWithConfigurationRaw
  config
  invoice = GHC.Base.id (StripeAPI.Common.doCallWithConfiguration config (Data.Text.toUpper GHC.Base.$ Data.Text.pack "DELETE") (Data.Text.pack ("/v1/invoices/" GHC.Base.++ (Data.ByteString.Char8.unpack (Network.HTTP.Types.URI.urlEncode GHC.Types.True GHC.Base.$ (Data.ByteString.Char8.pack GHC.Base.$ StripeAPI.Common.stringifyModel invoice)) GHC.Base.++ ""))) [])
