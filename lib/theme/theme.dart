import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4285747591),
      surfaceTint: Color(4285747591),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4294236671),
      onPrimaryContainer: Color(4281011007),
      secondary: Color(4284963182),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4293909749),
      onSecondaryContainer: Color(4280424233),
      tertiary: Color(4286665043),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294957786),
      onTertiaryContainer: Color(4281536531),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294965244),
      onSurface: Color(4280162848),
      onSurfaceVariant: Color(4283123021),
      outline: Color(4286346366),
      outlineVariant: Color(4291675086),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281544501),
      inversePrimary: Color(4292917494),
      primaryFixed: Color(4294236671),
      onPrimaryFixed: Color(4281011007),
      primaryFixedDim: Color(4292917494),
      onPrimaryFixedVariant: Color(4284103022),
      secondaryFixed: Color(4293909749),
      onSecondaryFixed: Color(4280424233),
      secondaryFixedDim: Color(4292067800),
      onSecondaryFixedVariant: Color(4283384405),
      tertiaryFixed: Color(4294957786),
      onTertiaryFixed: Color(4281536531),
      tertiaryFixedDim: Color(4294227897),
      onTertiaryFixedVariant: Color(4284889917),
      surfaceDim: Color(4292925407),
      surfaceBright: Color(4294965244),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294636025),
      surfaceContainer: Color(4294241267),
      surfaceContainerHigh: Color(4293912045),
      surfaceContainerHighest: Color(4293517543),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4283774314),
      surfaceTint: Color(4285747591),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4287260575),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4283121233),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4286476165),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4284561209),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4288309097),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965244),
      onSurface: Color(4280162848),
      onSurfaceVariant: Color(4282859849),
      outline: Color(4284767590),
      outlineVariant: Color(4286609538),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281544501),
      inversePrimary: Color(4292917494),
      primaryFixed: Color(4287260575),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4285550469),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4286476165),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4284831595),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4288309097),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4286467921),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292925407),
      surfaceBright: Color(4294965244),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294636025),
      surfaceContainer: Color(4294241267),
      surfaceContainerHigh: Color(4293912045),
      surfaceContainerHighest: Color(4293517543),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4281471814),
      surfaceTint: Color(4285747591),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4283774314),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280884783),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4283121233),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4282062618),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4284561209),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965244),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280754730),
      outline: Color(4282859849),
      outlineVariant: Color(4282859849),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281544501),
      inversePrimary: Color(4294567679),
      primaryFixed: Color(4283774314),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4282261330),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4283121233),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4281608250),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4284561209),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4282851620),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292925407),
      surfaceBright: Color(4294965244),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294636025),
      surfaceContainer: Color(4294241267),
      surfaceContainerHigh: Color(4293912045),
      surfaceContainerHighest: Color(4293517543),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4292917494),
      surfaceTint: Color(4292917494),
      onPrimary: Color(4282524502),
      primaryContainer: Color(4284103022),
      onPrimaryContainer: Color(4294236671),
      secondary: Color(4292067800),
      onSecondary: Color(4281871422),
      secondaryContainer: Color(4283384405),
      onSecondaryContainer: Color(4293909749),
      tertiary: Color(4294227897),
      onTertiary: Color(4283180327),
      tertiaryContainer: Color(4284889917),
      onTertiaryContainer: Color(4294957786),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279636503),
      onSurface: Color(4293517543),
      onSurfaceVariant: Color(4291675086),
      outline: Color(4288122520),
      outlineVariant: Color(4283123021),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293517543),
      inversePrimary: Color(4285747591),
      primaryFixed: Color(4294236671),
      onPrimaryFixed: Color(4281011007),
      primaryFixedDim: Color(4292917494),
      onPrimaryFixedVariant: Color(4284103022),
      secondaryFixed: Color(4293909749),
      onSecondaryFixed: Color(4280424233),
      secondaryFixedDim: Color(4292067800),
      onSecondaryFixedVariant: Color(4283384405),
      tertiaryFixed: Color(4294957786),
      onTertiaryFixed: Color(4281536531),
      tertiaryFixedDim: Color(4294227897),
      onTertiaryFixedVariant: Color(4284889917),
      surfaceDim: Color(4279636503),
      surfaceBright: Color(4282136637),
      surfaceContainerLowest: Color(4279242002),
      surfaceContainerLow: Color(4280162848),
      surfaceContainer: Color(4280426020),
      surfaceContainerHigh: Color(4281149486),
      surfaceContainerHighest: Color(4281873209),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4293246202),
      surfaceTint: Color(4292917494),
      onPrimary: Color(4280616250),
      primaryContainer: Color(4289233853),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4292330973),
      onSecondary: Color(4280095267),
      secondaryContainer: Color(4288383905),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294556605),
      onTertiary: Color(4281076494),
      tertiaryContainer: Color(4290347908),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279636503),
      onSurface: Color(4294965755),
      onSurfaceVariant: Color(4292004050),
      outline: Color(4289306794),
      outlineVariant: Color(4287201418),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293517543),
      inversePrimary: Color(4284169071),
      primaryFixed: Color(4294236671),
      onPrimaryFixed: Color(4280287284),
      primaryFixedDim: Color(4292917494),
      onPrimaryFixedVariant: Color(4282919260),
      secondaryFixed: Color(4293909749),
      onSecondaryFixed: Color(4279700766),
      secondaryFixedDim: Color(4292067800),
      onSecondaryFixedVariant: Color(4282266180),
      tertiaryFixed: Color(4294957786),
      onTertiaryFixed: Color(4280616713),
      tertiaryFixedDim: Color(4294227897),
      onTertiaryFixedVariant: Color(4283640365),
      surfaceDim: Color(4279636503),
      surfaceBright: Color(4282136637),
      surfaceContainerLowest: Color(4279242002),
      surfaceContainerLow: Color(4280162848),
      surfaceContainer: Color(4280426020),
      surfaceContainerHigh: Color(4281149486),
      surfaceContainerHighest: Color(4281873209),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294965755),
      surfaceTint: Color(4292917494),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4293246202),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294965755),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4292330973),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294965753),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4294556605),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279636503),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294965755),
      outline: Color(4292004050),
      outlineVariant: Color(4292004050),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293517543),
      inversePrimary: Color(4282063951),
      primaryFixed: Color(4294369279),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4293246202),
      onPrimaryFixedVariant: Color(4280616250),
      secondaryFixed: Color(4294238713),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4292330973),
      onSecondaryFixedVariant: Color(4280095267),
      tertiaryFixed: Color(4294959072),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4294556605),
      onTertiaryFixedVariant: Color(4281076494),
      surfaceDim: Color(4279636503),
      surfaceBright: Color(4282136637),
      surfaceContainerLowest: Color(4279242002),
      surfaceContainerLow: Color(4280162848),
      surfaceContainer: Color(4280426020),
      surfaceContainerHigh: Color(4281149486),
      surfaceContainerHighest: Color(4281873209),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
