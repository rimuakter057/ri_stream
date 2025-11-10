import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'firebase_options.dart';


ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);


void main() async {
  // 1. Ensure Flutter binding
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Initialize Firebase properly
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 3. (Optional but recommended) Ensure Firebase initialization errors are visible
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
  };

  // 4. Run app inside DevicePreview (if not release)
  runApp(
    const MyApp(),
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => const MyApp(),
    // ),
  );
}





// void main()async {
// // 1. Ensure Flutter binding is initialized
//   WidgetsFlutterBinding.ensureInitialized();
//
//   // 2. Initialize Firebase with platform-specific options
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform, // <-- Key correction here
//   );
//
//
//   runApp(
//     DevicePreview(
//       enabled: !kReleaseMode,
//       builder: (context) => const MyApp(),
//     ),
//   );
// }


