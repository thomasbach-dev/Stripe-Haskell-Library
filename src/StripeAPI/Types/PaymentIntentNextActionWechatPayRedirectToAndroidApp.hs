{-# LANGUAGE MultiWayIf #-}
-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.
{-# LANGUAGE OverloadedStrings #-}

-- | Contains the types generated from the schema PaymentIntentNextActionWechatPayRedirectToAndroidApp
module StripeAPI.Types.PaymentIntentNextActionWechatPayRedirectToAndroidApp where

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

-- | Defines the object schema located at @components.schemas.payment_intent_next_action_wechat_pay_redirect_to_android_app@ in the specification.
data PaymentIntentNextActionWechatPayRedirectToAndroidApp = PaymentIntentNextActionWechatPayRedirectToAndroidApp
  { -- | app_id: app_id is the APP ID registered on WeChat open platform
    --
    -- Constraints:
    --
    -- * Maximum length of 5000
    paymentIntentNextActionWechatPayRedirectToAndroidAppAppId :: Data.Text.Internal.Text,
    -- | nonce_str: nonce_str is a random string
    --
    -- Constraints:
    --
    -- * Maximum length of 5000
    paymentIntentNextActionWechatPayRedirectToAndroidAppNonceStr :: Data.Text.Internal.Text,
    -- | package: package is static value
    --
    -- Constraints:
    --
    -- * Maximum length of 5000
    paymentIntentNextActionWechatPayRedirectToAndroidAppPackage :: Data.Text.Internal.Text,
    -- | partner_id: an unique merchant ID assigned by Wechat Pay
    --
    -- Constraints:
    --
    -- * Maximum length of 5000
    paymentIntentNextActionWechatPayRedirectToAndroidAppPartnerId :: Data.Text.Internal.Text,
    -- | prepay_id: an unique trading ID assigned by Wechat Pay
    --
    -- Constraints:
    --
    -- * Maximum length of 5000
    paymentIntentNextActionWechatPayRedirectToAndroidAppPrepayId :: Data.Text.Internal.Text,
    -- | sign: A signature
    --
    -- Constraints:
    --
    -- * Maximum length of 5000
    paymentIntentNextActionWechatPayRedirectToAndroidAppSign :: Data.Text.Internal.Text,
    -- | timestamp: Specifies the current time in epoch format
    --
    -- Constraints:
    --
    -- * Maximum length of 5000
    paymentIntentNextActionWechatPayRedirectToAndroidAppTimestamp :: Data.Text.Internal.Text
  }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.Types.ToJSON.ToJSON PaymentIntentNextActionWechatPayRedirectToAndroidApp where
  toJSON obj = Data.Aeson.Types.Internal.object ("app_id" Data.Aeson.Types.ToJSON..= paymentIntentNextActionWechatPayRedirectToAndroidAppAppId obj : "nonce_str" Data.Aeson.Types.ToJSON..= paymentIntentNextActionWechatPayRedirectToAndroidAppNonceStr obj : "package" Data.Aeson.Types.ToJSON..= paymentIntentNextActionWechatPayRedirectToAndroidAppPackage obj : "partner_id" Data.Aeson.Types.ToJSON..= paymentIntentNextActionWechatPayRedirectToAndroidAppPartnerId obj : "prepay_id" Data.Aeson.Types.ToJSON..= paymentIntentNextActionWechatPayRedirectToAndroidAppPrepayId obj : "sign" Data.Aeson.Types.ToJSON..= paymentIntentNextActionWechatPayRedirectToAndroidAppSign obj : "timestamp" Data.Aeson.Types.ToJSON..= paymentIntentNextActionWechatPayRedirectToAndroidAppTimestamp obj : GHC.Base.mempty)
  toEncoding obj = Data.Aeson.Encoding.Internal.pairs (("app_id" Data.Aeson.Types.ToJSON..= paymentIntentNextActionWechatPayRedirectToAndroidAppAppId obj) GHC.Base.<> (("nonce_str" Data.Aeson.Types.ToJSON..= paymentIntentNextActionWechatPayRedirectToAndroidAppNonceStr obj) GHC.Base.<> (("package" Data.Aeson.Types.ToJSON..= paymentIntentNextActionWechatPayRedirectToAndroidAppPackage obj) GHC.Base.<> (("partner_id" Data.Aeson.Types.ToJSON..= paymentIntentNextActionWechatPayRedirectToAndroidAppPartnerId obj) GHC.Base.<> (("prepay_id" Data.Aeson.Types.ToJSON..= paymentIntentNextActionWechatPayRedirectToAndroidAppPrepayId obj) GHC.Base.<> (("sign" Data.Aeson.Types.ToJSON..= paymentIntentNextActionWechatPayRedirectToAndroidAppSign obj) GHC.Base.<> ("timestamp" Data.Aeson.Types.ToJSON..= paymentIntentNextActionWechatPayRedirectToAndroidAppTimestamp obj)))))))

instance Data.Aeson.Types.FromJSON.FromJSON PaymentIntentNextActionWechatPayRedirectToAndroidApp where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "PaymentIntentNextActionWechatPayRedirectToAndroidApp" (\obj -> ((((((GHC.Base.pure PaymentIntentNextActionWechatPayRedirectToAndroidApp GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "app_id")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "nonce_str")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "package")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "partner_id")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "prepay_id")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "sign")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "timestamp"))

-- | Create a new 'PaymentIntentNextActionWechatPayRedirectToAndroidApp' with all required fields.
mkPaymentIntentNextActionWechatPayRedirectToAndroidApp ::
  -- | 'paymentIntentNextActionWechatPayRedirectToAndroidAppAppId'
  Data.Text.Internal.Text ->
  -- | 'paymentIntentNextActionWechatPayRedirectToAndroidAppNonceStr'
  Data.Text.Internal.Text ->
  -- | 'paymentIntentNextActionWechatPayRedirectToAndroidAppPackage'
  Data.Text.Internal.Text ->
  -- | 'paymentIntentNextActionWechatPayRedirectToAndroidAppPartnerId'
  Data.Text.Internal.Text ->
  -- | 'paymentIntentNextActionWechatPayRedirectToAndroidAppPrepayId'
  Data.Text.Internal.Text ->
  -- | 'paymentIntentNextActionWechatPayRedirectToAndroidAppSign'
  Data.Text.Internal.Text ->
  -- | 'paymentIntentNextActionWechatPayRedirectToAndroidAppTimestamp'
  Data.Text.Internal.Text ->
  PaymentIntentNextActionWechatPayRedirectToAndroidApp
mkPaymentIntentNextActionWechatPayRedirectToAndroidApp paymentIntentNextActionWechatPayRedirectToAndroidAppAppId paymentIntentNextActionWechatPayRedirectToAndroidAppNonceStr paymentIntentNextActionWechatPayRedirectToAndroidAppPackage paymentIntentNextActionWechatPayRedirectToAndroidAppPartnerId paymentIntentNextActionWechatPayRedirectToAndroidAppPrepayId paymentIntentNextActionWechatPayRedirectToAndroidAppSign paymentIntentNextActionWechatPayRedirectToAndroidAppTimestamp =
  PaymentIntentNextActionWechatPayRedirectToAndroidApp
    { paymentIntentNextActionWechatPayRedirectToAndroidAppAppId = paymentIntentNextActionWechatPayRedirectToAndroidAppAppId,
      paymentIntentNextActionWechatPayRedirectToAndroidAppNonceStr = paymentIntentNextActionWechatPayRedirectToAndroidAppNonceStr,
      paymentIntentNextActionWechatPayRedirectToAndroidAppPackage = paymentIntentNextActionWechatPayRedirectToAndroidAppPackage,
      paymentIntentNextActionWechatPayRedirectToAndroidAppPartnerId = paymentIntentNextActionWechatPayRedirectToAndroidAppPartnerId,
      paymentIntentNextActionWechatPayRedirectToAndroidAppPrepayId = paymentIntentNextActionWechatPayRedirectToAndroidAppPrepayId,
      paymentIntentNextActionWechatPayRedirectToAndroidAppSign = paymentIntentNextActionWechatPayRedirectToAndroidAppSign,
      paymentIntentNextActionWechatPayRedirectToAndroidAppTimestamp = paymentIntentNextActionWechatPayRedirectToAndroidAppTimestamp
    }
