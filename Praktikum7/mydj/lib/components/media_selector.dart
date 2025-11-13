import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mydj/components/video_preview.dart';

enum MediaType { photo, video }

class MediaSelector extends StatefulWidget {
  final MediaType mediaType;

  const MediaSelector({super.key, this.mediaType = MediaType.photo});

  @override
  State<MediaSelector> createState() => _MediaSelectorState();
}

class _MediaSelectorState extends State<MediaSelector> {
  String _mediaPath = '';

  Widget _mediaPlaceholder() {
    if (_mediaPath.isEmpty) {
      // Show placeholder when no media selected
      if (widget.mediaType == MediaType.photo) {
        return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.image_not_supported, size: 64, color: Colors.grey),
            SizedBox(height: 8),
            Text('No photo'),
          ],
        );
      } else {
        return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.videocam_off, size: 64, color: Colors.grey),
            SizedBox(height: 8),
            Text('No video'),
          ],
        );
      }
    } else {
      // Show selected media
      if (widget.mediaType == MediaType.photo) {
        return Image.file(File(_mediaPath));
      } else {
        return VideoPreview(path: _mediaPath);
      }
    }
  }

  Future<XFile?> _retrieveMedia(ImageSource source) async {
    final picker = ImagePicker();
    if (widget.mediaType == MediaType.photo) {
      return await picker.pickImage(source: source);
    } else {
      return await picker.pickVideo(source: source);
    }
  }

  void _selectFromCamera() async {
    final media = await _retrieveMedia(ImageSource.camera);
    if (media != null) {
      setState(() {
        _mediaPath = media.path;
      });
    }
  }

  void _selectFromGallery() async {
    final media = await _retrieveMedia(ImageSource.gallery);
    if (media != null) {
      setState(() {
        _mediaPath = media.path;
      });
    }
  }

  void _deleteSelected() {
    setState(() {
      _mediaPath = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: _mediaPlaceholder(),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: FilledButton(
                onPressed: _selectFromCamera,
                child: const Text('Kamera'),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: FilledButton(
                onPressed: _selectFromGallery,
                child: const Text('Galeri'),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: FilledButton(
                onPressed: _deleteSelected,
                child: const Text('Hapus'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

