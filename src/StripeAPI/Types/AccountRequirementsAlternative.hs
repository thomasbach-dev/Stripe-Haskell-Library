{-# LANGUAGE MultiWayIf #-}
-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.
{-# LANGUAGE OverloadedStrings #-}

-- | Contains the types generated from the schema AccountRequirementsAlternative
module StripeAPI.Types.AccountRequirementsAlternative where

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

-- | Defines the object schema located at @components.schemas.account_requirements_alternative@ in the specification.
data AccountRequirementsAlternative = AccountRequirementsAlternative
  { -- | alternative_fields_due: Fields that can be provided to satisfy all fields in \`original_fields_due\`.
    accountRequirementsAlternativeAlternativeFieldsDue :: ([Data.Text.Internal.Text]),
    -- | original_fields_due: Fields that are due and can be satisfied by providing all fields in \`alternative_fields_due\`.
    accountRequirementsAlternativeOriginalFieldsDue :: ([Data.Text.Internal.Text])
  }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.Types.ToJSON.ToJSON AccountRequirementsAlternative where
  toJSON obj = Data.Aeson.Types.Internal.object ("alternative_fields_due" Data.Aeson.Types.ToJSON..= accountRequirementsAlternativeAlternativeFieldsDue obj : "original_fields_due" Data.Aeson.Types.ToJSON..= accountRequirementsAlternativeOriginalFieldsDue obj : GHC.Base.mempty)
  toEncoding obj = Data.Aeson.Encoding.Internal.pairs (("alternative_fields_due" Data.Aeson.Types.ToJSON..= accountRequirementsAlternativeAlternativeFieldsDue obj) GHC.Base.<> ("original_fields_due" Data.Aeson.Types.ToJSON..= accountRequirementsAlternativeOriginalFieldsDue obj))

instance Data.Aeson.Types.FromJSON.FromJSON AccountRequirementsAlternative where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "AccountRequirementsAlternative" (\obj -> (GHC.Base.pure AccountRequirementsAlternative GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "alternative_fields_due")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "original_fields_due"))

-- | Create a new 'AccountRequirementsAlternative' with all required fields.
mkAccountRequirementsAlternative ::
  -- | 'accountRequirementsAlternativeAlternativeFieldsDue'
  [Data.Text.Internal.Text] ->
  -- | 'accountRequirementsAlternativeOriginalFieldsDue'
  [Data.Text.Internal.Text] ->
  AccountRequirementsAlternative
mkAccountRequirementsAlternative accountRequirementsAlternativeAlternativeFieldsDue accountRequirementsAlternativeOriginalFieldsDue =
  AccountRequirementsAlternative
    { accountRequirementsAlternativeAlternativeFieldsDue = accountRequirementsAlternativeAlternativeFieldsDue,
      accountRequirementsAlternativeOriginalFieldsDue = accountRequirementsAlternativeOriginalFieldsDue
    }
