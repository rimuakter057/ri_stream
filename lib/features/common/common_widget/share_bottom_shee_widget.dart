import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ri_stream/utils/app_sizes.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({super.key});

  final double containerSize = 60;
  final double iconSize = 30;
  final double spacing = 8;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final shareOptions = [
      {'icon': Icons.facebook, 'label': 'Facebook'},
      {'icon': FontAwesomeIcons.whatsapp,  'label': 'WhatsApp'},
      {'icon': Icons.telegram, 'label': 'Telegram'},
      {'icon': Icons.email, 'label': 'Email'},
      {'icon': Icons.copy, 'label': 'Copy Link'},
      {'icon': Icons.more_horiz, 'label': 'More'},
      {'icon': Icons.share, 'label': 'Share'},
      {'icon': Icons.link, 'label': 'Link'},
      {'icon': Icons.sms, 'label': 'SMS'},
      {'icon': Icons.print, 'label': 'Print'},
    ];

    final textStyle = isDark
        ? TextStyle(
      color: Colors.white70,
      fontSize: SizeConfig.getHeight(context, 14),
    )
        : TextStyle(
      color: Colors.black87,
      fontSize: SizeConfig.getHeight(context, 14),
    );

    final bgColor = isDark ? Colors.grey.shade900 : Colors.white;

    return Container(
      color: bgColor,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.getHeight(context, 16)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Top indicator
              Container(
                width: SizeConfig.getWidth(context, 50),
                height: SizeConfig.getHeight(context, 5),
                decoration: BoxDecoration(
                  color: theme.dividerColor,
                  borderRadius:
                  BorderRadius.circular(SizeConfig.getHeight(context, 2.5)),
                ),
              ),
              SizedBox(height: SizeConfig.getHeight(context, 20)),

              // Scrollable Grid wrapped in Flexible
              Flexible(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: shareOptions.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: SizeConfig.getHeight(context, 16),
                    crossAxisSpacing: SizeConfig.getWidth(context, 16),
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (context, index) {
                    final option = shareOptions[index];
                    return GestureDetector(
                      onTap: () {
                        print('${option['label']} tapped');
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: SizeConfig.getHeight(context, containerSize),
                            width: SizeConfig.getWidth(context, containerSize),
                            decoration: BoxDecoration(
                              color: isDark
                                  ? Colors.white10
                                  : theme.colorScheme.primary.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              option['icon'] as IconData,
                              color:
                              isDark ? Colors.white : theme.colorScheme.primary,
                              size: SizeConfig.getHeight(context, iconSize),
                            ),
                          ),
                          SizedBox(height: SizeConfig.getHeight(context, spacing)),
                          Text(
                            option['label'] as String,
                            style: textStyle,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: SizeConfig.getHeight(context, 20)),
            ],
          ),
        ),
      ),
    );
  }
}
