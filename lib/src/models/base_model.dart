/// BaseModel class for all the components.
abstract class BaseModel {
  /// Type of the component.
  String get type;

  /// Name of the component.
  String get name;

  //TODO: Add properties checker function in the base model and override in other classes.
}
