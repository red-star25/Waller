import 'package:waller/Catagory_Model.dart';

List<Catagory_Model> getCatagory(){
  List<Catagory_Model> catagory = List();
  Catagory_Model catagory_model = Catagory_Model();

  catagory_model.catagoryName ="Art";
  catagory_model.imageUrl = "https://artfiles.alphacoders.com/131/131749.jpg";
  catagory.add(catagory_model);
  catagory_model = Catagory_Model();

  catagory_model.catagoryName ="Abstact";
  catagory_model.imageUrl = "https://images.alphacoders.com/254/thumb-1920-25401.jpg";
  catagory.add(catagory_model);
  catagory_model = Catagory_Model();

  catagory_model.catagoryName ="Games";
  catagory_model.imageUrl = "https://images.pexels.com/photos/194511/pexels-photo-194511.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";
  catagory.add(catagory_model);
  catagory_model = Catagory_Model();

  catagory_model.catagoryName ="Movies";
  catagory_model.imageUrl = "https://images.pexels.com/photos/1200450/pexels-photo-1200450.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";
  catagory.add(catagory_model);
  catagory_model = Catagory_Model();

  catagory_model.catagoryName ="Coding";
  catagory_model.imageUrl = "https://images.pexels.com/photos/225769/pexels-photo-225769.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";
  catagory.add(catagory_model);
  catagory_model = Catagory_Model();

  catagory_model.catagoryName ="Space";
  catagory_model.imageUrl = "https://images6.alphacoders.com/542/thumb-1920-542443.jpg";
  catagory.add(catagory_model);
  catagory_model = Catagory_Model();

  return catagory;

}