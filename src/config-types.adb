pragma Warnings (Off, "no Global contract available");

with GNAT.OS_Lib;
with Ada.Directories;

package body Config.Types is

   procedure Exists (Name : String; Result : out Boolean)
   with
      Exceptional_Cases => (Ada.Directories.Name_Error => True);

   procedure Exists (Name : String; Result : out Boolean) is
   begin
      Result := Ada.Directories.Exists (Name);
   end Exists;

   function Load_Config return App_Config_Type is
      B : Boolean;
   begin
      Exists ("cfg.txt", B);
      if B then
         return (
            Camera_Config => (Width => 1, Height => 1, Pixel_Format => Potrzebie),
            Camera_Classifier_Config => (Has_Value => False)
         );
      else
         GNAT.OS_Lib.OS_Exit (0);
      end if;
   exception
      when Ada.Directories.Name_Error =>
         GNAT.OS_Lib.OS_Exit (1);
   end Load_Config;

end Config.Types;
