import 'dart:html' as html;
import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shinas_koya_portfolio/config/constants/details_constants.dart';
import 'package:shinas_koya_portfolio/config/helper/social_media_helper.dart';
import 'package:url_launcher/url_launcher.dart';

enum SocialMediaPlatformEnum { website, linkedIn, github }

class ContactService {
  static const String _phoneNumber = DetailsConstantValues.phoneNumber;
  static const String _email = DetailsConstantValues.email;
  static const String _websiteUrl = DetailsConstantValues.websiteUrl;
  static const String _portfolioUrl = DetailsConstantValues.portfolioUrl;

  // static const String _linkedInUrl = DetailsConstantValues.linkedInUrl;
  // static const String _githubUrl = DetailsConstantValues.githubUrl;

  static const String _prefilledEmailData = "mailto:$_email?subject=Hello&body=Hi there,";

  /// ** Call section **

  /// Opens the phone dialer on mobile, copies the number to clipboard on desktop
  static Future<void> handleCall(BuildContext context) async {
    if (kIsWeb) {
      // For Web: Copy phone number to clipboard

      _copyToClipboard(context, _phoneNumber, "Phone number copied to clipboard!");
    } else if (Platform.isAndroid || Platform.isIOS) {
      // For Mobile: Open the phone dialer

      final Uri phoneUri = Uri.parse("tel:$_phoneNumber");
      if (await canLaunchUrl(phoneUri)) {
        await launchUrl(phoneUri);
      } else {
        debugPrint("Could not launch dialer");
        if (context.mounted) {
          _showSnackbar(context, "Failed to open dialer.");
        }
      }
    } else {
      // For other platforms (Windows, macOS, Linux): Copy to clipboard

      _copyToClipboard(context, _phoneNumber, "Phone number copied to clipboard!");
    }
  }

  /// ** Email section **

  /// Opens the email client with a pre-filled recipient
  // static Future<void> _handleEmail() async {
  //   final Uri emailUri = Uri.parse("mailto:myemail@example.com?subject=Hello&body=Hi there,");
  //   if (await canLaunchUrl(emailUri)) {
  //     await launchUrl(emailUri);
  //   } else {
  //     debugPrint("Could not open email client");
  //   }
  // }

  static Future<void> handleEmail() async {
    final Uri emailUri = Uri.parse(_prefilledEmailData);

    if (kIsWeb) {
      html.window.open(emailUri.toString(), "testingEmailOnWeb");
    } else {
      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        debugPrint("Could not open email client");
      }
    }
  }

  /// ** Website Section **

  /// Opens the user's website in an external browser
  // static Future<void> _handleWeb() async {
  //   final Uri websiteUri = Uri.parse("https://mywebsite.com");
  //   if (await canLaunchUrl(websiteUri)) {
  //     await launchUrl(websiteUri, mode: LaunchMode.externalApplication);
  //   } else {
  //     debugPrint("Could not open website");
  //   }
  // }

  static Future<void> handleWeb(SocialMediaPlatformEnum platformType) async {
    final String url = SocialMediaHelper.getSocialMediaUrl(platformType);

    if (url.isEmpty) {
      debugPrint("Invalid platform type or URL not available");
      return;
    }

    if (kIsWeb) {
      // Open in web
      html.window.open(url, "newTab");
    } else {
      // Open in mobile browser
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        debugPrint("Could not open URL: $url");
      }
    }
  }

  /// ** Portfolio Share Section **

  /// Shares the portfolio link
  // static Future<void> _handleShare() async {
  //   await Share.share("Check out my portfolio: https://myportfolio.com");
  // }

  static Future<void> handleShare() async {
    String message = "Check out my portfolio: $_portfolioUrl";

    if (kIsWeb) {
      //
      // for web
      try {
        await html.window.navigator.share({
          'title': 'My Portfolio',
          'text': message,
          'url': _portfolioUrl,
        });
      } catch (e) {
        // Fallback: Open the URL in a new tab if sharing is unavailable
        html.window.open(_portfolioUrl, "_blank");
      }
    } else {
      //
      // for mobile use package
      await Share.share(message);
    }
  }

  /// Copies text to clipboard and shows a snackbar
  static void _copyToClipboard(BuildContext context, String text, String message) {
    Clipboard.setData(ClipboardData(text: text));
    debugPrint("Phone number copied to clipboard!");
    _showSnackbar(context, message);
  }

  /// Snackbar helper function
  static void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
