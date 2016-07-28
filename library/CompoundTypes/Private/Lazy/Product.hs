module CompoundTypes.Private.Lazy.Product where


data Product2 a b =
  Product2 a b

data Product3 a b c =
  Product3 a b c

data Product4 a b c d =
  Product4 a b c d

data Product5 a b c d e =
  Product5 a b c d e

-- |
-- Automatically derives the product-type of the according arity
-- from expressions such as:
-- 
-- > (Int * Char * Bool)
-- 
-- In that case it will resolve to:
-- 
-- > Product3 Int Char Bool
type family (*) a b where
  Product4 v1 v2 v3 v4 * v5 =
    Product5 v1 v2 v3 v4 v5
  Product3 v1 v2 v3 * Product2 v4 v5 =
    Product5 v1 v2 v3 v4 v5
  Product3 v1 v2 v3 * v4 =
    Product4 v1 v2 v3 v4
  Product2 v1 v2 * Product3 v3 v4 v5 =
    Product5 v1 v2 v3 v4 v5
  Product2 v1 v2 * Product2 v3 v4 =
    Product4 v1 v2 v3 v4
  Product2 v1 v2 * v3 =
    Product3 v1 v2 v3
  v1 * Product4 v2 v3 v4 v5 =
    Product5 v1 v2 v3 v4 v5
  v1 * Product3 v2 v3 v4 =
    Product4 v1 v2 v3 v4
  v1 * Product2 v2 v3 =
    Product3 v1 v2 v3
  v1 * v2 =
    Product2 v1 v2

infixl 1 *
