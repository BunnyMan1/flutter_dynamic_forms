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

  //TODO: Check this legend property once and add it to the radio field props

  // Title of the widget
  "legend": "",

  //TODO: Helper text maybe used as a description for the radio field section.

  // Description of the field.
  "helperTextKey": "",

  // To align vertically or horizontally.
  "alignment": "horizontal", // can be `vertical`

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

  // To show border for the text field or not.
  "show_border": true,

  "border_color": "0000ff",

  // If this field is required. (validation)
  "required": true,

  // To display errors. (overwrites the value from form options)
  "show_error": true,

  // Custom Error text to show.
  "custom_error_text": "",
};

var slider_field_props = {
  "min_value": 0.0,
  "max_value": 0.0,
  "divisions": 1,
  "active_color": "000000",
  "inactive_color": "00ff00",
  "thumb_color": "0000ff",
  "label": ""
};

/// `ValidationError`
var validation_error = {
  // Error message.
  "message": "",
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