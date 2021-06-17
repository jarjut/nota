import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:image_picker/image_picker.dart';

class AppQuillToolbar extends StatelessWidget {
  const AppQuillToolbar({
    Key? key,
    required this.controller,
    this.toolbarIconSize = 18,
    this.onImagePickCallback,
  }) : super(key: key);

  final QuillController controller;
  final double toolbarIconSize;
  final OnImagePickCallback? onImagePickCallback;

  @override
  Widget build(BuildContext context) {
    return QuillToolbar(
      key: key,
      toolBarHeight: toolbarIconSize * 2,
      children: [
        // Number
        ToggleStyleButton(
          attribute: Attribute.ol,
          controller: controller,
          icon: Icons.format_list_numbered,
          iconSize: toolbarIconSize,
        ),
        // Bullets
        ToggleStyleButton(
          attribute: Attribute.ul,
          controller: controller,
          icon: Icons.format_list_bulleted,
          iconSize: toolbarIconSize,
        ),
        // Checkbox
        ToggleCheckListButton(
          attribute: Attribute.unchecked,
          controller: controller,
          icon: Icons.check_box,
          iconSize: toolbarIconSize,
        ),
        VerticalDivider(
          indent: 12,
          endIndent: 12,
          color: Colors.grey.shade400,
        ),
        // Bold
        ToggleStyleButton(
          attribute: Attribute.bold,
          icon: Icons.format_bold,
          iconSize: toolbarIconSize,
          controller: controller,
        ),
        // Italic
        ToggleStyleButton(
          attribute: Attribute.italic,
          icon: Icons.format_italic,
          iconSize: toolbarIconSize,
          controller: controller,
        ),
        // Underline
        ToggleStyleButton(
          attribute: Attribute.underline,
          icon: Icons.format_underline,
          iconSize: toolbarIconSize,
          controller: controller,
        ),
        // StrikThrough
        ToggleStyleButton(
          attribute: Attribute.strikeThrough,
          icon: Icons.format_strikethrough,
          iconSize: toolbarIconSize,
          controller: controller,
        ),
        // Font Color
        ColorButton(
          icon: Icons.color_lens,
          iconSize: toolbarIconSize,
          controller: controller,
          background: false,
        ),

        if (onImagePickCallback != null)
          ImageButton(
            icon: Icons.image,
            iconSize: toolbarIconSize,
            controller: controller,
            imageSource: ImageSource.gallery,
            onImagePickCallback: onImagePickCallback,
          ),
        if (onImagePickCallback != null)
          ImageButton(
            icon: Icons.photo_camera,
            iconSize: toolbarIconSize,
            controller: controller,
            imageSource: ImageSource.camera,
            onImagePickCallback: onImagePickCallback,
          ),

        VerticalDivider(
          indent: 12,
          endIndent: 12,
          color: Colors.grey.shade400,
        ),
        // Header Style
        SelectHeaderStyleButton(
          controller: controller,
          iconSize: toolbarIconSize,
        ),

        VerticalDivider(
          indent: 12,
          endIndent: 12,
          color: Colors.grey.shade400,
        ),
        // Code Block
        ToggleStyleButton(
          attribute: Attribute.codeBlock,
          controller: controller,
          icon: Icons.code,
          iconSize: toolbarIconSize,
        ),
        // Quote
        ToggleStyleButton(
          attribute: Attribute.blockQuote,
          controller: controller,
          icon: Icons.format_quote,
          iconSize: toolbarIconSize,
        ),
        // Clear Format
        ClearFormatButton(
          icon: Icons.format_clear,
          iconSize: toolbarIconSize,
          controller: controller,
        ),
        // Link
        LinkStyleButton(
          controller: controller,
          iconSize: toolbarIconSize,
        ),
      ],
    );
  }
}
