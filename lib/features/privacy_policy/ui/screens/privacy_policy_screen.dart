import 'package:flutter/material.dart';
import 'package:ri_stream/utils/app_sizes.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      appBar: AppBar(
        title: const Text("Privacy Policy"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(SizeConfig.getHeight(context, 16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Introduction",
                style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: SizeConfig.getHeight(context, 8)),
              Text(
                "Your privacy is important to us. This privacy policy explains how we collect, use, and protect your information when you use our app.",
                style: theme.textTheme.bodyMedium,
              ),
              SizedBox(height: SizeConfig.getHeight(context, 16)),

              Text(
                "Information We Collect",
                style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: SizeConfig.getHeight(context, 8)),
              Text(
                "We may collect personal information such as your name, email, profile photo, posts, messages, and usage data to provide better service.",
                style: theme.textTheme.bodyMedium,
              ),
              SizedBox(height: SizeConfig.getHeight(context, 16)),

              Text(
                "How We Use Your Information",
                style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: SizeConfig.getHeight(context, 8)),
              Text(
                "Your information is used to improve our services, personalize your experience, show relevant content, and for security purposes.",
                style: theme.textTheme.bodyMedium,
              ),
              SizedBox(height: SizeConfig.getHeight(context, 16)),

              Text(
                "Sharing Information",
                style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: SizeConfig.getHeight(context, 8)),
              Text(
                "We do not share your personal information with third parties without your consent, except as required by law.",
                style: theme.textTheme.bodyMedium,
              ),
              SizedBox(height: SizeConfig.getHeight(context, 16)),

              Text(
                "Changes to This Policy",
                style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: SizeConfig.getHeight(context, 8)),
              Text(
                "We may update this privacy policy from time to time. We encourage you to review this policy periodically for any changes.",
                style: theme.textTheme.bodyMedium,
              ),

              SizedBox(height: SizeConfig.getHeight(context, 32)),

              // Optional Accept Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.getWidth(context, 32),
                      vertical: SizeConfig.getHeight(context, 12),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Accept"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
