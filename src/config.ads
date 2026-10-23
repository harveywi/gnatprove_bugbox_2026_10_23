package Config is
   Max_Width : constant Natural := 1920;
   Max_Height : constant Natural := 1080;

   --  Camera configuration. The fictional `Potrzebie` format here can be
   --  imagined as some format that doesn't obviously correspond to some
   --  small number of bytes, so designing a buffer for it could be considered
   --  nontrivial.
   type Pixel_Format_Type is (Gray8, BGR8, RGB8, Potrzebie);
   type Camera_Config_Type is record
      Width : Natural;
      Height : Natural;
      Pixel_Format : Pixel_Format_Type;
   end record;

   --  (Fictional) configuration for a camera classifier. It's optional: If this
   --  information isn't in the config file, the application doesn't do image
   --  classification.
   type Camera_Classifier_Config_Type (Has_Value : Boolean := False) is record
      F0, F1, F2, G0, G1, G2 : Float;
   end record;

   --  Finally, the (fictional) application configuration.
   type App_Config_Type is record
      Camera_Config : Camera_Config_Type;
      Camera_Classifier_Config : Camera_Classifier_Config_Type;
   end record;
end Config;