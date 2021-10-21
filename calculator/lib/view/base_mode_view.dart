import 'package:calculator/asset/constant/button.dart';
import 'package:calculator/components/button.dart';
import 'package:calculator/lib/framework.dart';
import 'package:calculator/view_model/base_mode_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseModeState extends BaseMVVMState<BaseModeView, BaseModeViewModel> {
  @override
  Widget buildChild(ctx, BaseModeViewModel vm) {
    return SafeArea(
        child: Column(
      children: [
        Text(vm.result),
        NumberPad(
          vm: vm,
        ),
      ],
    ));
  }

  @override
  BaseModeViewModel buildViewModel() {
    return BaseModeViewModel();
  }
}

class BaseModeView extends StatefulWidget {
  const BaseModeView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BaseModeState();
}

class NumberPad extends StatelessWidget {
  final BaseModeViewModel vm;

  const NumberPad({Key? key, required this.vm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> firstRow = [
      Sign.clear,
      Sign.posNeg,
      Sign.percent,
      Sign.division
    ];
    List<String> secondRow = [
      Sign.clear,
      Sign.posNeg,
      Sign.percent,
      Sign.division
    ];
    List<String> thirdRow = [
      Sign.clear,
      Sign.posNeg,
      Sign.percent,
      Sign.division
    ];
    List<String> fourthRow = [
      Sign.clear,
      Sign.posNeg,
      Sign.percent,
      Sign.division
    ];
    List<String> fifthRow = [
      Sign.clear,
      Sign.posNeg,
      Sign.percent,
      Sign.division
    ];

    return Column(children: [
      Row(
          children: firstRow
              .map((label) => CustomElevatedButton(
                    text: label,
                    onPressed: () => vm.onClick(label),
                  ))
              .toList(),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly),
      Row(
          children: secondRow
              .map((label) => CustomElevatedButton(
                    text: label,
                    onPressed: () => vm.onClick(label),
                  ))
              .toList(),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly),
      Row(
          children: thirdRow
              .map((label) => CustomElevatedButton(
                    text: label,
                    onPressed: () => vm.onClick(label),
                  ))
              .toList(),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly),
      Row(
          children: fourthRow
              .map((label) => CustomElevatedButton(
                    text: Sign.clear,
                    onPressed: () => vm.onClick(label),
                  ))
              .toList(),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly),
      Row(
          children: fifthRow
              .map((label) => CustomElevatedButton(
                    text: Sign.clear,
                    onPressed: () => vm.onClick(label),
                  ))
              .toList(),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly),
    ]);
  }
}
