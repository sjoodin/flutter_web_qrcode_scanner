import 'package:flutter/foundation.dart';

class CameraController extends ChangeNotifier {
  final bool autoPlay;

  CameraController({this.autoPlay = true}) {
    if (autoPlay) {
      _isRecording = true;
    }
  }

  bool _isRecording = false;

  bool get isRecording => _isRecording;

  void startVideoStream() {
    if (!_isRecording) {
      _isRecording = true;
      notifyListeners();
    }
  }

  void stopVideoStream() {
    if (_isRecording) {
      _isRecording = false;
      notifyListeners();
    }
  }

  bool _isCapturingImage = false;

  /// Capture an image from the QR scanner video feed.
  /// This will trigger the [onCaptureImage] callback in the [FlutterWebQrcodeScanner] widget.
  void captureImage() {
    _isRecording = true;
    _isCapturingImage = true;
    notifyListeners();
  }

  /// Stop attempting to capture an image from the QR scanner video feed.
  /// Normally only called by the [FlutterWebQrcodeScanner] widget once an image has been captured.
  void doneCapturingImage() {
    _isCapturingImage = false;
    notifyListeners();
  }

  get isCapturingImage => _isCapturingImage;
}
