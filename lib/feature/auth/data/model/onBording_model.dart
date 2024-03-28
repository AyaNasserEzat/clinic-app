import 'package:clinic/core/utiles/app_assets.dart';
import 'package:clinic/core/utiles/app_strings.dart';

class OnBoedingModel{
  String imagpath;
  String title;
  String subTitle;
  OnBoedingModel({required this.imagpath,required this.title,required this.subTitle});
  static  List<OnBoedingModel>onBordingSreens=[
OnBoedingModel(imagpath: ApppAssets.on1, title: AppStrings.ontitle1, subTitle: AppStrings.onSubtitle1),
OnBoedingModel(imagpath: ApppAssets.on2, title: AppStrings.ontitle2, subTitle: AppStrings.onSubtitle2),
OnBoedingModel(imagpath: ApppAssets.on3, title: AppStrings.ontitle3, subTitle: AppStrings.onSubtitle3),
  ];
}