import 'package:flutter/material.dart';
import 'package:hms/core/app_colors.dart';

class CustomSliderField extends StatefulWidget {
  final String label;
  final double min;
  final double max;
  final String unit;
  final double initialValue;
  final ValueChanged<double> onChanged;

  const CustomSliderField({
    Key? key,
    required this.label,
    required this.min,
    required this.max,
    required this.unit,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CustomSliderField> createState() => _CustomSliderFieldState();
}

class _CustomSliderFieldState extends State<CustomSliderField> {
  late double currentValue;

  @override
  void initState() {
    super.initState();
    currentValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(widget.label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

        // Slider
        Slider(
          value: currentValue,
          activeColor : AppColors.primaryColor,
          min: widget.min,
          max: widget.max,
          divisions: (widget.max - widget.min).toInt(),
          label: "${currentValue.round()} ${widget.unit}",
          onChanged: (value) {
            setState(() {
              currentValue = value;
            });
            widget.onChanged(value); // callback
          },
        ),

        // Value + Unit Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${currentValue.round()}"),
            Text(widget.unit),
          ],
        ),
      ],
    );
  }
}
