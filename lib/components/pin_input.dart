import 'package:flutter/material.dart';

import '../core/constants/colors.dart';

class PinInput extends StatefulWidget {
  final void Function(int value) onDone;
  const PinInput({super.key, required this.onDone});

  @override
  State<PinInput> createState() => _PinInputState();
}

class _PinInputState extends State<PinInput> {
  final List<FocusNode> _focusNodes = [];
  final List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 6; i++) {
      _focusNodes.add(FocusNode());
      _controllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    for (final node in _focusNodes) {
      node.dispose();
    }
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        6,
        (index) => SizedBox(
          width: 50,
          child: TextFormField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            keyboardType: TextInputType.number,
            maxLength: 1,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              counterText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: AppColors.stroke),
              ),
            ),
            onChanged: (value) {
              if (value.isNotEmpty && index < 5) {
                _focusNodes[index].unfocus();
                FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
              } else if (value.isEmpty && index != 0) {
                _focusNodes[index].unfocus();
                FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
                _controllers[index - 1].selection = TextSelection(
                  baseOffset: 0,
                  extentOffset: _controllers[index - 1].text.length,
                );
              }

              if (index == 5) {
                final code1 = _controllers[0].text;
                final code2 = _controllers[1].text;
                final code3 = _controllers[2].text;
                final code4 = _controllers[3].text;
                final code5 = _controllers[4].text;
                final code6 = _controllers[5].text;
                final allCode = code1 + code2 + code3 + code4 + code5 + code6;
                final pin = int.parse(allCode);
                if (allCode.length == 6) {
                  widget.onDone(pin);
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
