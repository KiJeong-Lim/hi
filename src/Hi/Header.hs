module Hi.Header where

import Data.Unique

type Constructor = String

type MetaVar = Unique

type CoreBind var annot = (var, CoreTerm var annot)

type CoreAlts var annot = [((Constructor, [CoreBind var annot]), CoreTerm var annot)]

data TyUnivIdx
    = TUIZero
    | TUISucc TyUnivIdx
    | TUIMVar MetaVar
    deriving (Eq)

data Sort
    = SType TyUnivIdx
    | SProp
    deriving (Eq)

data CoreTerm var annot
    = CVar annot var
    | CCon annot Constructor
    | CApp annot (CoreTerm var annot) (CoreTerm var annot)
    | CLam annot (CoreBind var annot) (CoreTerm var annot)
    | CAll annot (CoreBind var annot) (CoreTerm var annot)
    | CMat annot (CoreTerm var annot) (CoreAlts var annot)
    | CSrt annot Sort
    | MVar annot MetaVar
    deriving (Eq)
