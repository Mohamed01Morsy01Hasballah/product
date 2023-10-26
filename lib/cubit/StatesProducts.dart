import '../models/AddCourseModel.dart';

abstract class ProductStates{}
class initialState extends ProductStates{}
class changeButtonNavState extends ProductStates{}
class GetProductLoadingState extends ProductStates{}
class GetProductSuccessState extends ProductStates{}
class GetProductErrorState extends ProductStates{}
class GetCategorySuccessState extends ProductStates{}
class GetCategoryErrorState extends ProductStates{}
class AddLoadingState extends ProductStates{}
class AddSuccessState extends ProductStates{}
class AddErrorState extends ProductStates{}
class RegisterchangeIconState extends ProductStates{}
class ImageState extends ProductStates{}
class GetCourseLoadingState extends ProductStates{}
class GetCourseSuccessState extends ProductStates{}
class GetCourseErrorState extends ProductStates{}

class AddCourseLoadingState extends ProductStates{}
class AddCourseSuccessState extends ProductStates{
  final AddCourseModel model;
  AddCourseSuccessState(this.model);

}
class AddCourseErrorState extends ProductStates{}
