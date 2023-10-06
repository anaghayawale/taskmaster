import 'package:flutter/material.dart';

class Constants{
  static const String apiBaseUrl = 'https://taskmasterapp.vercel.app/api/';


  kSignupButtonColor() => const Color.fromARGB(80, 0, 112, 240);
  kSignupButtonTextColor() => const Color.fromARGB(255, 0, 112, 240);

  blackColor() => const Color.fromARGB(255, 0, 0, 0);
  greyColor() => const Color.fromARGB(255, 128, 128, 128);
  whiteColor() => const Color.fromARGB(255, 255, 255, 255);
  blueColor() => const Color.fromARGB(255, 122, 120, 189);
  pinkColor() => const Color.fromARGB(255, 232, 64, 120);
  yellowColor() => const Color.fromARGB(255,253, 197, 109);
  
  kErrorColor() => const Color.fromARGB(255, 255, 0, 0);
  kSuccessColor() => const Color.fromARGB(255, 0, 255, 0);

  kLoginButtonColor() => const Color.fromARGB(255, 232, 64, 120);
  kLoginButtonTextColor() => const Color.fromARGB(255, 255, 255, 255);

  kLogoutButtonColor() => const Color.fromARGB(255, 255, 0, 0);
  kLogoutButtonTextColor() => const Color.fromARGB(255, 255, 0, 0);
}