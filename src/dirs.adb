
package body Dirs is
   procedure Exists (Name : String; Result : out Boolean) with SPARK_Mode => Off is
   begin
      Result := Ada.Directories.Exists (Name);
   end Exists;
end Dirs;
