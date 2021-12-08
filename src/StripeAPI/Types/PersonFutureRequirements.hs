{-# LANGUAGE MultiWayIf #-}
-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.
{-# LANGUAGE OverloadedStrings #-}

-- | Contains the types generated from the schema PersonFutureRequirements
module StripeAPI.Types.PersonFutureRequirements where

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
import {-# SOURCE #-} StripeAPI.Types.AccountRequirementsAlternative
import {-# SOURCE #-} StripeAPI.Types.AccountRequirementsError
import qualified Prelude as GHC.Integer.Type
import qualified Prelude as GHC.Maybe

-- | Defines the object schema located at @components.schemas.person_future_requirements@ in the specification.
data PersonFutureRequirements = PersonFutureRequirements
  { -- | alternatives: Fields that are due and can be satisfied by providing the corresponding alternative fields instead.
    personFutureRequirementsAlternatives :: (GHC.Maybe.Maybe ([AccountRequirementsAlternative])),
    -- | currently_due: Fields that need to be collected to keep the person\'s account enabled. If not collected by the account\'s \`future_requirements[current_deadline]\`, these fields will transition to the main \`requirements\` hash, and may immediately become \`past_due\`, but the account may also be given a grace period depending on the account\'s enablement state prior to transition.
    personFutureRequirementsCurrentlyDue :: ([Data.Text.Internal.Text]),
    -- | errors: Fields that are \`currently_due\` and need to be collected again because validation or verification failed.
    personFutureRequirementsErrors :: ([AccountRequirementsError]),
    -- | eventually_due: Fields that need to be collected assuming all volume thresholds are reached. As they become required, they appear in \`currently_due\` as well, and the account\'s \`future_requirements[current_deadline]\` becomes set.
    personFutureRequirementsEventuallyDue :: ([Data.Text.Internal.Text]),
    -- | past_due: Fields that weren\'t collected by the account\'s \`requirements.current_deadline\`. These fields need to be collected to enable the person\'s account. New fields will never appear here; \`future_requirements.past_due\` will always be a subset of \`requirements.past_due\`.
    personFutureRequirementsPastDue :: ([Data.Text.Internal.Text]),
    -- | pending_verification: Fields that may become required depending on the results of verification or review. Will be an empty array unless an asynchronous verification is pending. If verification fails, these fields move to \`eventually_due\` or \`currently_due\`.
    personFutureRequirementsPendingVerification :: ([Data.Text.Internal.Text])
  }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.Types.ToJSON.ToJSON PersonFutureRequirements where
  toJSON obj = Data.Aeson.Types.Internal.object ("alternatives" Data.Aeson.Types.ToJSON..= personFutureRequirementsAlternatives obj : "currently_due" Data.Aeson.Types.ToJSON..= personFutureRequirementsCurrentlyDue obj : "errors" Data.Aeson.Types.ToJSON..= personFutureRequirementsErrors obj : "eventually_due" Data.Aeson.Types.ToJSON..= personFutureRequirementsEventuallyDue obj : "past_due" Data.Aeson.Types.ToJSON..= personFutureRequirementsPastDue obj : "pending_verification" Data.Aeson.Types.ToJSON..= personFutureRequirementsPendingVerification obj : GHC.Base.mempty)
  toEncoding obj = Data.Aeson.Encoding.Internal.pairs (("alternatives" Data.Aeson.Types.ToJSON..= personFutureRequirementsAlternatives obj) GHC.Base.<> (("currently_due" Data.Aeson.Types.ToJSON..= personFutureRequirementsCurrentlyDue obj) GHC.Base.<> (("errors" Data.Aeson.Types.ToJSON..= personFutureRequirementsErrors obj) GHC.Base.<> (("eventually_due" Data.Aeson.Types.ToJSON..= personFutureRequirementsEventuallyDue obj) GHC.Base.<> (("past_due" Data.Aeson.Types.ToJSON..= personFutureRequirementsPastDue obj) GHC.Base.<> ("pending_verification" Data.Aeson.Types.ToJSON..= personFutureRequirementsPendingVerification obj))))))

instance Data.Aeson.Types.FromJSON.FromJSON PersonFutureRequirements where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "PersonFutureRequirements" (\obj -> (((((GHC.Base.pure PersonFutureRequirements GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..:? "alternatives")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "currently_due")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "errors")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "eventually_due")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "past_due")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "pending_verification"))

-- | Create a new 'PersonFutureRequirements' with all required fields.
mkPersonFutureRequirements ::
  -- | 'personFutureRequirementsCurrentlyDue'
  [Data.Text.Internal.Text] ->
  -- | 'personFutureRequirementsErrors'
  [AccountRequirementsError] ->
  -- | 'personFutureRequirementsEventuallyDue'
  [Data.Text.Internal.Text] ->
  -- | 'personFutureRequirementsPastDue'
  [Data.Text.Internal.Text] ->
  -- | 'personFutureRequirementsPendingVerification'
  [Data.Text.Internal.Text] ->
  PersonFutureRequirements
mkPersonFutureRequirements personFutureRequirementsCurrentlyDue personFutureRequirementsErrors personFutureRequirementsEventuallyDue personFutureRequirementsPastDue personFutureRequirementsPendingVerification =
  PersonFutureRequirements
    { personFutureRequirementsAlternatives = GHC.Maybe.Nothing,
      personFutureRequirementsCurrentlyDue = personFutureRequirementsCurrentlyDue,
      personFutureRequirementsErrors = personFutureRequirementsErrors,
      personFutureRequirementsEventuallyDue = personFutureRequirementsEventuallyDue,
      personFutureRequirementsPastDue = personFutureRequirementsPastDue,
      personFutureRequirementsPendingVerification = personFutureRequirementsPendingVerification
    }
