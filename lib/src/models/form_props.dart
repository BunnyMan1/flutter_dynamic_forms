import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'form_props.g.dart';

@JsonSerializable()
class FormProps {
  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'number_of_pages')
  final int numberOfPages;

  @JsonKey(name: "primary_color")
  final String primaryColor;

  @JsonKey(name: "background_color")
  final String backgroundColor;

  @JsonKey(name: "form_item_vertical_marging")
  final double formItemVerticalMarging;

  @JsonKey(name: "auto_show_errors")
  final bool autoShowErrors;

  @JsonKey(name: "show_reset_button")
  final bool showResetButton;

  @JsonKey(ignore: true)
  final Widget? customResetButton;

  @JsonKey(ignore: true)
  final Widget? customSubmitButton;

  @JsonKey(name: 'locale')
  final String locale;

  @JsonKey(name: 'size')
  final Size size;

  @JsonKey(name: 'label_position')
  final Position labelPosition;

  @JsonKey(name: 'label_alignment')
  final Alignment labelAlignment;

  FormProps({
    this.title = "",
    this.description = "",
    this.autoShowErrors = true,
    this.primaryColor = "000000",
    this.backgroundColor = "ffffff",
    this.customResetButton,
    this.formItemVerticalMarging = 12.0,
    this.numberOfPages = 1,
    this.showResetButton = true,
    this.labelAlignment = Alignment.left,
    this.labelPosition = Position.top,
    this.locale = 'en',
    this.size = Size.defaultLarge,
    this.customSubmitButton,
  });

  //Factory constructor.
  factory FormProps.fromMap(Map<String, dynamic> json) {
    return _$FormPropsFromJson(json);
  }

  //Factory constructor.
  factory FormProps.fromJson(String json) {
    Map<String, dynamic> parsed = jsonDecode(json);
    return _$FormPropsFromJson(parsed);
  }

  // Serializer to convert Wellness Object to map.
  static Map<String, dynamic> toJson(object) {
    return _$FormPropsToJson(object);
  }

  //TODO: complete props checker function.

  _propsChecker(FormProps props) {}
}

//TODO: add conversion functions for these enums.
enum Size { mini, small, medium, defaultLarge }

enum Position { left, right, top, bottom }

enum Alignment { left, right }
