import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio_flutter/shared/theme/style_manager.dart';
import 'package:my_portfolio_flutter/shared/utils/device_utils.dart';
import 'package:my_portfolio_flutter/shared/utils/responsive_padding.dart';

import 'color_manager.dart';

ThemeData getApplicationThemeLight(BuildContext context) {
  return ThemeData(
    useMaterial3: true,
    primaryColor: ColorManager.primary,
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: GoogleFonts.poppins().fontFamily,
    canvasColor: ColorManager.whiteColor,
    scaffoldBackgroundColor: ColorManager.whiteColor,
    iconTheme: IconThemeData(
      color: ColorManager.secondary,
      size: DeviceUtils(context).isMobile ? 18.h : context.responsiveHeight(18),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      },
    ),
    dividerColor: ColorManager.expansionTileDivider,
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      // toolbarHeight: KHeight.h230,
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(
        color: ColorManager.secondary,
        size: 25,
      ),
      actionsIconTheme: const IconThemeData(
        color: ColorManager.secondary,
        size: 25,
      ),
      elevation: 0,
      centerTitle: false,
      titleTextStyle: getSemiBoldStyle(
        color: ColorManager.secondary,
        fontSize: DeviceUtils(context).isMobile
            ? 18.sp
            : context.responsiveFontSize(18),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: ColorManager.whiteColor,
      surfaceTintColor: ColorManager.whiteColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 15,
      ),
      fillColor: ColorManager.whiteColor,
      hintStyle: getRegularStyle(
        color: ColorManager.greyTextColor,
        fontSize: DeviceUtils(context).isMobile
            ? 14.sp
            : context.responsiveFontSize(14),
      ),
      errorStyle: getRegularStyle(
        color: ColorManager.red,
        fontSize: DeviceUtils(context).isMobile
            ? 14.sp
            : context.responsiveFontSize(14),
      ),
      prefixIconColor: ColorManager.secondary,
      focusColor: ColorManager.whiteColor,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: ColorManager.primary,
          width: 1,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: ColorManager.primary,
          width: 1,
        ),
      ),
    ),
    cardTheme: CardTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: ColorManager.whiteColor,
      shadowColor: ColorManager.whiteColor,
    ),
    timePickerTheme: TimePickerThemeData(
      helpTextStyle: getRegularStyle(color: ColorManager.secondary),
      dayPeriodTextStyle: getRegularStyle(color: ColorManager.secondary),
      hourMinuteTextStyle: getRegularStyle(color: ColorManager.secondary),
      dayPeriodColor: ColorManager.primary,
      entryModeIconColor: ColorManager.primary,
      dialTextStyle: TextStyle(
        fontSize: DeviceUtils(context).isMobile
            ? 10.sp
            : context.responsiveFontSize(10),
      ),
      timeSelectorSeparatorColor:
          WidgetStateProperty.all(ColorManager.whiteColor),
      backgroundColor: ColorManager.whiteColor,
      hourMinuteTextColor: ColorManager.secondary,
      hourMinuteColor: ColorManager.whiteColor,
      dayPeriodTextColor: ColorManager.secondary,
      dialHandColor: ColorManager.primary,
      dialBackgroundColor: Colors.transparent,
      dialTextColor: ColorManager.secondary,
    ),
    datePickerTheme: DatePickerThemeData(
      surfaceTintColor: ColorManager.whiteColor,
      weekdayStyle: getRegularStyle(color: ColorManager.secondary),
      dayForegroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return ColorManager.greyTextColor;
        }
        return ColorManager.secondary;
      }),
      yearForegroundColor: WidgetStateProperty.all(ColorManager.secondary),
      todayForegroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return ColorManager.whiteColor;
        }
        return ColorManager.secondary;
      }),
      todayBackgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return ColorManager.primary;
        }
        return Colors.transparent;
      }),
      headerBackgroundColor: ColorManager.primary,
      dividerColor: ColorManager.lightGreyColor,
      headerHelpStyle: getRegularStyle(
        color: ColorManager.whiteColor,
        fontSize: DeviceUtils(context).isMobile
            ? 14.sp
            : context.responsiveFontSize(14),
      ),
      dayStyle: getRegularStyle(
        color: ColorManager.secondary,
      ),
      headerHeadlineStyle: getSemiBoldStyle(
        color: ColorManager.whiteColor,
        fontSize: DeviceUtils(context).isMobile
            ? 18.sp
            : context.responsiveFontSize(18),
      ),
      rangeSelectionBackgroundColor: ColorManager.whiteColor,
      rangePickerHeaderBackgroundColor: ColorManager.primary,
      rangePickerHeaderForegroundColor: ColorManager.whiteColor,

      rangePickerBackgroundColor: ColorManager.whiteColor,

      // rangePickerShape: ,
      rangePickerHeaderHelpStyle: TextStyle(
        color: ColorManager.primary,
        fontSize: DeviceUtils(context).isMobile
            ? 18.sp
            : context.responsiveFontSize(18),
      ),
      rangePickerHeaderHeadlineStyle: TextStyle(
        color: ColorManager.secondary,
        fontSize: DeviceUtils(context).isMobile
            ? 18.sp
            : context.responsiveFontSize(18),
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      //white text
      displayLarge: getExtraBoldStyle(color: ColorManager.whiteColor),
      displayMedium: getMediumStyle(color: ColorManager.whiteColor),
      displaySmall: getRegularStyle(color: ColorManager.whiteColor),
      headlineLarge: getSemiBoldStyle(color: ColorManager.whiteColor),
      headlineSmall: getLightStyle(
        color: ColorManager.whiteColor,
        fontSize: DeviceUtils(context).isMobile
            ? 15.sp
            : context.responsiveFontSize(15),
      ),

      //black text
      headlineMedium: getMediumStyle(
        color: ColorManager.secondary,
        fontSize: DeviceUtils(context).isMobile
            ? 14.sp
            : context.responsiveFontSize(14),
      ),
      titleLarge: getBoldStyle(color: ColorManager.secondary),
      titleMedium: getSemiBoldStyle(
        color: ColorManager.secondary,
        fontSize: DeviceUtils(context).isMobile
            ? 15.sp
            : context.responsiveFontSize(15),
      ),
      titleSmall: getRegularStyle(color: ColorManager.secondary),

      //grey text
      labelLarge: getMediumStyle(color: ColorManager.greyTextColor),
      labelMedium: getRegularStyle(color: ColorManager.greyTextColor),
      labelSmall: getLightStyle(color: ColorManager.greyTextColor),

      //red
      bodyLarge: getRegularStyle(
        color: ColorManager.primary,
        fontSize: DeviceUtils(context).isMobile
            ? 9.sp
            : context.responsiveFontSize(9),
      ),

      //black shade - input text colo=
      bodyMedium: getRegularStyle(
        color: ColorManager.textFieldTextColor,
        fontSize: DeviceUtils(context).isMobile
            ? 12.sp
            : context.responsiveFontSize(12),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorManager.whiteColor,
      elevation: 0,
      selectedItemColor: ColorManager.primary,
      unselectedItemColor: ColorManager.secondary,
      selectedLabelStyle: getRegularStyle(
        color: ColorManager.primary,
        fontSize: DeviceUtils(context).isMobile
            ? 11.sp
            : context.responsiveFontSize(11),
      ),
      unselectedLabelStyle: getRegularStyle(
        color: ColorManager.secondary,
        fontSize: DeviceUtils(context).isMobile
            ? 11.sp
            : context.responsiveFontSize(11),
      ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),
    colorScheme: const ColorScheme.light(
      primary: ColorManager.primary,
      secondary: ColorManager.secondary,
      surface: ColorManager.whiteColor,
      error: ColorManager.primary,
      onSecondary: ColorManager.whiteColor,
      outline: ColorManager.expansionTileDivider,
      inverseSurface: ColorManager.darkGrey,
      onSurface: ColorManager.greyTextColor,
    ),
    tabBarTheme: TabBarTheme(
      dividerColor: Colors.transparent,
      indicator: const BubbleTabIndicator(
        indicatorHeight: 22,
        tabBarIndicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: ColorManager.primary,
        indicatorRadius: 5,
        insets: EdgeInsets.zero,
        padding: EdgeInsets.zero,
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: ColorManager.whiteColor,
      labelStyle: getRegularStyle(
        color: ColorManager.whiteColor,
      ).copyWith(fontWeight: FontWeight.w500),
      unselectedLabelColor: ColorManager.secondary,
      unselectedLabelStyle: getRegularStyle(
        color: ColorManager.whiteColor,
      ).copyWith(fontWeight: FontWeight.w500),
      labelPadding: EdgeInsets.zero,
    ),
  );
}
