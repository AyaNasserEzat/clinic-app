  import 'package:clinic/core/utiles/app_color.dart';
import 'package:clinic/core/widgets/ElvatedButtonIcon.dart';
import 'package:clinic/core/widgets/textFormForCode.dart';
import 'package:clinic/feature/auth/presentation/cubits/signUp_cubit/signUp_cubit.dart';
import 'package:clinic/feature/auth/presentation/cubits/signUp_cubit/signUp_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showDialogForCode(BuildContext context) {
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return BlocConsumer<PreSignUpCubit,PreSignUpdState>(
            listener: (context, state) {},
            builder:(context, state){return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
            backgroundColor: Colors.white,
            insetPadding: EdgeInsets.all(10),
            title: const Text(
              'The code has been send to your mail',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColor.primary, fontSize: 20),
            ),
            content: Container(
              //color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormFordCode(
                    controller1: BlocProvider.of<PreSignUpCubit>(context).ctr1,
                    controller2: BlocProvider.of<PreSignUpCubit>(context).ctr2,
                    controller3: BlocProvider.of<PreSignUpCubit>(context).ctr3,
                    controller4: BlocProvider.of<PreSignUpCubit>(context).ctr4,
                    controller5: BlocProvider.of<PreSignUpCubit>(context).ctr5,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('remaining time',style: TextStyle(color: AppColor.primary, fontSize: 16),),
                      Text('resnd code',style: TextStyle(color: AppColor.primary, fontSize: 16),),
                    ],
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              ElevatedButtonIcon(
                  label: 'Done',
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          );
        },
      );
    });
      
      });
       
  }
  