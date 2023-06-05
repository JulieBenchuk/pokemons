part of core_ui;

final greenTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.black45,
      titleTextStyle: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.w500,
          letterSpacing: 1,
          fontSize: 24),
    ),
    dividerTheme: const DividerThemeData(color: Colors.white10),
    iconTheme: const IconThemeData(color: Colors.white),
    scaffoldBackgroundColor: Colors.teal,
    useMaterial3: true,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.white70,
        fontWeight: FontWeight.w400,
        fontSize: 22,
      ),
      bodyLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 34,
      ),
    ));
