{-# LANGUAGE MultiWayIf #-}
-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.
{-# LANGUAGE OverloadedStrings #-}

-- | Contains the types generated from the schema ShippingRateDeliveryEstimate
module StripeAPI.Types.ShippingRateDeliveryEstimate where

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
import {-# SOURCE #-} StripeAPI.Types.ShippingRateDeliveryEstimateBound
import qualified Prelude as GHC.Integer.Type
import qualified Prelude as GHC.Maybe

-- | Defines the object schema located at @components.schemas.shipping_rate_delivery_estimate@ in the specification.
data ShippingRateDeliveryEstimate = ShippingRateDeliveryEstimate
  { -- | maximum: The upper bound of the estimated range. If empty, represents no upper bound i.e., infinite.
    shippingRateDeliveryEstimateMaximum :: (GHC.Maybe.Maybe ShippingRateDeliveryEstimateMaximum'),
    -- | minimum: The lower bound of the estimated range. If empty, represents no lower bound.
    shippingRateDeliveryEstimateMinimum :: (GHC.Maybe.Maybe ShippingRateDeliveryEstimateMinimum')
  }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.Types.ToJSON.ToJSON ShippingRateDeliveryEstimate where
  toJSON obj = Data.Aeson.Types.Internal.object ("maximum" Data.Aeson.Types.ToJSON..= shippingRateDeliveryEstimateMaximum obj : "minimum" Data.Aeson.Types.ToJSON..= shippingRateDeliveryEstimateMinimum obj : GHC.Base.mempty)
  toEncoding obj = Data.Aeson.Encoding.Internal.pairs (("maximum" Data.Aeson.Types.ToJSON..= shippingRateDeliveryEstimateMaximum obj) GHC.Base.<> ("minimum" Data.Aeson.Types.ToJSON..= shippingRateDeliveryEstimateMinimum obj))

instance Data.Aeson.Types.FromJSON.FromJSON ShippingRateDeliveryEstimate where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "ShippingRateDeliveryEstimate" (\obj -> (GHC.Base.pure ShippingRateDeliveryEstimate GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "maximum")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "minimum"))

-- | Create a new 'ShippingRateDeliveryEstimate' with all required fields.
mkShippingRateDeliveryEstimate :: ShippingRateDeliveryEstimate
mkShippingRateDeliveryEstimate =
  ShippingRateDeliveryEstimate
    { shippingRateDeliveryEstimateMaximum = GHC.Maybe.Nothing,
      shippingRateDeliveryEstimateMinimum = GHC.Maybe.Nothing
    }

-- | Defines the object schema located at @components.schemas.shipping_rate_delivery_estimate.properties.maximum.anyOf@ in the specification.
--
-- The upper bound of the estimated range. If empty, represents no upper bound i.e., infinite.
data ShippingRateDeliveryEstimateMaximum' = ShippingRateDeliveryEstimateMaximum'
  { -- | unit: A unit of time.
    shippingRateDeliveryEstimateMaximum'Unit :: (GHC.Maybe.Maybe ShippingRateDeliveryEstimateMaximum'Unit'),
    -- | value: Must be greater than 0.
    shippingRateDeliveryEstimateMaximum'Value :: (GHC.Maybe.Maybe GHC.Types.Int)
  }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.Types.ToJSON.ToJSON ShippingRateDeliveryEstimateMaximum' where
  toJSON obj = Data.Aeson.Types.Internal.object ("unit" Data.Aeson.Types.ToJSON..= shippingRateDeliveryEstimateMaximum'Unit obj : "value" Data.Aeson.Types.ToJSON..= shippingRateDeliveryEstimateMaximum'Value obj : GHC.Base.mempty)
  toEncoding obj = Data.Aeson.Encoding.Internal.pairs (("unit" Data.Aeson.Types.ToJSON..= shippingRateDeliveryEstimateMaximum'Unit obj) GHC.Base.<> ("value" Data.Aeson.Types.ToJSON..= shippingRateDeliveryEstimateMaximum'Value obj))

instance Data.Aeson.Types.FromJSON.FromJSON ShippingRateDeliveryEstimateMaximum' where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "ShippingRateDeliveryEstimateMaximum'" (\obj -> (GHC.Base.pure ShippingRateDeliveryEstimateMaximum' GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "unit")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "value"))

-- | Create a new 'ShippingRateDeliveryEstimateMaximum'' with all required fields.
mkShippingRateDeliveryEstimateMaximum' :: ShippingRateDeliveryEstimateMaximum'
mkShippingRateDeliveryEstimateMaximum' =
  ShippingRateDeliveryEstimateMaximum'
    { shippingRateDeliveryEstimateMaximum'Unit = GHC.Maybe.Nothing,
      shippingRateDeliveryEstimateMaximum'Value = GHC.Maybe.Nothing
    }

-- | Defines the enum schema located at @components.schemas.shipping_rate_delivery_estimate.properties.maximum.anyOf.properties.unit@ in the specification.
--
-- A unit of time.
data ShippingRateDeliveryEstimateMaximum'Unit'
  = -- | This case is used if the value encountered during decoding does not match any of the provided cases in the specification.
    ShippingRateDeliveryEstimateMaximum'Unit'Other Data.Aeson.Types.Internal.Value
  | -- | This constructor can be used to send values to the server which are not present in the specification yet.
    ShippingRateDeliveryEstimateMaximum'Unit'Typed Data.Text.Internal.Text
  | -- | Represents the JSON value @"business_day"@
    ShippingRateDeliveryEstimateMaximum'Unit'EnumBusinessDay
  | -- | Represents the JSON value @"day"@
    ShippingRateDeliveryEstimateMaximum'Unit'EnumDay
  | -- | Represents the JSON value @"hour"@
    ShippingRateDeliveryEstimateMaximum'Unit'EnumHour
  | -- | Represents the JSON value @"month"@
    ShippingRateDeliveryEstimateMaximum'Unit'EnumMonth
  | -- | Represents the JSON value @"week"@
    ShippingRateDeliveryEstimateMaximum'Unit'EnumWeek
  deriving (GHC.Show.Show, GHC.Classes.Eq)

instance Data.Aeson.Types.ToJSON.ToJSON ShippingRateDeliveryEstimateMaximum'Unit' where
  toJSON (ShippingRateDeliveryEstimateMaximum'Unit'Other val) = val
  toJSON (ShippingRateDeliveryEstimateMaximum'Unit'Typed val) = Data.Aeson.Types.ToJSON.toJSON val
  toJSON (ShippingRateDeliveryEstimateMaximum'Unit'EnumBusinessDay) = "business_day"
  toJSON (ShippingRateDeliveryEstimateMaximum'Unit'EnumDay) = "day"
  toJSON (ShippingRateDeliveryEstimateMaximum'Unit'EnumHour) = "hour"
  toJSON (ShippingRateDeliveryEstimateMaximum'Unit'EnumMonth) = "month"
  toJSON (ShippingRateDeliveryEstimateMaximum'Unit'EnumWeek) = "week"

instance Data.Aeson.Types.FromJSON.FromJSON ShippingRateDeliveryEstimateMaximum'Unit' where
  parseJSON val =
    GHC.Base.pure
      ( if
            | val GHC.Classes.== "business_day" -> ShippingRateDeliveryEstimateMaximum'Unit'EnumBusinessDay
            | val GHC.Classes.== "day" -> ShippingRateDeliveryEstimateMaximum'Unit'EnumDay
            | val GHC.Classes.== "hour" -> ShippingRateDeliveryEstimateMaximum'Unit'EnumHour
            | val GHC.Classes.== "month" -> ShippingRateDeliveryEstimateMaximum'Unit'EnumMonth
            | val GHC.Classes.== "week" -> ShippingRateDeliveryEstimateMaximum'Unit'EnumWeek
            | GHC.Base.otherwise -> ShippingRateDeliveryEstimateMaximum'Unit'Other val
      )

-- | Defines the object schema located at @components.schemas.shipping_rate_delivery_estimate.properties.minimum.anyOf@ in the specification.
--
-- The lower bound of the estimated range. If empty, represents no lower bound.
data ShippingRateDeliveryEstimateMinimum' = ShippingRateDeliveryEstimateMinimum'
  { -- | unit: A unit of time.
    shippingRateDeliveryEstimateMinimum'Unit :: (GHC.Maybe.Maybe ShippingRateDeliveryEstimateMinimum'Unit'),
    -- | value: Must be greater than 0.
    shippingRateDeliveryEstimateMinimum'Value :: (GHC.Maybe.Maybe GHC.Types.Int)
  }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.Types.ToJSON.ToJSON ShippingRateDeliveryEstimateMinimum' where
  toJSON obj = Data.Aeson.Types.Internal.object ("unit" Data.Aeson.Types.ToJSON..= shippingRateDeliveryEstimateMinimum'Unit obj : "value" Data.Aeson.Types.ToJSON..= shippingRateDeliveryEstimateMinimum'Value obj : GHC.Base.mempty)
  toEncoding obj = Data.Aeson.Encoding.Internal.pairs (("unit" Data.Aeson.Types.ToJSON..= shippingRateDeliveryEstimateMinimum'Unit obj) GHC.Base.<> ("value" Data.Aeson.Types.ToJSON..= shippingRateDeliveryEstimateMinimum'Value obj))

instance Data.Aeson.Types.FromJSON.FromJSON ShippingRateDeliveryEstimateMinimum' where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "ShippingRateDeliveryEstimateMinimum'" (\obj -> (GHC.Base.pure ShippingRateDeliveryEstimateMinimum' GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "unit")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "value"))

-- | Create a new 'ShippingRateDeliveryEstimateMinimum'' with all required fields.
mkShippingRateDeliveryEstimateMinimum' :: ShippingRateDeliveryEstimateMinimum'
mkShippingRateDeliveryEstimateMinimum' =
  ShippingRateDeliveryEstimateMinimum'
    { shippingRateDeliveryEstimateMinimum'Unit = GHC.Maybe.Nothing,
      shippingRateDeliveryEstimateMinimum'Value = GHC.Maybe.Nothing
    }

-- | Defines the enum schema located at @components.schemas.shipping_rate_delivery_estimate.properties.minimum.anyOf.properties.unit@ in the specification.
--
-- A unit of time.
data ShippingRateDeliveryEstimateMinimum'Unit'
  = -- | This case is used if the value encountered during decoding does not match any of the provided cases in the specification.
    ShippingRateDeliveryEstimateMinimum'Unit'Other Data.Aeson.Types.Internal.Value
  | -- | This constructor can be used to send values to the server which are not present in the specification yet.
    ShippingRateDeliveryEstimateMinimum'Unit'Typed Data.Text.Internal.Text
  | -- | Represents the JSON value @"business_day"@
    ShippingRateDeliveryEstimateMinimum'Unit'EnumBusinessDay
  | -- | Represents the JSON value @"day"@
    ShippingRateDeliveryEstimateMinimum'Unit'EnumDay
  | -- | Represents the JSON value @"hour"@
    ShippingRateDeliveryEstimateMinimum'Unit'EnumHour
  | -- | Represents the JSON value @"month"@
    ShippingRateDeliveryEstimateMinimum'Unit'EnumMonth
  | -- | Represents the JSON value @"week"@
    ShippingRateDeliveryEstimateMinimum'Unit'EnumWeek
  deriving (GHC.Show.Show, GHC.Classes.Eq)

instance Data.Aeson.Types.ToJSON.ToJSON ShippingRateDeliveryEstimateMinimum'Unit' where
  toJSON (ShippingRateDeliveryEstimateMinimum'Unit'Other val) = val
  toJSON (ShippingRateDeliveryEstimateMinimum'Unit'Typed val) = Data.Aeson.Types.ToJSON.toJSON val
  toJSON (ShippingRateDeliveryEstimateMinimum'Unit'EnumBusinessDay) = "business_day"
  toJSON (ShippingRateDeliveryEstimateMinimum'Unit'EnumDay) = "day"
  toJSON (ShippingRateDeliveryEstimateMinimum'Unit'EnumHour) = "hour"
  toJSON (ShippingRateDeliveryEstimateMinimum'Unit'EnumMonth) = "month"
  toJSON (ShippingRateDeliveryEstimateMinimum'Unit'EnumWeek) = "week"

instance Data.Aeson.Types.FromJSON.FromJSON ShippingRateDeliveryEstimateMinimum'Unit' where
  parseJSON val =
    GHC.Base.pure
      ( if
            | val GHC.Classes.== "business_day" -> ShippingRateDeliveryEstimateMinimum'Unit'EnumBusinessDay
            | val GHC.Classes.== "day" -> ShippingRateDeliveryEstimateMinimum'Unit'EnumDay
            | val GHC.Classes.== "hour" -> ShippingRateDeliveryEstimateMinimum'Unit'EnumHour
            | val GHC.Classes.== "month" -> ShippingRateDeliveryEstimateMinimum'Unit'EnumMonth
            | val GHC.Classes.== "week" -> ShippingRateDeliveryEstimateMinimum'Unit'EnumWeek
            | GHC.Base.otherwise -> ShippingRateDeliveryEstimateMinimum'Unit'Other val
      )
