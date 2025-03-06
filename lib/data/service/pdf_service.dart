import 'dart:html' as html; // For web

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class PDFHelper {
  /// opening in new browser tab but tab name cannot be changed
  static Future<void> openResume() async {
    const String pdfPath = "assets/resume/Flutter_Developer_Shinas_Koya.pdf";

    if (kIsWeb) {
      // Load the PDF from assets
      final ByteData bytes = await rootBundle.load(pdfPath);
      final Uint8List uint8list = bytes.buffer.asUint8List();

      // Convert to a Blob
      final blob = html.Blob([uint8list], 'application/pdf');
      final url = html.Url.createObjectUrlFromBlob(blob);

      // Open in a new tab
      html.window.open(url, "Shinas Resume");

      // Optional: Revoke the URL after some delay to free memory
      Future.delayed(Duration(seconds: 5), () {
        html.Url.revokeObjectUrl(url);
      });
    }
  }

  ///\\

  /// * if the user wants to download the resume *
  static Future<void> downloadResume() async {
    const String pdfPath = "assets/resume/Flutter_Developer_Shinas_Koya.pdf";

    if (kIsWeb) {
      // Load PDF from assets
      final ByteData bytes = await rootBundle.load(pdfPath);
      final Uint8List uint8list = bytes.buffer.asUint8List();

      // Convert to a Blob
      final blob = html.Blob([uint8list], 'application/pdf');
      final url = html.Url.createObjectUrlFromBlob(blob);

      // Create an <a> tag and simulate a click to open in a new tab with correct name
      final html.AnchorElement anchor = html.AnchorElement(href: url)
        ..target = "Shinas Resume" // Sets the tab name
        ..download = "Shinas_Koya_Resume.pdf"; // File name if downloaded

      anchor.click(); // Simulate the click to open

      // Revoke the URL after some time to free memory
      Future.delayed(Duration(seconds: 5), () {
        html.Url.revokeObjectUrl(url);
      });
    }
  }
}
