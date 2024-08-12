import 'package:flutter/services.dart';

class CopyLinkUseCase {
  Future<void> execute(String copyRecipeLink) async {
    await Clipboard.setData(ClipboardData(text: copyRecipeLink));
  }
}
