import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@singleton
class CopyLinkUseCase {
  Future<void> execute(String copyRecipeLink) async {
    await Clipboard.setData(ClipboardData(text: copyRecipeLink));
  }
}
