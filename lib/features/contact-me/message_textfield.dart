import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/shared/theme/color_manager.dart';
import 'package:my_portfolio_flutter/shared/utils/responsive_padding.dart';

import '../../shared/theme/theme_getters.dart';
import '../../shared/utils/type_def.dart';

class MessageTextField extends StatefulWidget {
  const MessageTextField({
    required this.messageController,
    required this.showMessageTitle,
    this.messageCharacterCount,
    this.validate,
    super.key,
    this.readOnly = false,
    this.showBorder = true,
    this.enabled = true,
    this.maxLines = 15,
    this.minLines = 10,
    this.contentPadding,
    this.onChanged,
    this.hintText,
    this.focusNode,
    this.messageTitle,
    this.keyboardType = TextInputType.multiline,
  });
  final bool showBorder;
  final int maxLines;
  final int minLines;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController messageController;
  final OnValidatorCallBack? validate;
  final OnChangedCallback? onChanged;
  final String? hintText;
  final ValueNotifier<String>? messageCharacterCount;
  final bool readOnly;
  final FocusNode? focusNode;
  final bool showMessageTitle;
  final bool enabled;
  final String? messageTitle;
  final TextInputType? keyboardType;
  @override
  State<MessageTextField> createState() => _MessageTextFieldState();
}

class _MessageTextFieldState extends State<MessageTextField> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showMessageTitle)
          Text(
            widget.messageTitle ?? "",
            style: textTheme(context).labelSmall?.copyWith(
                  color: ColorManager.whiteColor,
                ),
          ),
        SizedBox(
          height: context.responsiveHeight(10),
        ),
        TextFormField(
          scrollPadding: EdgeInsets.only(bottom: context.responsiveHeight(150)),
          enabled: widget.enabled,
          minLines: widget.minLines,
          readOnly: widget.readOnly,
          maxLines: widget.maxLines,
          controller: widget.messageController,
          validator: widget.validate,
          onChanged: widget.onChanged,
          focusNode: widget.focusNode,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: widget.keyboardType,
          textCapitalization: TextCapitalization.sentences,
          style: textTheme(context).bodyMedium?.copyWith(
              fontSize: context.responsiveFontSize(14),
              color: ColorManager.whiteColor),
          decoration: InputDecoration(
            hintText: widget.hintText,
            contentPadding: widget.contentPadding,
            fillColor: colorScheme(context).onSecondary.withOpacity(0.1),
            enabledBorder: widget.showBorder
                ? OutlineInputBorder(
                    borderSide: BorderSide(
                        color: colorScheme(context).primary.withOpacity(0.3)),
                    borderRadius:
                        BorderRadius.circular(context.responsiveRadius(8)),
                  )
                : null,
            disabledBorder: widget.showBorder
                ? OutlineInputBorder(
                    borderSide: BorderSide(color: colorScheme(context).primary),
                    borderRadius:
                        BorderRadius.circular(context.responsiveRadius(8)),
                  )
                : null,
            focusedBorder: widget.showBorder
                ? OutlineInputBorder(
                    borderSide: BorderSide(color: colorScheme(context).primary),
                    borderRadius:
                        BorderRadius.circular(context.responsiveRadius(8)),
                  )
                : null,
            errorBorder: widget.showBorder
                ? OutlineInputBorder(
                    borderSide: BorderSide(color: colorScheme(context).primary),
                    borderRadius:
                        BorderRadius.circular(context.responsiveRadius(8)),
                  )
                : null,
            border: widget.showBorder
                ? OutlineInputBorder(
                    borderSide: BorderSide(color: colorScheme(context).primary),
                    borderRadius:
                        BorderRadius.circular(context.responsiveRadius(8)),
                  )
                : null,
          ),
        ),
        // SizedBox(
        //   height: KHeight.h5,
        // ),
        // ValueListenableBuilder(
        //   valueListenable:
        //       widget.messageCharacterCount ?? ValueNotifier<int>(0),
        //   builder: (context, value, _) {
        //     return CharacterAndCreditWidget(
        //       characterCount: value,
        //     );
        //   },
        // ),
      ],
    );
  }
}
