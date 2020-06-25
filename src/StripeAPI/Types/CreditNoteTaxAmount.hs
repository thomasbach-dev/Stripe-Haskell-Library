{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

-- CHANGE WITH CAUTION: This is a generated code file generated by https://github.com/Haskell-OpenAPI-Code-Generator/Haskell-OpenAPI-Client-Code-Generator.

-- | Contains the types generated from the schema CreditNoteTaxAmount
module StripeAPI.Types.CreditNoteTaxAmount where

import qualified Data.Aeson
import qualified Data.Aeson as Data.Aeson.Types
import qualified Data.Aeson as Data.Aeson.Types.FromJSON
import qualified Data.Aeson as Data.Aeson.Types.ToJSON
import qualified Data.Aeson as Data.Aeson.Types.Internal
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
import qualified GHC.Generics
import qualified GHC.Int
import qualified GHC.Show
import qualified GHC.Types
import qualified StripeAPI.Common
import StripeAPI.Types.TaxRate
import qualified Prelude as GHC.Integer.Type
import qualified Prelude as GHC.Maybe

-- | Defines the data type for the schema credit_note_tax_amount
data CreditNoteTaxAmount
  = CreditNoteTaxAmount
      { -- | amount: The amount, in %s, of the tax.
        creditNoteTaxAmountAmount :: GHC.Types.Int,
        -- | inclusive: Whether this tax amount is inclusive or exclusive.
        creditNoteTaxAmountInclusive :: GHC.Types.Bool,
        -- | tax_rate: The tax rate that was applied to get this tax amount.
        creditNoteTaxAmountTaxRate :: CreditNoteTaxAmountTaxRate'Variants
      }
  deriving
    ( GHC.Show.Show,
      GHC.Classes.Eq
    )

instance Data.Aeson.ToJSON CreditNoteTaxAmount where
  toJSON obj = Data.Aeson.object ((Data.Aeson..=) "amount" (creditNoteTaxAmountAmount obj) : (Data.Aeson..=) "inclusive" (creditNoteTaxAmountInclusive obj) : (Data.Aeson..=) "tax_rate" (creditNoteTaxAmountTaxRate obj) : [])
  toEncoding obj = Data.Aeson.pairs ((Data.Aeson..=) "amount" (creditNoteTaxAmountAmount obj) GHC.Base.<> ((Data.Aeson..=) "inclusive" (creditNoteTaxAmountInclusive obj) GHC.Base.<> (Data.Aeson..=) "tax_rate" (creditNoteTaxAmountTaxRate obj)))

instance Data.Aeson.Types.FromJSON.FromJSON CreditNoteTaxAmount where
  parseJSON = Data.Aeson.Types.FromJSON.withObject "CreditNoteTaxAmount" (\obj -> ((GHC.Base.pure CreditNoteTaxAmount GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "amount")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "inclusive")) GHC.Base.<*> (obj Data.Aeson.Types.FromJSON..: "tax_rate"))

-- | Define the one-of schema credit_note_tax_amountTax_rate\'
--
-- The tax rate that was applied to get this tax amount.
data CreditNoteTaxAmountTaxRate'Variants
  = CreditNoteTaxAmountTaxRate'TaxRate TaxRate
  | CreditNoteTaxAmountTaxRate'Text Data.Text.Internal.Text
  deriving (GHC.Show.Show, GHC.Classes.Eq, GHC.Generics.Generic)

instance Data.Aeson.ToJSON CreditNoteTaxAmountTaxRate'Variants where
  toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions {Data.Aeson.Types.Internal.sumEncoding = Data.Aeson.Types.Internal.UntaggedValue}

instance Data.Aeson.FromJSON CreditNoteTaxAmountTaxRate'Variants where
  parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions {Data.Aeson.Types.Internal.sumEncoding = Data.Aeson.Types.Internal.UntaggedValue}
