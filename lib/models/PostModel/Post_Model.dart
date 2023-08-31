class PostModel
{
  String? name;
  String? image;
  String? uId;
  String? bloodtype;
  String? dateTime;
  String? PostImage;
  String? patient_name;
  String? patient_blood_type;
  String? patient_address;
  String? patient_disease;
  String? patient_age;
  String? patient_phone;

  PostModel({this.name,
    this.dateTime,
    this.uId,
    this.patient_name,
    this.PostImage,
    this.image,
    this.patient_blood_type,
    this.patient_address,
    this.patient_disease,
    this.patient_age,
    this.patient_phone,
    this.bloodtype,

  });
  PostModel.fromJson(Map<String,dynamic>json)
  {
    dateTime = json['dateTime'];
    image = json['image'];
    name = json['name'];
    patient_name = json['patient_name'];
    uId = json['uId'];
    patient_blood_type = json['patient_blood_type'];
    patient_address = json['patient_address'];
    patient_disease = json['patient_disease'];
    patient_age = json['patient_age'];
    patient_phone = json['patient_phone'];
    PostImage = json['PostImage'];
    bloodtype = json['bloodtype'];


  }
  Map<String,dynamic >toMap()
  {
    return
      {
        'name':name,
        'patient_name':patient_name,
        'image':image,
        'dateTime':dateTime,
        'PostImage':PostImage,
        'patient_blood_type':patient_blood_type,
        'patient_address':patient_address,
        'patient_disease':patient_disease,
        'patient_age':patient_age,
        'patient_phone':patient_phone,
        'uId':uId,
        'bloodtype':bloodtype,



      };
  }

}