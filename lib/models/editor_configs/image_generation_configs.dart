/// Configuration settings for image generation.
///
/// [ImageGeneratioConfigs] holds various configuration options
/// that affect how images are generated.
class ImageGeneratioConfigs {
  /// Determines whether to capture only the content within the boundaries of the image when editing is complete.
  ///
  /// If set to `true`, editing completion will result in cropping all content outside the image boundaries, returning only the content overlaid on the image.
  ///
  /// Setting this property to `true` is useful when you want to focus on the image content and exclude any surrounding elements.
  /// Setting this property to `false` is useful when you want to capture all content also layers which placed outside the image.
  ///
  /// By default, this property is set to `true`.
  final bool generateOnlyImageBounds;

  /// Captures the final image after each change, such as adding a layer.
  /// This significantly speeds up the editor because in most cases, the image is already created when the user presses "done".
  ///
  /// On Dart native platforms (all platforms except web), this runs on an isolate thread.
  /// On Dart web, it runs on a web worker.
  final bool generateImageInBackground;

  /// Allows image generation to run in an isolated thread, preventing any impact on the UI.
  /// On web platforms, this will run in a separate web worker.
  ///
  /// Enabling this feature will significantly speed up the image creation process.
  ///
  /// If this is disabled, `captureImagesInBackground` will also be disabled.
  final bool generateIsolated;

  /// Whether the callback `onImageEditingComplete` call with empty editing.
  ///
  /// The default value is false.
  ///
  /// This option only affects the main editor and does not work in standalone editors.
  ///
  /// <img src="https://github.com/hm21/pro_image_editor/blob/stable/assets/schema_callbacks.jpeg?raw=true" alt="Schema" height="500px" />
  final bool allowEmptyEditCompletion;

  /// Creates a new instance of [ImageGeneratioConfigs].
  ///
  /// - The [allowEmptyEditCompletion] parameter controls if empty edit completions are allowed.
  /// - The [generateIsolated] parameter controls if image generation occurs inside an isolate.
  /// - The [generateImageInBackground] parameter controls if image generation runs in the background.
  /// - The [generateOnlyImageBounds] parameter controls if only image bounds are generated.
  const ImageGeneratioConfigs({
    this.allowEmptyEditCompletion = false,
    this.generateIsolated = true,
    this.generateImageInBackground = true,
    this.generateOnlyImageBounds = true,
  });
}
