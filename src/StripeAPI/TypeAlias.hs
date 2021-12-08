{-# LANGUAGE MultiWayIf #-}
-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.
{-# LANGUAGE OverloadedStrings #-}

-- | Contains all types with cyclic dependencies (between each other or to itself)
module StripeAPI.TypeAlias where

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
import qualified Prelude as GHC.Integer.Type
import qualified Prelude as GHC.Maybe

-- | Defines an alias for the schema located at @components.schemas.setup_intent_payment_method_options_mandate_options_sepa_debit@ in the specification.
type SetupIntentPaymentMethodOptionsMandateOptionsSepaDebit = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.setup_attempt_payment_method_details_sepa_debit@ in the specification.
type SetupAttemptPaymentMethodDetailsSepaDebit = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.setup_attempt_payment_method_details_bacs_debit@ in the specification.
type SetupAttemptPaymentMethodDetailsBacsDebit = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.setup_attempt_payment_method_details_au_becs_debit@ in the specification.
type SetupAttemptPaymentMethodDetailsAuBecsDebit = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.setup_attempt_payment_method_details_acss_debit@ in the specification.
type SetupAttemptPaymentMethodDetailsAcssDebit = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.payment_method_wechat_pay@ in the specification.
type PaymentMethodWechatPay = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.payment_method_oxxo@ in the specification.
type PaymentMethodOxxo = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.payment_method_options_p24@ in the specification.
type PaymentMethodOptionsP24 = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.payment_method_options_interac_present@ in the specification.
type PaymentMethodOptionsInteracPresent = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.payment_method_options_ideal@ in the specification.
type PaymentMethodOptionsIdeal = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.payment_method_options_card_present@ in the specification.
type PaymentMethodOptionsCardPresent = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.payment_method_options_alipay@ in the specification.
type PaymentMethodOptionsAlipay = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.payment_method_interac_present@ in the specification.
type PaymentMethodInteracPresent = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.payment_method_grabpay@ in the specification.
type PaymentMethodGrabpay = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.payment_method_giropay@ in the specification.
type PaymentMethodGiropay = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.payment_method_details_wechat@ in the specification.
type PaymentMethodDetailsWechat = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.payment_method_details_stripe_account@ in the specification.
type PaymentMethodDetailsStripeAccount = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.payment_method_details_card_wallet_samsung_pay@ in the specification.
type PaymentMethodDetailsCardWalletSamsungPay = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.payment_method_details_card_wallet_google_pay@ in the specification.
type PaymentMethodDetailsCardWalletGooglePay = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.payment_method_details_card_wallet_apple_pay@ in the specification.
type PaymentMethodDetailsCardWalletApplePay = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.payment_method_details_card_wallet_amex_express_checkout@ in the specification.
type PaymentMethodDetailsCardWalletAmexExpressCheckout = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.payment_method_card_wallet_samsung_pay@ in the specification.
type PaymentMethodCardWalletSamsungPay = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.payment_method_card_wallet_google_pay@ in the specification.
type PaymentMethodCardWalletGooglePay = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.payment_method_card_wallet_apple_pay@ in the specification.
type PaymentMethodCardWalletApplePay = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.payment_method_card_wallet_amex_express_checkout@ in the specification.
type PaymentMethodCardWalletAmexExpressCheckout = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.payment_method_card_present@ in the specification.
type PaymentMethodCardPresent = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.payment_method_bancontact@ in the specification.
type PaymentMethodBancontact = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.payment_method_afterpay_clearpay@ in the specification.
type PaymentMethodAfterpayClearpay = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.payment_intent_payment_method_options_mandate_options_sepa_debit@ in the specification.
type PaymentIntentPaymentMethodOptionsMandateOptionsSepaDebit = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.payment_flows_private_payment_methods_alipay@ in the specification.
type PaymentFlowsPrivatePaymentMethodsAlipay = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.offline_acceptance@ in the specification.
type OfflineAcceptance = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.mandate_multi_use@ in the specification.
type MandateMultiUse = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.gelato_session_id_number_options@ in the specification.
type GelatoSessionIdNumberOptions = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.gelato_report_id_number_options@ in the specification.
type GelatoReportIdNumberOptions = Data.Aeson.Types.Internal.Object

-- | Defines an alias for the schema located at @components.schemas.card_mandate_payment_method_details@ in the specification.
type CardMandatePaymentMethodDetails = Data.Aeson.Types.Internal.Object
