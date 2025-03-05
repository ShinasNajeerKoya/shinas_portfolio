import 'package:flutter/cupertino.dart';
import 'package:shinas_koya_portfolio/data/service/contact_service.dart';

enum ContactOptionEnum {
  call,
  email,
  web,
  share,
}

class ContactButtonHelper {
  static String getContactButtonTooltip(ContactOptionEnum contactOption) {
    switch (contactOption) {
      case ContactOptionEnum.call:
        return 'Call me';
      case ContactOptionEnum.email:
        return 'Send me an email';
      case ContactOptionEnum.web:
        return 'Visit my website';
      case ContactOptionEnum.share:
        return 'Share my portfolio';
    }
  }

  static String getContactButtonTitle(ContactOptionEnum contactOption) {
    switch (contactOption) {
      case ContactOptionEnum.call:
        return 'Call';
      case ContactOptionEnum.email:
        return 'Email';
      case ContactOptionEnum.web:
        return 'Web';
      case ContactOptionEnum.share:
        return 'Share';
    }
  }

  static IconData getContactButtonIcon(ContactOptionEnum contactOption, bool isMacOs) {
    switch (contactOption) {
      case ContactOptionEnum.call:
        return isMacOs ? CupertinoIcons.phone_fill : CupertinoIcons.phone;
      case ContactOptionEnum.email:
        return isMacOs ? CupertinoIcons.envelope_fill : CupertinoIcons.envelope;
      case ContactOptionEnum.web:
        return isMacOs ? CupertinoIcons.globe : CupertinoIcons.compass;
      case ContactOptionEnum.share:
        return isMacOs ? CupertinoIcons.share : CupertinoIcons.share;
    }
  }

  /// Handles the action based on the given [title]
  static Future<void> handleContactOnTap(BuildContext context, ContactOptionEnum contactOption) async {
    switch (contactOption) {
      case ContactOptionEnum.call:
        return ContactService.handleCall(context);
      case ContactOptionEnum.email:
        return ContactService.handleEmail();
      case ContactOptionEnum.web:
        return ContactService.handleWeb(SocialMediaPlatformEnum.website);
      case ContactOptionEnum.share:
        return ContactService.handleShare();
    }
  }
}

// class ContactButtonHelper {
//   /// Handles the action based on the given [title]
//   static Future<void> handleContactTap(BuildContext context, String title) async {
//     switch (title) {
//       case 'Call':
//         _handleCall(context);
//         break;
//       case 'Email':
//         _handleEmail();
//         break;
//       case 'Web':
//         _handleWeb();
//         break;
//       case 'Share':
//         _handleShare();
//         break;
//       default:
//         debugPrint("Unknown action: $title");
//     }
//   }
//
//   /// Opens the phone dialer on mobile, copies the number to clipboard on desktop
//
//   static Future<void> _handleCall(BuildContext context) async {
//     const String phoneNumber = "+918088670650";
//
//     if (kIsWeb) {
//       // For Web: Copy phone number to clipboard
//       Clipboard.setData(const ClipboardData(text: phoneNumber));
//       debugPrint("Phone number copied to clipboard!");
//       _showSnackbar(context, "Phone number copied to clipboard!");
//     } else if (Platform.isAndroid || Platform.isIOS) {
//       // For Mobile: Open the phone dialer
//       final Uri phoneUri = Uri.parse("tel:$phoneNumber");
//       if (await canLaunchUrl(phoneUri)) {
//         await launchUrl(phoneUri);
//       } else {
//         debugPrint("Could not launch dialer");
//         if (context.mounted) {
//           _showSnackbar(context, "Failed to open dialer.");
//         }
//       }
//     } else {
//       // For other platforms (Windows, macOS, Linux): Copy to clipboard
//       Clipboard.setData(const ClipboardData(text: phoneNumber));
//       debugPrint("Phone number copied to clipboard!");
//       _showSnackbar(context, "Phone number copied to clipboard!");
//     }
//   }
//
//   // Snackbar helper function
//   static void _showSnackbar(BuildContext context, String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }
//
//   /// ** Email Section **
//
//   /// Opens the email client with a pre-filled recipient
//   // static Future<void> _handleEmail() async {
//   //   final Uri emailUri = Uri.parse("mailto:myemail@example.com?subject=Hello&body=Hi there,");
//   //   if (await canLaunchUrl(emailUri)) {
//   //     await launchUrl(emailUri);
//   //   } else {
//   //     debugPrint("Could not open email client");
//   //   }
//   // }
//
//   static Future<void> _handleEmail() async {
//     const String email = "shinasnajeerkoya@gmail.com";
//     const String subject = "Hello";
//     const String body = "Hi there,";
//     final Uri emailUri = Uri.parse("mailto:$email?subject=$subject&body=$body");
//
//     if (kIsWeb) {
//       // for web -- open new tab
//       html.window.open(emailUri.toString(), "testingEmailOnWeb");
//     } else {
//       // for mobile -- use launcher
//       if (await canLaunchUrl(emailUri)) {
//         await launchUrl(emailUri);
//       } else {
//         debugPrint("Could not open email client");
//       }
//     }
//   }
//
//   /// ** Website Section **
//
//   /// Opens the user's website in an external browser
//   // static Future<void> _handleWeb() async {
//   //   final Uri websiteUri = Uri.parse("https://mywebsite.com");
//   //   if (await canLaunchUrl(websiteUri)) {
//   //     await launchUrl(websiteUri, mode: LaunchMode.externalApplication);
//   //   } else {
//   //     debugPrint("Could not open website");
//   //   }
//   // }
//   static Future<void> _handleWeb() async {
//     final Uri websiteUri = Uri.parse("https://shinasnajeerkoya.github.io/shinas_portfolio_website/");
//
//     if (kIsWeb) {
//       // for web
//       html.window.open(websiteUri.toString(), "testingForWebsite");
//     } else {
//       // for mobile
//       if (await canLaunchUrl(websiteUri)) {
//         await launchUrl(websiteUri, mode: LaunchMode.externalApplication);
//       } else {
//         debugPrint("Could not open website");
//       }
//     }
//   }
//
//   /// ** Portfolio Share Section **
//
//   /// Shares the portfolio link
//   // static Future<void> _handleShare() async {
//   //   await Share.share("Check out my portfolio: https://myportfolio.com");
//   // }
//   static Future<void> _handleShare() async {
//     String url = "https://myportfolio.c";
//     String message = "Check out my portfolio: $url";
//
//     if (kIsWeb) {
//       // for web
//       try {
//         await html.window.navigator.share({
//           'title': 'My Portfolio',
//           'text': message,
//           'url': url,
//         });
//       } catch (e) {
//         // Fallback: Open the URL in a new tab if sharing is unavailable
//         html.window.open(url, "_blank");
//       }
//     } else {
//       // for mobile use package
//       await Share.share(message);
//     }
//   }
// }
