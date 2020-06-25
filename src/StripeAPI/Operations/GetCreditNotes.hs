{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE OverloadedStrings #-}

-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.

-- | Contains the different functions to run the operation getCreditNotes
module StripeAPI.Operations.GetCreditNotes where

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

-- | > GET /v1/credit_notes
--
-- \<p>Returns a list of credit notes.\<\/p>
getCreditNotes ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | Contains all available parameters of this operation (query and path parameters)
  GetCreditNotesParameters ->
  -- | Monadic computation which returns the result of the operation
  StripeAPI.Common.StripeT m (Network.HTTP.Client.Types.Response GetCreditNotesResponse)
getCreditNotes parameters =
  GHC.Base.fmap
    ( \response_0 ->
        GHC.Base.fmap
          ( Data.Either.either GetCreditNotesResponseError GHC.Base.id
              GHC.Base.. ( \response body ->
                             if  | (\status_1 -> Network.HTTP.Types.Status.statusCode status_1 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) ->
                                   GetCreditNotesResponse200
                                     Data.Functor.<$> ( Data.Aeson.eitherDecodeStrict body ::
                                                          Data.Either.Either GHC.Base.String
                                                            GetCreditNotesResponseBody200
                                                      )
                                 | GHC.Base.const GHC.Types.True (Network.HTTP.Client.Types.responseStatus response) ->
                                   GetCreditNotesResponseDefault
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
        (Data.Text.pack "/v1/credit_notes")
        [ StripeAPI.Common.QueryParameter (Data.Text.pack "customer") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCreditNotesParametersQueryCustomer parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "ending_before") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCreditNotesParametersQueryEndingBefore parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCreditNotesParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "invoice") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCreditNotesParametersQueryInvoice parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "limit") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCreditNotesParametersQueryLimit parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "starting_after") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCreditNotesParametersQueryStartingAfter parameters) (Data.Text.pack "form") GHC.Types.True
        ]
    )

-- | Defines the data type for the schema getCreditNotesParameters
data GetCreditNotesParameters
  = GetCreditNotesParameters
      { -- | queryCustomer: Represents the parameter named \'customer\'
        --
        -- Only return credit notes for the customer specified by this customer ID.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        getCreditNotesParametersQueryCustomer :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
        -- | queryEnding_before: Represents the parameter named \'ending_before\'
        --
        -- A cursor for use in pagination. \`ending_before\` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with \`obj_bar\`, your subsequent call can include \`ending_before=obj_bar\` in order to fetch the previous page of the list.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        getCreditNotesParametersQueryEndingBefore :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
        -- | queryExpand: Represents the parameter named \'expand\'
        --
        -- Specifies which fields in the response should be expanded.
        getCreditNotesParametersQueryExpand :: (GHC.Maybe.Maybe ([] Data.Text.Internal.Text)),
        -- | queryInvoice: Represents the parameter named \'invoice\'
        --
        -- Only return credit notes for the invoice specified by this invoice ID.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        getCreditNotesParametersQueryInvoice :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
        -- | queryLimit: Represents the parameter named \'limit\'
        --
        -- A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
        getCreditNotesParametersQueryLimit :: (GHC.Maybe.Maybe GHC.Types.Int),
        -- | queryStarting_after: Represents the parameter named \'starting_after\'
        --
        -- A cursor for use in pagination. \`starting_after\` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with \`obj_foo\`, your subsequent call can include \`starting_after=obj_foo\` in order to fetch the next page of the list.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        getCreditNotesParametersQueryStartingAfter :: (GHC.Maybe.Maybe Data.Text.Internal.Text)
      }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.ToJSON GetCreditNotesParameters where
  toJSON obj = Data.Aeson.object ((Data.Aeson..=) "queryCustomer" (getCreditNotesParametersQueryCustomer obj) : (Data.Aeson..=) "queryEnding_before" (getCreditNotesParametersQueryEndingBefore obj) : (Data.Aeson..=) "queryExpand" (getCreditNotesParametersQueryExpand obj) : (Data.Aeson..=) "queryInvoice" (getCreditNotesParametersQueryInvoice obj) : (Data.Aeson..=) "queryLimit" (getCreditNotesParametersQueryLimit obj) : (Data.Aeson..=) "queryStarting_after" (getCreditNotesParametersQueryStartingAfter obj) : [])
  toEncoding obj = Data.Aeson.pairs ((Data.Aeson..=) "queryCustomer" (getCreditNotesParametersQueryCustomer obj) GHC.Base.<> ((Data.Aeson..=) "queryEnding_before" (getCreditNotesParametersQueryEndingBefore obj) GHC.Base.<> ((Data.Aeson..=) "queryExpand" (getCreditNotesParametersQueryExpand obj) GHC.Base.<> ((Data.Aeson..=) "queryInvoice" (getCreditNotesParametersQueryInvoice obj) GHC.Base.<> ((Data.Aeson..=) "queryLimit" (getCreditNotesParametersQueryLimit obj) GHC.Base.<> (Data.Aeson..=) "queryStarting_after" (getCreditNotesParametersQueryStartingAfter obj))))))

instance Data.Aeson.Types.FromJSON.FromJSON GetCreditNotesParameters where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "GetCreditNotesParameters" (\obj -> (((((GHC.Base.pure GetCreditNotesParameters GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryCustomer")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryEnding_before")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryExpand")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryInvoice")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryLimit")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "queryStarting_after"))

-- | Represents a response of the operation 'getCreditNotes'.
--
-- The response constructor is chosen by the status code of the response. If no case matches (no specific case for the response code, no range case, no default case), 'GetCreditNotesResponseError' is used.
data GetCreditNotesResponse
  = -- | Means either no matching case available or a parse error
    GetCreditNotesResponseError GHC.Base.String
  | -- | Successful response.
    GetCreditNotesResponse200 GetCreditNotesResponseBody200
  | -- | Error response.
    GetCreditNotesResponseDefault Error
  deriving (GHC.Show.Show, GHC.Classes.Eq)

-- | Defines the data type for the schema GetCreditNotesResponseBody200
data GetCreditNotesResponseBody200
  = GetCreditNotesResponseBody200
      { -- | data
        getCreditNotesResponseBody200Data :: ([] CreditNote),
        -- | has_more: True if this list has another page of items after this one that can be fetched.
        getCreditNotesResponseBody200HasMore :: GHC.Types.Bool,
        -- | object: String representing the object\'s type. Objects of the same type share the same value. Always has the value \`list\`.
        getCreditNotesResponseBody200Object :: GetCreditNotesResponseBody200Object',
        -- | url: The URL where this list can be accessed.
        --
        -- Constraints:
        --
        -- * Maximum length of 5000
        getCreditNotesResponseBody200Url :: Data.Text.Internal.Text
      }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.ToJSON GetCreditNotesResponseBody200 where
  toJSON obj = Data.Aeson.object ((Data.Aeson..=) "data" (getCreditNotesResponseBody200Data obj) : (Data.Aeson..=) "has_more" (getCreditNotesResponseBody200HasMore obj) : (Data.Aeson..=) "object" (getCreditNotesResponseBody200Object obj) : (Data.Aeson..=) "url" (getCreditNotesResponseBody200Url obj) : [])
  toEncoding obj = Data.Aeson.pairs ((Data.Aeson..=) "data" (getCreditNotesResponseBody200Data obj) GHC.Base.<> ((Data.Aeson..=) "has_more" (getCreditNotesResponseBody200HasMore obj) GHC.Base.<> ((Data.Aeson..=) "object" (getCreditNotesResponseBody200Object obj) GHC.Base.<> (Data.Aeson..=) "url" (getCreditNotesResponseBody200Url obj))))

instance Data.Aeson.Types.FromJSON.FromJSON GetCreditNotesResponseBody200 where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "GetCreditNotesResponseBody200" (\obj -> (((GHC.Base.pure GetCreditNotesResponseBody200 GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "data")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "has_more")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "object")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "url"))

-- | Defines the enum schema GetCreditNotesResponseBody200Object\'
--
-- String representing the object\'s type. Objects of the same type share the same value. Always has the value \`list\`.
data GetCreditNotesResponseBody200Object'
  = GetCreditNotesResponseBody200Object'EnumOther Data.Aeson.Types.Internal.Value
  | GetCreditNotesResponseBody200Object'EnumTyped Data.Text.Internal.Text
  | GetCreditNotesResponseBody200Object'EnumStringList
  deriving (GHC.Show.Show, GHC.Classes.Eq)

instance Data.Aeson.ToJSON GetCreditNotesResponseBody200Object' where
  toJSON (GetCreditNotesResponseBody200Object'EnumOther patternName) = Data.Aeson.Types.ToJSON.toJSON patternName
  toJSON (GetCreditNotesResponseBody200Object'EnumTyped patternName) = Data.Aeson.Types.ToJSON.toJSON patternName
  toJSON (GetCreditNotesResponseBody200Object'EnumStringList) = Data.Aeson.Types.Internal.String GHC.Base.$ Data.Text.pack "list"

instance Data.Aeson.FromJSON GetCreditNotesResponseBody200Object' where
  parseJSON val =
    GHC.Base.pure
      ( if val GHC.Classes.== (Data.Aeson.Types.Internal.String GHC.Base.$ Data.Text.pack "list")
          then GetCreditNotesResponseBody200Object'EnumStringList
          else GetCreditNotesResponseBody200Object'EnumOther val
      )

-- | > GET /v1/credit_notes
--
-- The same as 'getCreditNotes' but accepts an explicit configuration.
getCreditNotesWithConfiguration ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | The configuration to use in the request
  StripeAPI.Common.Configuration ->
  -- | Contains all available parameters of this operation (query and path parameters)
  GetCreditNotesParameters ->
  -- | Monadic computation which returns the result of the operation
  m (Network.HTTP.Client.Types.Response GetCreditNotesResponse)
getCreditNotesWithConfiguration
  config
  parameters =
    GHC.Base.fmap
      ( \response_2 ->
          GHC.Base.fmap
            ( Data.Either.either GetCreditNotesResponseError GHC.Base.id
                GHC.Base.. ( \response body ->
                               if  | (\status_3 -> Network.HTTP.Types.Status.statusCode status_3 GHC.Classes.== 200) (Network.HTTP.Client.Types.responseStatus response) ->
                                     GetCreditNotesResponse200
                                       Data.Functor.<$> ( Data.Aeson.eitherDecodeStrict body ::
                                                            Data.Either.Either GHC.Base.String
                                                              GetCreditNotesResponseBody200
                                                        )
                                   | GHC.Base.const GHC.Types.True (Network.HTTP.Client.Types.responseStatus response) ->
                                     GetCreditNotesResponseDefault
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
          (Data.Text.pack "/v1/credit_notes")
          [ StripeAPI.Common.QueryParameter (Data.Text.pack "customer") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCreditNotesParametersQueryCustomer parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "ending_before") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCreditNotesParametersQueryEndingBefore parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCreditNotesParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "invoice") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCreditNotesParametersQueryInvoice parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "limit") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCreditNotesParametersQueryLimit parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "starting_after") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCreditNotesParametersQueryStartingAfter parameters) (Data.Text.pack "form") GHC.Types.True
          ]
      )

-- | > GET /v1/credit_notes
--
-- The same as 'getCreditNotes' but returns the raw 'Data.ByteString.Char8.ByteString'.
getCreditNotesRaw ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | Contains all available parameters of this operation (query and path parameters)
  GetCreditNotesParameters ->
  -- | Monadic computation which returns the result of the operation
  StripeAPI.Common.StripeT m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.ByteString)
getCreditNotesRaw parameters =
  GHC.Base.id
    ( StripeAPI.Common.doCallWithConfigurationM
        (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET")
        (Data.Text.pack "/v1/credit_notes")
        [ StripeAPI.Common.QueryParameter (Data.Text.pack "customer") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCreditNotesParametersQueryCustomer parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "ending_before") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCreditNotesParametersQueryEndingBefore parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCreditNotesParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "invoice") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCreditNotesParametersQueryInvoice parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "limit") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCreditNotesParametersQueryLimit parameters) (Data.Text.pack "form") GHC.Types.True,
          StripeAPI.Common.QueryParameter (Data.Text.pack "starting_after") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCreditNotesParametersQueryStartingAfter parameters) (Data.Text.pack "form") GHC.Types.True
        ]
    )

-- | > GET /v1/credit_notes
--
-- The same as 'getCreditNotes' but accepts an explicit configuration and returns the raw 'Data.ByteString.Char8.ByteString'.
getCreditNotesWithConfigurationRaw ::
  forall m.
  StripeAPI.Common.MonadHTTP m =>
  -- | The configuration to use in the request
  StripeAPI.Common.Configuration ->
  -- | Contains all available parameters of this operation (query and path parameters)
  GetCreditNotesParameters ->
  -- | Monadic computation which returns the result of the operation
  m (Network.HTTP.Client.Types.Response Data.ByteString.Internal.ByteString)
getCreditNotesWithConfigurationRaw
  config
  parameters =
    GHC.Base.id
      ( StripeAPI.Common.doCallWithConfiguration
          config
          (Data.Text.toUpper GHC.Base.$ Data.Text.pack "GET")
          (Data.Text.pack "/v1/credit_notes")
          [ StripeAPI.Common.QueryParameter (Data.Text.pack "customer") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCreditNotesParametersQueryCustomer parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "ending_before") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCreditNotesParametersQueryEndingBefore parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "expand") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCreditNotesParametersQueryExpand parameters) (Data.Text.pack "deepObject") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "invoice") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCreditNotesParametersQueryInvoice parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "limit") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCreditNotesParametersQueryLimit parameters) (Data.Text.pack "form") GHC.Types.True,
            StripeAPI.Common.QueryParameter (Data.Text.pack "starting_after") (Data.Aeson.Types.ToJSON.toJSON Data.Functor.<$> getCreditNotesParametersQueryStartingAfter parameters) (Data.Text.pack "form") GHC.Types.True
          ]
      )
