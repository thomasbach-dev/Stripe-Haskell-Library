{-# LANGUAGE MultiWayIf #-}
-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.
{-# LANGUAGE OverloadedStrings #-}

-- | Contains the types generated from the schema PaymentFlowsAutomaticPaymentMethodsPaymentIntent
module StripeAPI.Types.PaymentFlowsAutomaticPaymentMethodsPaymentIntent where

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

-- | Defines the object schema located at @components.schemas.payment_flows_automatic_payment_methods_payment_intent@ in the specification.
data PaymentFlowsAutomaticPaymentMethodsPaymentIntent = PaymentFlowsAutomaticPaymentMethodsPaymentIntent
  { -- | enabled: Automatically calculates compatible payment methods
    paymentFlowsAutomaticPaymentMethodsPaymentIntentEnabled :: GHC.Types.Bool
  }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.Types.ToJSON.ToJSON PaymentFlowsAutomaticPaymentMethodsPaymentIntent where
  toJSON obj = Data.Aeson.Types.Internal.object ("enabled" Data.Aeson.Types.ToJSON..= paymentFlowsAutomaticPaymentMethodsPaymentIntentEnabled obj : GHC.Base.mempty)
  toEncoding obj = Data.Aeson.Encoding.Internal.pairs ("enabled" Data.Aeson.Types.ToJSON..= paymentFlowsAutomaticPaymentMethodsPaymentIntentEnabled obj)

instance Data.Aeson.Types.FromJSON.FromJSON PaymentFlowsAutomaticPaymentMethodsPaymentIntent where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "PaymentFlowsAutomaticPaymentMethodsPaymentIntent" (\obj -> GHC.Base.pure PaymentFlowsAutomaticPaymentMethodsPaymentIntent GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "enabled"))

-- | Create a new 'PaymentFlowsAutomaticPaymentMethodsPaymentIntent' with all required fields.
mkPaymentFlowsAutomaticPaymentMethodsPaymentIntent ::
  -- | 'paymentFlowsAutomaticPaymentMethodsPaymentIntentEnabled'
  GHC.Types.Bool ->
  PaymentFlowsAutomaticPaymentMethodsPaymentIntent
mkPaymentFlowsAutomaticPaymentMethodsPaymentIntent paymentFlowsAutomaticPaymentMethodsPaymentIntentEnabled = PaymentFlowsAutomaticPaymentMethodsPaymentIntent {paymentFlowsAutomaticPaymentMethodsPaymentIntentEnabled = paymentFlowsAutomaticPaymentMethodsPaymentIntentEnabled}
