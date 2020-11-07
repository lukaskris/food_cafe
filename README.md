# food_cafe

0) Path set java: Path - still bin

1) flutter pub pub run flutter_automation --android-sign
2) CN="Kamlesh Lakhani", OU=1, O=jdkgroup, L=Ahmedabad, S=Gujarat, C=91

3) keytool -list -v -keystore C:/Users/Kamlesh/AndroidStudioProjects/food_cafe\keys/keystore.jks -alias food_cafe -storepass food_cafe -keypass food_cafe

4)
  Debug
  12:7B:3B:C3:C6:B7:45:24:0C:4E:36:AE:2E:D4:40:47:C8:A3:03:E6
  32:FA:B8:6F:0D:D4:56:4B:63:89:4A:DD:EF:49:D7:ED

  Release
  68:D1:6B:62:50:AA:E3:16:6E:5E:D7:77:0C:AD:5D:94:8C:AA:13:B0
  03:7C:6E:FE:CF:E2:09:8C:70:BB:15:DF:59:C2:2A:D1

6) com.jdkgroup.food_cafe


LOGIC PART
1) Preparation Time login
   if value % 10 == 0 value selected display else unselect