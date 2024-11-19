import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_example/firebase_options.dart';
import 'package:flutter_example/utils/config.dart';
import 'package:flutter_example/utils/router_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart';

class RiverpodLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    debugPrint('''
RIVERPOD>>
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "oldValue": "$previousValue",
  "newValue": "$newValue"
}''');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  KakaoSdk.init(
    nativeAppKey: Config().nativeAppKey,
    javaScriptAppKey: Config().javascriptAppKey,
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(observers: [RiverpodLogger()], child: const MyApp()));
}

class MyApp extends StatefulHookConsumerWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // scaffoldBackgroundColor: AppColors.whiteColor,
        // colorScheme: ColorScheme.fromSeed(seedColor: AppColors.whiteColor),
        // popupMenuTheme: PopupMenuThemeData(
        //   color: AppColors.whiteColor, // Background color
        //   textStyle: const TextStyle(color: AppColors.whiteColor), // Text color
        //   elevation: 4, // Elevation
        //   shadowColor: Colors.black.withOpacity(0.6), // Shadow color
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(12), // Border radius
        //   ),
        // ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          titleSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          labelSmall: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),

        scaffoldBackgroundColor: Colors.white,
        dialogBackgroundColor: Theme.of(context).colorScheme.surface,
        // buttonTheme: ButtonThemeData(
        //   buttonColor: const Color(0xFF7772AC),
        //   textTheme: ButtonTextTheme.primary,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(5),
        //   ),
        // ),

        dividerColor: const Color(0xffe0e0e0),
        colorScheme: ColorScheme.fromSeed(
          surfaceBright: Colors.blue,
          surfaceContainer: const Color(0xFFEBEBEB),
          seedColor: const Color(0xFF7772AC),
          // primary: Colors.blueAccent,
          primary: const Color(0XffDC143C),
          onPrimary: Colors.white,
          onPrimaryContainer: const Color(0xFF4B5A76),
          primaryContainer: const Color(0xFFEFEFF9),
          surface: const Color.fromARGB(255, 177, 177, 177),
          // onSurface: const Color(0xFFF4F9F8),
          onSecondary: const Color.fromARGB(255, 47, 47, 47),
          onSecondaryContainer: const Color(0xFFEFEEF9),
          onTertiaryContainer: const Color(0xFF7773AC),
          onTertiary: const Color(0xffF8BD26),
          error: const Color.fromARGB(255, 245, 64, 55),
          onSurfaceVariant: const Color(0xff746A8F),
          tertiary: const Color(0xFFDDf1ED),
          inversePrimary: const Color(0xFFD9D9D9),
          inverseSurface: const Color(0xFFEEEEEE),
        ),
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ko', 'KR'),
      ],
      routerConfig: ref.watch(routeProvider),
    );
  }
}
