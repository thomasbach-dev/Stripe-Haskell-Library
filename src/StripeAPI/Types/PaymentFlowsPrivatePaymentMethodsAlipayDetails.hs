{-# LANGUAGE MultiWayIf #-}
-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.
{-# LANGUAGE OverloadedStrings #-}

-- | Contains the types generated from the schema PaymentFlowsPrivatePaymentMethodsAlipayDetails
module StripeAPI.Types.PaymentFlowsPrivatePaymentMethodsAlipayDetails where

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

-- | Defines the object schema located at @components.schemas.payment_flows_private_payment_methods_alipay_details@ in the specification.
data PaymentFlowsPrivatePaymentMethodsAlipayDetails = PaymentFlowsPrivatePaymentMethodsAlipayDetails
  { -- | buyer_id: Uniquely identifies this particular Alipay account. You can use this attribute to check whether two Alipay accounts are the same.
    --
    -- Constraints:
    --
    -- * Maximum length of 5000
    paymentFlowsPrivatePaymentMethodsAlipayDetailsBuyerId :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
    -- | fingerprint: Uniquely identifies this particular Alipay account. You can use this attribute to check whether two Alipay accounts are the same.
    --
    -- Constraints:
    --
    -- * Maximum length of 5000
    paymentFlowsPrivatePaymentMethodsAlipayDetailsFingerprint :: (GHC.Maybe.Maybe Data.Text.Internal.Text),
    -- | transaction_id: Transaction ID of this particular Alipay transaction.
    --
    -- Constraints:
    --
    -- * Maximum length of 5000
    paymentFlowsPrivatePaymentMethodsAlipayDetailsTransactionId :: (GHC.Maybe.Maybe Data.Text.Internal.Text)
  }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.Types.ToJSON.ToJSON PaymentFlowsPrivatePaymentMethodsAlipayDetails where
  toJSON obj = Data.Aeson.Types.Internal.object ("buyer_id" Data.Aeson.Types.ToJSON..= paymentFlowsPrivatePaymentMethodsAlipayDetailsBuyerId obj : "fingerprint" Data.Aeson.Types.ToJSON..= paymentFlowsPrivatePaymentMethodsAlipayDetailsFingerprint obj : "transaction_id" Data.Aeson.Types.ToJSON..= paymentFlowsPrivatePaymentMethodsAlipayDetailsTransactionId obj : GHC.Base.mempty)
  toEncoding obj = Data.Aeson.Encoding.Internal.pairs (("buyer_id" Data.Aeson.Types.ToJSON..= paymentFlowsPrivatePaymentMethodsAlipayDetailsBuyerId obj) GHC.Base.<> (("fingerprint" Data.Aeson.Types.ToJSON..= paymentFlowsPrivatePaymentMethodsAlipayDetailsFingerprint obj) GHC.Base.<> ("transaction_id" Data.Aeson.Types.ToJSON..= paymentFlowsPrivatePaymentMethodsAlipayDetailsTransactionId obj)))

instance Data.Aeson.Types.FromJSON.FromJSON PaymentFlowsPrivatePaymentMethodsAlipayDetails where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "PaymentFlowsPrivatePaymentMethodsAlipayDetails" (\obj -> ((GHC.Base.pure PaymentFlowsPrivatePaymentMethodsAlipayDetails GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "buyer_id")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "fingerprint")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "transaction_id"))

-- | Create a new 'PaymentFlowsPrivatePaymentMethodsAlipayDetails' with all required fields.
mkPaymentFlowsPrivatePaymentMethodsAlipayDetails :: PaymentFlowsPrivatePaymentMethodsAlipayDetails
mkPaymentFlowsPrivatePaymentMethodsAlipayDetails =
  PaymentFlowsPrivatePaymentMethodsAlipayDetails
    { paymentFlowsPrivatePaymentMethodsAlipayDetailsBuyerId = GHC.Maybe.Nothing,
      paymentFlowsPrivatePaymentMethodsAlipayDetailsFingerprint = GHC.Maybe.Nothing,
      paymentFlowsPrivatePaymentMethodsAlipayDetailsTransactionId = GHC.Maybe.Nothing
    }
