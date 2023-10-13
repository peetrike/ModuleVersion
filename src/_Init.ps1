Add-Type -TypeDefinition @'
    namespace PW.ModuleVersion {
        [System.Flags]
        public enum Scope {
            None,
            CurrentUser,
            AllUsers
        }
    }
'@
