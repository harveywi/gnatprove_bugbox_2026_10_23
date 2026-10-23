with Ada.Directories;

package Dirs with Elaborate_Body is
   Name_Error : exception renames Ada.Directories.Name_Error;
   procedure Exists (Name : String; Result : out Boolean)
   with
      Inline,
      Always_Terminates,
      Exceptional_Cases => (Name_Error => True);
end Dirs;