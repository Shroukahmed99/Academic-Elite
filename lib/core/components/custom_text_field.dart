
import 'package:academic_elite/core/extensions/theme_extension.dart';
import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.controller,

    // Title
    this.title,
    this.titleColor,
    this.requiredField = false,
    this.helperText,
    this.counterText,

    // Text
    this.hintText,
    this.validator,
    this.onChanged,
    this.onSubmitted,

    // Icons
    this.prefixIcon,
    this.suffixIcon,

    // Behavior
    this.isPassword = false,
    this.keyboardType,
    this.textInputAction,
    this.enabled,
    this.maxLines,
    this.focusNode,
    this.onTap,
    this.readOnly = false,
    this.autofocus = false,

    // Style
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.style,
    this.hintStyle,
    this.contentPadding,
    this.fillColor,

    // Borders
    this.enabledBorder,
    this.focusedBorder,
    this.disabledBorder,
    this.errorBorder,
    this.focusedErrorBorder,
  });

  final TextEditingController? controller;

  /// Title
  final String? title;
  final Color? titleColor;
  final bool requiredField;
  final String? helperText;
  final String? counterText;

  /// Text
  final String? hintText;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  /// Icons
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  /// Behavior
  final bool isPassword;
  final bool autofocus;
  final bool readOnly;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool? enabled;
  final int? maxLines;
  final FocusNode? focusNode;
  final VoidCallback? onTap;

  /// Style
  final TextAlign textAlign;
  final TextDirection? textDirection;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;

  /// Borders
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? disabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;

  @override
  State<CustomTextField> createState() =>
      _CustomTextFieldState();
}

class _CustomTextFieldState
    extends State<CustomTextField> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = widget.enabled ?? true;

    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...[
          Row(
            children: [
              Text(
                widget.title!,
                style: context.textTheme.titleMedium?.copyWith(
                  color: widget.titleColor ??
                      context.textTheme.titleMedium?.color,
                ),
              ),
              if (widget.requiredField)
                Text(
                  ' *',
                  style: context.textTheme.titleMedium?.copyWith(
                    color:
                        context.theme.colorScheme.error,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
          SizedBox(
            height: AppSizes.h(8),
          ),
        ],

        TextFormField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          readOnly: widget.readOnly,
          onTap: widget.onTap,
          enabled: isEnabled,
          maxLines: widget.maxLines ?? 1,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          validator: widget.validator,
          onChanged:
              isEnabled ? widget.onChanged : null,
          onFieldSubmitted:
              isEnabled
                  ? widget.onSubmitted
                  : null,
          obscureText:
              widget.isPassword ? _obscure : false,
          cursorColor:
              context.theme.colorScheme.primary,
          textAlign: widget.textAlign,
          textDirection: widget.textDirection,
          style: widget.style ??
              context.textTheme.bodyMedium?.copyWith(
                fontSize: AppSizes.sp14,
                color: isEnabled
                    ? context
                        .textTheme.bodyLarge?.color
                    : context.theme.hintColor,
              ),
          decoration: InputDecoration(
            contentPadding:
                widget.contentPadding ??
                    EdgeInsets.symmetric(
                      horizontal: AppSizes.p12,
                      vertical: AppSizes.h(16),
                    ),

            hintText: widget.hintText,

            hintStyle:
                widget.hintStyle ??
                    context.textTheme.bodyMedium
                        ?.copyWith(
                          color:
                              context.theme.hintColor,
                          fontSize:
                              AppSizes.sp14,
                        ),

            filled: true,

            fillColor:
                widget.fillColor ??
                    (isEnabled
                        ? context
                            .theme
                            .inputDecorationTheme
                            .fillColor
                        : context.theme
                            .scaffoldBackgroundColor),

            prefixIcon: widget.prefixIcon,

            prefixIconConstraints:
                const BoxConstraints(
                  minWidth: 48,
                  minHeight: 48,
                ),

            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _obscure = !_obscure;
                      });
                    },
                    icon: Icon(
                      _obscure
                          ? Icons
                              .visibility_off_outlined
                          : Icons
                              .visibility_outlined,
                      color: context
                          .theme.iconTheme.color,
                    ),
                  )
                : widget.suffixIcon,

            suffixIconConstraints:
                const BoxConstraints(
                  minWidth: 48,
                  minHeight: 48,
                ),

            enabledBorder:
                widget.enabledBorder ??
                    OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                        AppSizes.r12,
                      ),
                      borderSide: BorderSide(
                        color: context
                            .theme.dividerColor,
                        width: 1.2,
                      ),
                    ),

            focusedBorder:
                widget.focusedBorder ??
                    OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                        AppSizes.r12,
                      ),
                      borderSide: BorderSide(
                        color: context.theme
                            .colorScheme.primary,
                        width: 1.4,
                      ),
                    ),

            disabledBorder:
                widget.disabledBorder ??
                    OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                        AppSizes.r12,
                      ),
                      borderSide: BorderSide(
                        color: context
                            .theme.dividerColor,
                      ),
                    ),

            errorBorder:
                widget.errorBorder ??
                    OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                        AppSizes.r12,
                      ),
                      borderSide: BorderSide(
                        color: context.theme
                            .colorScheme.error,
                      ),
                    ),

            focusedErrorBorder:
                widget.focusedErrorBorder ??
                    OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                        AppSizes.r12,
                      ),
                      borderSide: BorderSide(
                        color: context.theme
                            .colorScheme.error,
                        width: 1.4,
                      ),
                    ),
          ),
        ),

        if (widget.helperText != null ||
            widget.counterText != null) ...[
          SizedBox(
            height: AppSizes.h(6),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.helperText ?? '',
                  style:
                      context.textTheme.bodySmall,
                ),
              ),
              if (widget.counterText != null)
                Text(
                  widget.counterText!,
                  style:
                      context.textTheme.bodySmall,
                ),
            ],
          ),
        ],
      ],
    );
  }
}