import 'package:flutter/material.dart';
import 'package:tdd_starter/core/global/app_global.dart';

class AppSnackBar {
  static Future<void> show({
    required String title,
    required String description,
    double verticalMargin = 12,
    double horizontalMargin = 12,
    int durationInSecond = 5,
    IconData icon = Icons.warning_rounded,
  }) async {
    BuildContext context = AppGlobal.navigatorKey.currentState!.context;
    ThemeData themeData = Theme.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: themeData.colorScheme.onPrimary,
        duration: Duration(seconds: durationInSecond),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.symmetric(
            vertical: verticalMargin, horizontal: horizontalMargin),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge!.apply(
                        color: themeData.colorScheme.outline,
                      ),
                ),
                Icon(
                  icon,
                  size: 20,
                  color: themeData.colorScheme.primary,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: themeData.colorScheme.outlineVariant,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
