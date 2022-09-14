// ignore_for_file: non_constant_identifier_names

//  Form options model.
var form_options = {
  // Title of the form
  "title": "",

  // Description of the form
  "title_alignment": "left,right",

  // Description for the form.
  "description": null,

  // Number of form pages
  "number_of_pages": 1,

  // Primary color for all fields.
  "primary_color": "0000ff",

  "background_color": "0000ff",

  // top: 12, bottom 12
  "form_item_margin_vertical": 12.0,

  // Size of field items ( icons, text and everything else )
  "size": ["enum containing  `mini`, `small`, `medium`, `default(large)`"],

  // To show error at the fields or not.
  "auto_show_errors": true,

  "show_reset_button": true,

  // Only to be present in dart or map
  "custom_reset_button": "",

  // Locale of the whole form.
  "locale": "en",

  // Label position of the field.
  "label_position": "left, right, top, bottom ",

  "label_alignment": "left, right",

  // "submission_url": "",

  // "before_submit": "bool Function onSubmit(Map<String,dynamic> values)",

  "on_reset": "void Function onReset(Map<String,dynamic> values)",

  "on_submit": "void Function onSubmit(Map<String,dynamic> values)",

  "on_validation_fail": "Function onValidationFail(List<ValidationError> failedValidations)"
};

var text_field_props = {
  // http name
  "name": "",

  // Description of the text field.
  "helper_text": "",

  // Label of the text field.
  "label": "",

  // Placeholder or hint text.
  "placeholder": "",

  // Primary color for this field, overwrites color from form options.
  "text_color": "00ff00",

  // To show border for the text field or not.
  "show_border": true,

  // Border color for the text field.
  "border_color": "0000ff",

  // Border width for the text field.
  "border_width": 1,

  // Border radius for the text field.
  "border_radius": 1,

  // Min number of lines for text field. (min lines < max lines)
  "min_lines": 1,

  // Max number of lines for text field.
  "max_lines": 1,

  // If this field is required. (validation)
  "required": true,

  // If this field is disabled.
  "read_only": false,

  // If this field is disabled.
  "can_create": true,

  // If this field is disabled.
  "can_update": true,

  // If this field is disabled.
  "auto_focus": false,

  // If this field is disabled.
  "on_focus_lost_validate": false,

  // If this field is disabled.
  "auto_correct": false,

  // If this field is disabled.
  "obscure_text": false,

  // "keyboard_type": [
  //   "enum containing  `text`, `number`, `phone`, `email`, `url`, `datetime`, `multiline`"
  // ],

  // Whether to trim whitespaces in entered text.
  "trim_white_space": true,

  // Min number of characters that can be entered. (null = no limit)
  "min_length": null,

  // Max number of characters that can be entered. (null = no limit)
  "max_length": null,

  // To display errors. (overwrites the value from form options)
  "show_error": true,

  // Custom Error text to show.
  "custom_error_text": "",

  // Custom Error text to show.
  "show_text_counter": true,

  // Page of form this component to be displayed at
  "form_page_number": 1,

  // To show error at the fields or not.
  "regex_match": "",

  // To show error at the fields or not.
  "prefix_icon": "icon-name",

  // To show error at the fields or not.
  "suffix_icon": "icon-name",
};

var radio_field_props = {
  // type
  "type": "radio",

  // Title of the field
  "name": "",

  // Title of the widget
  "legend": "String",

  // Description of the field.
  "helperTextKey": "",

  // To align vertically or horizontally.
  "alignment": ["enum containing `horizontal`, `vertical`"],

  // Different labels radio can have. (show be in order of and as many as values.)
  "labels": ["label1", "label2", "label3"],

  // label positioning for the radio field.
  "label_position": ["enum containing  `left`, `right`"],

  // radio can have 3 label styles "normal", "bold", "italic"
  "label_style": ["enum containing  `normal`, `bold`, `italic`"],

  // different values that radio can have, in order.
  "values": ["val1", "val2", "val3"],

  // Primary color for this field, overwrites color from form options.
  "primary_color": "00ff00",

  // To show border around the radio field or not.
  "show_border": true,

  "border_color": "0000ff",

  // If this field is required. (validation)
  "required": true,

  // To display errors. (overwrites the value from form options)
  "show_error": true,

  // Custom Error text to show.
  "custom_error_text": "",
};

/// `CheckBoxFieldProps` is the model for the checkbox field.
var checkbox_field_props = {
  // type. String type
  "type": "checkbox",

  // Title of the field. String type
  "name": "",

  // Title of the widget. String type
  "legend": "",

  // Description of the field. String type
  "helperTextKey": "",

  // To align vertically or horizontally. String type
  "alignment": ["enum `horizontal`, `vertical`"],

  // Value of the field. List of dynamic
  "values": ["val1", "val2", "val3"],

  // Labels of the field. List of strings
  "labels": ["label1", "label2", "label3"],

  // label positioning for the checkbox field.
  "label_position": ["enum containing  `left`, `right`"],

  // checkbox can have 3 label styles "normal", "bold", "italic"
  "label_style": ["enum containing  `normal`, `bold`, `italic`"],

  // Primary color for this field, overwrites color from form options.
  "primary_color": "00ff00",

  // To show border for the text field or not.
  "show_border": true,

  // Border color of the checkbox field.
  "border_color": "0000ff",

  // If this field is required. (validation)
  "required": true,

  // To display errors. (overwrites the value from form options)
  "show_error": true,

  // Custom Error text to show.
  "custom_error_text": "",
};

/// `SliderFieldProps` is the model for the slider props
var slider_field_props = {
  // Type of the component
  "type": "slider",

  // Label of the widget. Default value: ""(empty string)
  "label": "",

  // Name
  "name": "",

  // HelperText Default value: null (String Type)
  "helper_text": null,

  // Minimum value of slider field. Default value: 0.0
  "min_value": 0.0,

  // Maximum value of slider field. Default value: 10.0
  "max_value": 10.0,

  // Number of divisions. Default value: null
  "divisions": 1,

  // Active color. Default value: "000000"
  "active_color": "000000",

  // Inactive color. Default value: "00ff00"
  "inactive_color": "00ff00",

  // Thumb color. Default value: "0000ff"
  "thumb_color": "0000ff",
};

/// Range slider properties
var range_slider_props = {
  // Type of the component
  "type": "slider",

  // Label of the widget. Default value: ""(empty string)
  "label": "",

  // Name
  "name": "",

  // HelperText Default value: null (String Type)
  "helper_text": null,

  // Minimum value of slider field. Default value: 0.0
  "min_value": 0.0,

  // Maximum value of slider field. Default value: 10.0
  "max_value": 10.0,

  // Number of divisions. Default value: null
  "divisions": 1,

  // Active color. Default value: "000000"
  "active_color": "000000",

  // Inactive color. Default value: "00ff00"
  "inactive_color": "00ff00",

  // Label to be displayed when slider's starting thumb is pressed.
  "start_label": "",

  // Label to be displayed when slider's ending thumb is pressed.
  "end_label": ""
};

/// `dropdown props` is the model for dropdown properties
var dropdown_properties = {
  // Type of the component
  "type": "dropdown",

  // Name of the component
  "name": "",

  // Legend is the title of the component to be displayed on screen
  "legend": "",

  // Helper text describes the component.
  // Type: nullable string (String?)
  // Default value: ''
  "helper_text": '',

  // Hint text will be displayed if nothing is selected in dropdown.
  "hint_text": '',

  // Alignment of the item_labels in the dropdown
  "items_alignment": ["enum `left`, `center`, `right`"],

  // Item Labels are to be displayed in dropdown
  // Type: List<String>
  // Default: empty List
  "item_labels": [],

  // Item values are the corresponding values of item_labels
  // Type: List<dynamic>
  // Default: empty List
  "item_values": [],

  // Label color is applied to item_labels.
  // Type: String
  // Default: "000000"
  "label_color": "000000",

  // Dropdown color is applied to dropdown.
  // Type: String
  // Default: "ffffff"
  "dropdown_color": "ffffff",

  // Elevation of the dropdown widget.
  "elevation": 0,

  // is_dense applies padding around the dropdown button
  "is_dense": false,

  // is_expanded applies restricton of the drop down widget.
  // If true then it takes the available width, else it it the width of it's content.
  "is_expanded": false,

  // Maximum height for menu. Usually it takes up the height of it's content.
  // Nullable double
  "menu_max_height": 0.0,

  // If feedback is enabled then the user can feel any platform specific haptic gestures.
  "enable_feedback": false,

  // Is this component required to be filled or not
  "is_required": true,

  // Show error for the field or not.
  "show_error": true,

  // Use custom error text
  "custom_error_text": "",

  // Whether a border should be visible or not. Default is true
  "show_border": true,

  // Border radius, if show_border is applied
  "border_radius": 8,

  // Border width, if show_border is applied
  "border_width": 1,

  // Border color, defaults to black
  "border_color": "000000",
};

/// Multi select dropdown
var multi_select_dropdown = {
  // Type of the component
  "type": "multi_select_dropdown",

  // Name of the component
  "name": "",

  // Legend is label of the component
  "legend": "",

  // Helper_text is the description of the component
  "helper_text": "",

  // Hint text is the placeholder of the component
  "hint_text": "",

  // Item labels
  "item_labels": [],

  // Item values
  "item_values": [],

  // Label color
  "label_color": "",

  // Dropdown color
  "dropdown_color": "",

  // Is dense
  "is_dense": false,

  // Determines whether the component required to be filled by the user or not
  "is_required": false,

  // Whether to show the error or not.
  "show_error": true,

  // Custom error text to be displayed
  "custom_error_text": "",

  // Determines whether the border should be displayed or not.
  "show_border": true,

  // Border radius determines the curvature of the edges for the component.
  "border_radius": 1.0,

  // Border width.
  "border_width": 4.0,

  // Color of the border
  "border_color": "000000",

  // Color of the chip to be displayed in the text field
  "chip_color": "000000"
};

/// Date picker
var date_picker = {
  // Date picker type widget
  "type": "date_picker",

  // Date picker name
  "name": "",

  // Date picker label
  "label": "",

  // Description of the component
  "helper_text": '',

  // Place holder, gets displayed when there is no value to display.
  "place_holder": "",

  // Initial date
  "initial_date": "formatted date string",

  // First date
  "first_date": "formatted_date_string",

  // If date picker is in range mode then Last date is required.
  "last_date": "formatted_date_string",

  // Initial date picker mode
  "date_picker_entry_mode": "DatePickerEntryMode.calendar",

  // Text to be displayed on cancel option of picker
  "picker_cancel_text": "cancel",

  // Text to be displayed on yes option of picker
  "picker_select_text": "select",

  // Whether the to show date range picker or not
  "is_range_picker_mode": false,

  // Is this field required
  "is_required": false,

  // Show error or not
  "show_error": true,

  // Custom error text is nullable string.
  "custom_error_text": null,

  "text_color": "000000",

  // To show border for the text field or not.
  "show_border": true,

  // Border color for the text field.
  "border_color": "0000ff",

  // Border width for the text field.
  "border_width": 1,

  // Border radius for the text field.
  "border_radius": 1,
};

/// Time picker
var time_picker = {
  // Time picker type widget
  "type": "time_picker",

  // Time picker name
  "name": "",

  // Time picker label
  "label": "",

  // Description of the component
  "helper_text": '',

  // Place holder, gets displayed when there is no value to display.
  "place_holder": "",

  // Label text for HH
  "hour_label_text": "",

  // Label text for MM
  "minute_label_text": "",

  // Initial time
  "initial_time": "formatted time string (HH:MM) ",

  //
  "time_picker_entry_mode": "",

  // Text to be displayed on cancel option of picker
  "picker_cancel_text": "cancel",

  // Text to be displayed on yes option of picker
  "picker_select_text": "select",

  // Is this field required
  "is_required": false,

  // Show error or not
  "show_error": true,

  // Custom error text is nullable string.
  "custom_error_text": null,

  "text_color": "000000",

  // To show border for the text field or not.
  "show_border": true,

  // Border color for the text field.
  "border_color": "0000ff",

  // Border width for the text field.
  "border_width": 1,

  // Border radius for the text field.
  "border_radius": 1,
};

/// File picker
var file_picker = {
  // Time picker type widget
  "type": "file_picker",

  // File picker name
  "name": "",

  // File picker label
  "label": "",

  // Description of the component
  "helper_text": '',

  // Place holder, gets displayed when there is no value to display.
  "place_holder": "",

  // URL where file should be uploaded. Url should accept formData and return a url !
  "file_upload_url": "",

  // Picker dialog's title.
  'dialog_title': "",

  // File Type
  "file_type": "<FileType Enum>",

  // List of extensions allowed.
  "allowed_extensions": [""],

  // MultiPicker mode.
  "allow_multiple"

      // Is this field required
      "is_required": false,

  // Show error or not
  "show_error": true,

  // Custom error text is nullable string.
  "custom_error_text": null,

  "text_color": "000000",

  // To show border for the text field or not.
  "show_border": true,
  ''

      // Border color for the text field.
      "border_color": "0000ff",

  // Border width for the text field.
  "border_width": 1,

  // Border radius for the text field.
  "border_radius": 1,
};

/// `ValidationError`
var validation_result = {
  // Name of the field that failed validation.
  "name": "string",

  // component type of the field that failed validation.
  "type": "string",

  // Error values
  "value": "dynamic",

  // List of error messages
  "errors": ["error 1", "error 2"],
};

/*
**Notes:**

Submission options:
Include dio
    If dio is included then
      submission_url
      on_submit() 
      should be added in the form options.


## Documentation points

* Wrap the form widget inside a theme widget. And we should mention that we are using
  the particualar styles for corresponding fields.
  
  > Example: We should mention that we are using inbuilt h1 style for title, h2 for description, etc.
*/
