-----------------------------------------------------------------------------
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings #-}
-----------------------------------------------------------------------------
module THREE.MeshLambertMaterial
  ( -- * Types
    MeshLambertMaterial (..)
    -- * Constructors
  , THREE.MeshLambertMaterial.new
    -- * Read-only Properties
    -- * Properties
    -- * Optional properties
  , getMatOpt
  , setMatOpt
    -- * Methods
    -- * Helper functions
  ) where
-----------------------------------------------------------------------------
import           Language.Javascript.JSaddle
-----------------------------------------------------------------------------
import           THREE.Internal as THREE
import           THREE.Material as THREE
import           THREE.Texture as THREE
-----------------------------------------------------------------------------
-- | https://threejs.org/docs/#api/en/materials/MeshLambertMaterial
newtype MeshLambertMaterial
  = MeshLambertMaterial
  { unMeshLambertMaterial :: JSVal
  } deriving (MakeArgs, MakeObject, ToJSVal) 
    deriving newtype MaterialC
-----------------------------------------------------------------------------
-- Constructors
-----------------------------------------------------------------------------
new :: JSM MeshLambertMaterial
new = THREE.new' MeshLambertMaterial "MeshLambertMaterial" ()
-----------------------------------------------------------------------------
-- Read-only properties
-----------------------------------------------------------------------------
-- Properties
-----------------------------------------------------------------------------
-- Optional properties
-----------------------------------------------------------------------------
getMatOpt :: MeshLambertMaterial -> JSM (Maybe Texture)
getMatOpt = mkGetOpt "map"
-----------------------------------------------------------------------------
setMatOpt :: Maybe Texture -> MeshLambertMaterial -> JSM ()
setMatOpt = mkSetOpt "map"
-----------------------------------------------------------------------------
-- Methods
-----------------------------------------------------------------------------
-- Helper functions
-----------------------------------------------------------------------------
