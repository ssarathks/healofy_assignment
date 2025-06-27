import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final double? width;
  final double height;
  final TextStyle? textStyle;
  final bool isOutlined;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius = 25,
    this.padding = const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
    this.width,
    this.height = 50,
    this.textStyle,
    this.isOutlined = true,
  });

  @override
  Widget build(BuildContext context) {
    final buttonTextColor = textColor ?? (isOutlined ? AppColors.buttonText : AppColors.textLight);
    final buttonBackgroundColor = backgroundColor ?? 
        (isOutlined ? Colors.transparent : AppColors.primaryGreen);
    final buttonBorderColor = borderColor ?? AppColors.buttonBorder;

    return SizedBox(
      width: width,
      height: height,
      child: isOutlined
          ? OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                backgroundColor: buttonBackgroundColor,
                side: BorderSide(color: buttonBorderColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                padding: padding,
              ),
              child: Text(
                text,
                style: textStyle ?? TextStyle(
                  color: buttonTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonBackgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                padding: padding,
              ),
              child: Text(
                text,
                style: textStyle ?? TextStyle(
                  color: buttonTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
    );
  }
}