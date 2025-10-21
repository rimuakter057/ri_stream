import 'package:flutter/material.dart';
import 'package:ri_stream/features/common/common_widget/custom_text_field.dart';
import 'package:ri_stream/utils/app_sizes.dart';


class ChatInputField extends StatelessWidget {
  final TextEditingController controller;
  final void Function()? onSend;

  const ChatInputField({
    super.key,
    required this.controller,
    this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            controller: controller,
            hintText: "Write a message...",
            suffixIcon: Icons.mic,
          ),
        ),
        SizedBox(width: SizeConfig.getWidth(context, 8)),
        GestureDetector(
          onTap: onSend,
          child: Icon(
            Icons.send,
            color: Colors.red.shade900,
            size: SizeConfig.getHeight(context, 32),
          ),
        ),
      ],
    );
  }
}
