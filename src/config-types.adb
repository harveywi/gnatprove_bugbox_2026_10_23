pragma Warnings (Off, "no Global contract available");

with GNAT.OS_Lib;
with Dirs;

package body Config.Types is
   function Load_Config return App_Config_Type is
      B : Boolean;
   begin
      Dirs.Exists ("cfg.txt", B);
      if B then
         return (
            Camera_Config => (Width => 1, Height => 1, Pixel_Format => Potrzebie),
            Camera_Classifier_Config => (Has_Value => False)
         );
      else
         GNAT.OS_Lib.OS_Exit (1);
      end if;
   exception
      when Dirs.Name_Error =>
         GNAT.OS_Lib.OS_Exit (1);
   end Load_Config;

end Config.Types;
