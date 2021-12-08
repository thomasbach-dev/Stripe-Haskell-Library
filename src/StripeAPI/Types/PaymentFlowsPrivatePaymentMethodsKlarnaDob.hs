{-# LANGUAGE MultiWayIf #-}
-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.
{-# LANGUAGE OverloadedStrings #-}

-- | Contains the types generated from the schema PaymentFlowsPrivatePaymentMethodsKlarnaDob
module StripeAPI.Types.PaymentFlowsPrivatePaymentMethodsKlarnaDob where

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
import qualified Prelude as GHC.Integer.Type
import qualified Prelude as GHC.Maybe

-- | Defines the object schema located at @components.schemas.payment_flows_private_payment_methods_klarna_dob@ in the specification.
data PaymentFlowsPrivatePaymentMethodsKlarnaDob = PaymentFlowsPrivatePaymentMethodsKlarnaDob
  { -- | day: The day of birth, between 1 and 31.
    paymentFlowsPrivatePaymentMethodsKlarnaDobDay :: (GHC.Maybe.Maybe GHC.Types.Int),
    -- | month: The month of birth, between 1 and 12.
    paymentFlowsPrivatePaymentMethodsKlarnaDobMonth :: (GHC.Maybe.Maybe GHC.Types.Int),
    -- | year: The four-digit year of birth.
    paymentFlowsPrivatePaymentMethodsKlarnaDobYear :: (GHC.Maybe.Maybe GHC.Types.Int)
  }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.Types.ToJSON.ToJSON PaymentFlowsPrivatePaymentMethodsKlarnaDob where
  toJSON obj = Data.Aeson.Types.Internal.object ("day" Data.Aeson.Types.ToJSON..= paymentFlowsPrivatePaymentMethodsKlarnaDobDay obj : "month" Data.Aeson.Types.ToJSON..= paymentFlowsPrivatePaymentMethodsKlarnaDobMonth obj : "year" Data.Aeson.Types.ToJSON..= paymentFlowsPrivatePaymentMethodsKlarnaDobYear obj : GHC.Base.mempty)
  toEncoding obj = Data.Aeson.Encoding.Internal.pairs (("day" Data.Aeson.Types.ToJSON..= paymentFlowsPrivatePaymentMethodsKlarnaDobDay obj) GHC.Base.<> (("month" Data.Aeson.Types.ToJSON..= paymentFlowsPrivatePaymentMethodsKlarnaDobMonth obj) GHC.Base.<> ("year" Data.Aeson.Types.ToJSON..= paymentFlowsPrivatePaymentMethodsKlarnaDobYear obj)))

instance Data.Aeson.Types.FromJSON.FromJSON PaymentFlowsPrivatePaymentMethodsKlarnaDob where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "PaymentFlowsPrivatePaymentMethodsKlarnaDob" (\obj -> ((GHC.Base.pure PaymentFlowsPrivatePaymentMethodsKlarnaDob GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "day")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "month")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "year"))

-- | Create a new 'PaymentFlowsPrivatePaymentMethodsKlarnaDob' with all required fields.
mkPaymentFlowsPrivatePaymentMethodsKlarnaDob :: PaymentFlowsPrivatePaymentMethodsKlarnaDob
mkPaymentFlowsPrivatePaymentMethodsKlarnaDob =
  PaymentFlowsPrivatePaymentMethodsKlarnaDob
    { paymentFlowsPrivatePaymentMethodsKlarnaDobDay = GHC.Maybe.Nothing,
      paymentFlowsPrivatePaymentMethodsKlarnaDobMonth = GHC.Maybe.Nothing,
      paymentFlowsPrivatePaymentMethodsKlarnaDobYear = GHC.Maybe.Nothing
    }
