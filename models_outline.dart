// ignore_for_file: non_constant_identifier_names

//  Form options model.
var form_options = {
  // Title of the form
  "title": "",

  // Description for the form.
  "description": "",

  // Number of form pages
  "number_of_pages": 1,

  // Number of fields per page.
  "items_per_page": 10,

  // Primary color for all fields.
  "primary_color": "0000ff",

  "background_color": "0000ff",

  // Size of field items ( icons, text and everything else )
  "size": ["enum containing  `s`, `m`, `l`, `xl`"],

  // To show error at the fields or not.
  "auto_show_errors": true,

  // Locale of the whole form.
  "locale": "en"
};

var text_field_props = {
  // Title of the text field.
  "title": "",

  // Description of the text field.
  "description": "",

  // Label of the text field.
  "label": "",

  // Placeholder or hint text.
  "placeholder": "",

  // Primary color for this field, overwrites color from form options.
  "color": "00ff00",

  // To show border for the text field or not.
  "show_border": true,

  "border_color": "0000ff",

  "border_width": 1,

  "border_radius": 1,

  // Min number of lines for text field. (min lines < max lines)
  "min_lines": 1,

  // Max number of lines for text field.
  "max_lines": 1,

  // If this field is required. (validation)
  "required": true,

  "read_only": false,

  "auto_focus": false,

  "auto_validate": false,

  "auto_correct": false,

  "obscure_text": false,

  "keyboard_type": [
    "enum containing  `text`, `number`, `phone`, `email`, `url`, `datetime`, `multiline`"
  ],

  // Whether to trim whitespaces in entered text.
  "trim_white_space": true,

  // Max number of characters that can be entered. (null = no limit)
  "max_length": null,

  // To display errors. (overwrites the value from form options)
  "show_error": true,

  // Custom Error text to show.
  "custom_error_text": ""
};

var radio_field_props = {
  // Title of the field
  "title": "",

  // Description of the field.
  "description": "",

  // Primary color for this field, overwrites color from form options.
  "color": "00ff00",

  // To show border for the text field or not.
  "show_border": true,

  "border_color": "0000ff",

  // different values that radio can have, in order.
  "values": ["val1", "val2", "val3"],

  // Different labels radio can have. (show be in order of and as many as values.)
  "labels": ["label1", "label2", "label3"],

  // If this field is required. (validation)
  "required": true,

  // To display errors. (overwrites the value from form options)
  "show_error": true,

  // Custom Error text to show.
  "custom_error_text": "",

  // To align vertically or horizontally.
  "align": "horizontal", // can be `vertical`

  "label_position": ["enum containing  `left`, `right`"],

  "label_style": ["enum containing  `normal`, `bold`, `italic`"]
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