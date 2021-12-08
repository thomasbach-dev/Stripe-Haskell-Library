{-# LANGUAGE MultiWayIf #-}
-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.
{-# LANGUAGE OverloadedStrings #-}

-- | Contains the types generated from the schema InvoicesPaymentMethodOptions
module StripeAPI.Types.InvoicesPaymentMethodOptions where

import qualified Control.Monad.Fail
import qualified Data.Aeson
import qualified Data.Aeson as Data.Aeson.Encoding.Internal
import qualified Data.Aeson as Data.Aeson.Types
import qualified Data.Aeson as Data.Aeson.Types.FromJSON
import qualified Data.Aeson as Data.Aeson.Types.Internal
import qualified Data.Aeson as Data.Aeson.Types.ToJSON
import qualified Data.ByteString.Char8
import qualified Data.ByteString.Char8 as Data.ByteString.Internal
import qualified Data.Functor
import qualified Data.Scientific
import qualified Data.Text
import qualified Data.Text.Internal
import qualified Data.Time.Calendar as Data.Time.Calendar.Days
import qualified Data.Time.LocalTime as Data.Time.LocalTime.Internal.ZonedTime
import qualified GHC.Base
import qualified GHC.Classes
import qualified GHC.Int
import qualified GHC.Show
import qualified GHC.Types
import qualified StripeAPI.Common
import StripeAPI.TypeAlias
import {-# SOURCE #-} StripeAPI.Types.InvoicePaymentMethodOptionsAcssDebit
import {-# SOURCE #-} StripeAPI.Types.InvoicePaymentMethodOptionsAcssDebitMandateOptions
import {-# SOURCE #-} StripeAPI.Types.InvoicePaymentMethodOptionsBancontact
import {-# SOURCE #-} StripeAPI.Types.InvoicePaymentMethodOptionsCard
import qualified Prelude as GHC.Integer.Type
import qualified Prelude as GHC.Maybe

-- | Defines the object schema located at @components.schemas.invoices_payment_method_options@ in the specification.
data InvoicesPaymentMethodOptions = InvoicesPaymentMethodOptions
  { -- | acss_debit: If paying by \`acss_debit\`, this sub-hash contains details about the Canadian pre-authorized debit payment method options to pass to the invoice’s PaymentIntent.
    invoicesPaymentMethodOptionsAcssDebit :: (GHC.Maybe.Maybe InvoicesPaymentMethodOptionsAcssDebit'),
    -- | bancontact: If paying by \`bancontact\`, this sub-hash contains details about the Bancontact payment method options to pass to the invoice’s PaymentIntent.
    invoicesPaymentMethodOptionsBancontact :: (GHC.Maybe.Maybe InvoicesPaymentMethodOptionsBancontact'),
    -- | card: If paying by \`card\`, this sub-hash contains details about the Card payment method options to pass to the invoice’s PaymentIntent.
    invoicesPaymentMethodOptionsCard :: (GHC.Maybe.Maybe InvoicesPaymentMethodOptionsCard')
  }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.Types.ToJSON.ToJSON InvoicesPaymentMethodOptions where
  toJSON obj = Data.Aeson.Types.Internal.object ("acss_debit" Data.Aeson.Types.ToJSON..= invoicesPaymentMethodOptionsAcssDebit obj : "bancontact" Data.Aeson.Types.ToJSON..= invoicesPaymentMethodOptionsBancontact obj : "card" Data.Aeson.Types.ToJSON..= invoicesPaymentMethodOptionsCard obj : GHC.Base.mempty)
  toEncoding obj = Data.Aeson.Encoding.Internal.pairs (("acss_debit" Data.Aeson.Types.ToJSON..= invoicesPaymentMethodOptionsAcssDebit obj) GHC.Base.<> (("bancontact" Data.Aeson.Types.ToJSON..= invoicesPaymentMethodOptionsBancontact obj) GHC.Base.<> ("card" Data.Aeson.Types.ToJSON..= invoicesPaymentMethodOptionsCard obj)))

instance Data.Aeson.Types.FromJSON.FromJSON InvoicesPaymentMethodOptions where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "InvoicesPaymentMethodOptions" (\obj -> ((GHC.Base.pure InvoicesPaymentMethodOptions GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "acss_debit")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "bancontact")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "card"))

-- | Create a new 'InvoicesPaymentMethodOptions' with all required fields.
mkInvoicesPaymentMethodOptions :: InvoicesPaymentMethodOptions
mkInvoicesPaymentMethodOptions =
  InvoicesPaymentMethodOptions
    { invoicesPaymentMethodOptionsAcssDebit = GHC.Maybe.Nothing,
      invoicesPaymentMethodOptionsBancontact = GHC.Maybe.Nothing,
      invoicesPaymentMethodOptionsCard = GHC.Maybe.Nothing
    }

-- | Defines the object schema located at @components.schemas.invoices_payment_method_options.properties.acss_debit.anyOf@ in the specification.
--
-- If paying by \\\`acss_debit\\\`, this sub-hash contains details about the Canadian pre-authorized debit payment method options to pass to the invoice’s PaymentIntent.
data InvoicesPaymentMethodOptionsAcssDebit' = InvoicesPaymentMethodOptionsAcssDebit'
  { -- | mandate_options:
    invoicesPaymentMethodOptionsAcssDebit'MandateOptions :: (GHC.Maybe.Maybe InvoicePaymentMethodOptionsAcssDebitMandateOptions),
    -- | verification_method: Bank account verification method.
    invoicesPaymentMethodOptionsAcssDebit'VerificationMethod :: (GHC.Maybe.Maybe InvoicesPaymentMethodOptionsAcssDebit'VerificationMethod')
  }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.Types.ToJSON.ToJSON InvoicesPaymentMethodOptionsAcssDebit' where
  toJSON obj = Data.Aeson.Types.Internal.object ("mandate_options" Data.Aeson.Types.ToJSON..= invoicesPaymentMethodOptionsAcssDebit'MandateOptions obj : "verification_method" Data.Aeson.Types.ToJSON..= invoicesPaymentMethodOptionsAcssDebit'VerificationMethod obj : GHC.Base.mempty)
  toEncoding obj = Data.Aeson.Encoding.Internal.pairs (("mandate_options" Data.Aeson.Types.ToJSON..= invoicesPaymentMethodOptionsAcssDebit'MandateOptions obj) GHC.Base.<> ("verification_method" Data.Aeson.Types.ToJSON..= invoicesPaymentMethodOptionsAcssDebit'VerificationMethod obj))

instance Data.Aeson.Types.FromJSON.FromJSON InvoicesPaymentMethodOptionsAcssDebit' where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "InvoicesPaymentMethodOptionsAcssDebit'" (\obj -> (GHC.Base.pure InvoicesPaymentMethodOptionsAcssDebit' GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "mandate_options")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "verification_method"))

-- | Create a new 'InvoicesPaymentMethodOptionsAcssDebit'' with all required fields.
mkInvoicesPaymentMethodOptionsAcssDebit' :: InvoicesPaymentMethodOptionsAcssDebit'
mkInvoicesPaymentMethodOptionsAcssDebit' =
  InvoicesPaymentMethodOptionsAcssDebit'
    { invoicesPaymentMethodOptionsAcssDebit'MandateOptions = GHC.Maybe.Nothing,
      invoicesPaymentMethodOptionsAcssDebit'VerificationMethod = GHC.Maybe.Nothing
    }

-- | Defines the enum schema located at @components.schemas.invoices_payment_method_options.properties.acss_debit.anyOf.properties.verification_method@ in the specification.
--
-- Bank account verification method.
data InvoicesPaymentMethodOptionsAcssDebit'VerificationMethod'
  = -- | This case is used if the value encountered during decoding does not match any of the provided cases in the specification.
    InvoicesPaymentMethodOptionsAcssDebit'VerificationMethod'Other Data.Aeson.Types.Internal.Value
  | -- | This constructor can be used to send values to the server which are not present in the specification yet.
    InvoicesPaymentMethodOptionsAcssDebit'VerificationMethod'Typed Data.Text.Internal.Text
  | -- | Represents the JSON value @"automatic"@
    InvoicesPaymentMethodOptionsAcssDebit'VerificationMethod'EnumAutomatic
  | -- | Represents the JSON value @"instant"@
    InvoicesPaymentMethodOptionsAcssDebit'VerificationMethod'EnumInstant
  | -- | Represents the JSON value @"microdeposits"@
    InvoicesPaymentMethodOptionsAcssDebit'VerificationMethod'EnumMicrodeposits
  deriving (GHC.Show.Show, GHC.Classes.Eq)

instance Data.Aeson.Types.ToJSON.ToJSON InvoicesPaymentMethodOptionsAcssDebit'VerificationMethod' where
  toJSON (InvoicesPaymentMethodOptionsAcssDebit'VerificationMethod'Other val) = val
  toJSON (InvoicesPaymentMethodOptionsAcssDebit'VerificationMethod'Typed val) = Data.Aeson.Types.ToJSON.toJSON val
  toJSON (InvoicesPaymentMethodOptionsAcssDebit'VerificationMethod'EnumAutomatic) = "automatic"
  toJSON (InvoicesPaymentMethodOptionsAcssDebit'VerificationMethod'EnumInstant) = "instant"
  toJSON (InvoicesPaymentMethodOptionsAcssDebit'VerificationMethod'EnumMicrodeposits) = "microdeposits"

instance Data.Aeson.Types.FromJSON.FromJSON InvoicesPaymentMethodOptionsAcssDebit'VerificationMethod' where
  parseJSON val =
    GHC.Base.pure
      ( if
            | val GHC.Classes.== "automatic" -> InvoicesPaymentMethodOptionsAcssDebit'VerificationMethod'EnumAutomatic
            | val GHC.Classes.== "instant" -> InvoicesPaymentMethodOptionsAcssDebit'VerificationMethod'EnumInstant
            | val GHC.Classes.== "microdeposits" -> InvoicesPaymentMethodOptionsAcssDebit'VerificationMethod'EnumMicrodeposits
            | GHC.Base.otherwise -> InvoicesPaymentMethodOptionsAcssDebit'VerificationMethod'Other val
      )

-- | Defines the object schema located at @components.schemas.invoices_payment_method_options.properties.bancontact.anyOf@ in the specification.
--
-- If paying by \\\`bancontact\\\`, this sub-hash contains details about the Bancontact payment method options to pass to the invoice’s PaymentIntent.
data InvoicesPaymentMethodOptionsBancontact' = InvoicesPaymentMethodOptionsBancontact'
  { -- | preferred_language: Preferred language of the Bancontact authorization page that the customer is redirected to.
    invoicesPaymentMethodOptionsBancontact'PreferredLanguage :: (GHC.Maybe.Maybe InvoicesPaymentMethodOptionsBancontact'PreferredLanguage')
  }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.Types.ToJSON.ToJSON InvoicesPaymentMethodOptionsBancontact' where
  toJSON obj = Data.Aeson.Types.Internal.object ("preferred_language" Data.Aeson.Types.ToJSON..= invoicesPaymentMethodOptionsBancontact'PreferredLanguage obj : GHC.Base.mempty)
  toEncoding obj = Data.Aeson.Encoding.Internal.pairs ("preferred_language" Data.Aeson.Types.ToJSON..= invoicesPaymentMethodOptionsBancontact'PreferredLanguage obj)

instance Data.Aeson.Types.FromJSON.FromJSON InvoicesPaymentMethodOptionsBancontact' where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "InvoicesPaymentMethodOptionsBancontact'" (\obj -> GHC.Base.pure InvoicesPaymentMethodOptionsBancontact' GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "preferred_language"))

-- | Create a new 'InvoicesPaymentMethodOptionsBancontact'' with all required fields.
mkInvoicesPaymentMethodOptionsBancontact' :: InvoicesPaymentMethodOptionsBancontact'
mkInvoicesPaymentMethodOptionsBancontact' = InvoicesPaymentMethodOptionsBancontact' {invoicesPaymentMethodOptionsBancontact'PreferredLanguage = GHC.Maybe.Nothing}

-- | Defines the enum schema located at @components.schemas.invoices_payment_method_options.properties.bancontact.anyOf.properties.preferred_language@ in the specification.
--
-- Preferred language of the Bancontact authorization page that the customer is redirected to.
data InvoicesPaymentMethodOptionsBancontact'PreferredLanguage'
  = -- | This case is used if the value encountered during decoding does not match any of the provided cases in the specification.
    InvoicesPaymentMethodOptionsBancontact'PreferredLanguage'Other Data.Aeson.Types.Internal.Value
  | -- | This constructor can be used to send values to the server which are not present in the specification yet.
    InvoicesPaymentMethodOptionsBancontact'PreferredLanguage'Typed Data.Text.Internal.Text
  | -- | Represents the JSON value @"de"@
    InvoicesPaymentMethodOptionsBancontact'PreferredLanguage'EnumDe
  | -- | Represents the JSON value @"en"@
    InvoicesPaymentMethodOptionsBancontact'PreferredLanguage'EnumEn
  | -- | Represents the JSON value @"fr"@
    InvoicesPaymentMethodOptionsBancontact'PreferredLanguage'EnumFr
  | -- | Represents the JSON value @"nl"@
    InvoicesPaymentMethodOptionsBancontact'PreferredLanguage'EnumNl
  deriving (GHC.Show.Show, GHC.Classes.Eq)

instance Data.Aeson.Types.ToJSON.ToJSON InvoicesPaymentMethodOptionsBancontact'PreferredLanguage' where
  toJSON (InvoicesPaymentMethodOptionsBancontact'PreferredLanguage'Other val) = val
  toJSON (InvoicesPaymentMethodOptionsBancontact'PreferredLanguage'Typed val) = Data.Aeson.Types.ToJSON.toJSON val
  toJSON (InvoicesPaymentMethodOptionsBancontact'PreferredLanguage'EnumDe) = "de"
  toJSON (InvoicesPaymentMethodOptionsBancontact'PreferredLanguage'EnumEn) = "en"
  toJSON (InvoicesPaymentMethodOptionsBancontact'PreferredLanguage'EnumFr) = "fr"
  toJSON (InvoicesPaymentMethodOptionsBancontact'PreferredLanguage'EnumNl) = "nl"

instance Data.Aeson.Types.FromJSON.FromJSON InvoicesPaymentMethodOptionsBancontact'PreferredLanguage' where
  parseJSON val =
    GHC.Base.pure
      ( if
            | val GHC.Classes.== "de" -> InvoicesPaymentMethodOptionsBancontact'PreferredLanguage'EnumDe
            | val GHC.Classes.== "en" -> InvoicesPaymentMethodOptionsBancontact'PreferredLanguage'EnumEn
            | val GHC.Classes.== "fr" -> InvoicesPaymentMethodOptionsBancontact'PreferredLanguage'EnumFr
            | val GHC.Classes.== "nl" -> InvoicesPaymentMethodOptionsBancontact'PreferredLanguage'EnumNl
            | GHC.Base.otherwise -> InvoicesPaymentMethodOptionsBancontact'PreferredLanguage'Other val
      )

-- | Defines the object schema located at @components.schemas.invoices_payment_method_options.properties.card.anyOf@ in the specification.
--
-- If paying by \\\`card\\\`, this sub-hash contains details about the Card payment method options to pass to the invoice’s PaymentIntent.
data InvoicesPaymentMethodOptionsCard' = InvoicesPaymentMethodOptionsCard'
  { -- | request_three_d_secure: We strongly recommend that you rely on our SCA Engine to automatically prompt your customers for authentication based on risk level and [other requirements](https:\/\/stripe.com\/docs\/strong-customer-authentication). However, if you wish to request 3D Secure based on logic from your own fraud engine, provide this option. Read our guide on [manually requesting 3D Secure](https:\/\/stripe.com\/docs\/payments\/3d-secure\#manual-three-ds) for more information on how this configuration interacts with Radar and our SCA Engine.
    invoicesPaymentMethodOptionsCard'RequestThreeDSecure :: (GHC.Maybe.Maybe InvoicesPaymentMethodOptionsCard'RequestThreeDSecure')
  }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.Types.ToJSON.ToJSON InvoicesPaymentMethodOptionsCard' where
  toJSON obj = Data.Aeson.Types.Internal.object ("request_three_d_secure" Data.Aeson.Types.ToJSON..= invoicesPaymentMethodOptionsCard'RequestThreeDSecure obj : GHC.Base.mempty)
  toEncoding obj = Data.Aeson.Encoding.Internal.pairs ("request_three_d_secure" Data.Aeson.Types.ToJSON..= invoicesPaymentMethodOptionsCard'RequestThreeDSecure obj)

instance Data.Aeson.Types.FromJSON.FromJSON InvoicesPaymentMethodOptionsCard' where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "InvoicesPaymentMethodOptionsCard'" (\obj -> GHC.Base.pure InvoicesPaymentMethodOptionsCard' GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "request_three_d_secure"))

-- | Create a new 'InvoicesPaymentMethodOptionsCard'' with all required fields.
mkInvoicesPaymentMethodOptionsCard' :: InvoicesPaymentMethodOptionsCard'
mkInvoicesPaymentMethodOptionsCard' = InvoicesPaymentMethodOptionsCard' {invoicesPaymentMethodOptionsCard'RequestThreeDSecure = GHC.Maybe.Nothing}

-- | Defines the enum schema located at @components.schemas.invoices_payment_method_options.properties.card.anyOf.properties.request_three_d_secure@ in the specification.
--
-- We strongly recommend that you rely on our SCA Engine to automatically prompt your customers for authentication based on risk level and [other requirements](https:\/\/stripe.com\/docs\/strong-customer-authentication). However, if you wish to request 3D Secure based on logic from your own fraud engine, provide this option. Read our guide on [manually requesting 3D Secure](https:\/\/stripe.com\/docs\/payments\/3d-secure\#manual-three-ds) for more information on how this configuration interacts with Radar and our SCA Engine.
data InvoicesPaymentMethodOptionsCard'RequestThreeDSecure'
  = -- | This case is used if the value encountered during decoding does not match any of the provided cases in the specification.
    InvoicesPaymentMethodOptionsCard'RequestThreeDSecure'Other Data.Aeson.Types.Internal.Value
  | -- | This constructor can be used to send values to the server which are not present in the specification yet.
    InvoicesPaymentMethodOptionsCard'RequestThreeDSecure'Typed Data.Text.Internal.Text
  | -- | Represents the JSON value @"any"@
    InvoicesPaymentMethodOptionsCard'RequestThreeDSecure'EnumAny
  | -- | Represents the JSON value @"automatic"@
    InvoicesPaymentMethodOptionsCard'RequestThreeDSecure'EnumAutomatic
  deriving (GHC.Show.Show, GHC.Classes.Eq)

instance Data.Aeson.Types.ToJSON.ToJSON InvoicesPaymentMethodOptionsCard'RequestThreeDSecure' where
  toJSON (InvoicesPaymentMethodOptionsCard'RequestThreeDSecure'Other val) = val
  toJSON (InvoicesPaymentMethodOptionsCard'RequestThreeDSecure'Typed val) = Data.Aeson.Types.ToJSON.toJSON val
  toJSON (InvoicesPaymentMethodOptionsCard'RequestThreeDSecure'EnumAny) = "any"
  toJSON (InvoicesPaymentMethodOptionsCard'RequestThreeDSecure'EnumAutomatic) = "automatic"

instance Data.Aeson.Types.FromJSON.FromJSON InvoicesPaymentMethodOptionsCard'RequestThreeDSecure' where
  parseJSON val =
    GHC.Base.pure
      ( if
            | val GHC.Classes.== "any" -> InvoicesPaymentMethodOptionsCard'RequestThreeDSecure'EnumAny
            | val GHC.Classes.== "automatic" -> InvoicesPaymentMethodOptionsCard'RequestThreeDSecure'EnumAutomatic
            | GHC.Base.otherwise -> InvoicesPaymentMethodOptionsCard'RequestThreeDSecure'Other val
      )
