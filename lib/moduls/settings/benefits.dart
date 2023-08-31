import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class benefits extends StatelessWidget {
   benefits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Center(child: Text('معلومات تهمك',style: TextStyle(color: Colors.black),)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  ExpansionTile(
                    expandedAlignment: Alignment.centerRight,
                    title: Text(
                      'المميزات التي يحتويها البرنامج',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(color: Colors.red),
                    ),
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '${featur} ',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),

                    ],
                  ),
                  ExpansionTile(
                    expandedAlignment: Alignment.centerRight,
                    title: Text(
                      ' أهمية التبرع',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(color: Colors.red),
                    ),
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'كل ثلاث سنوات هناك شخص يحتاج الي نقل الدم',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      const Divider(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'واحد من كل عشرة مرضي يدخلون الي المستشفي في حاجة الي نقل الدم',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      const Divider(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'دمك ينقذ اربعة اشخاص عند فصلة وليس شخصا واحداّّ',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      const Divider(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'يستطيع المتبرع الحصول علي نتائج فحوصات المسح الخاصة به',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      const Divider(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                         'تعيد عملية التبرع بالدم الحيوية للجسم لانها تجدد خلايا الدم',
                          style: Theme.of(context).textTheme.subtitle1,

                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  ExpansionTile(
                    expandedAlignment: Alignment.centerRight,
                    title: Text(
                      ' كيفية التبرع',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(color: Colors.red),
                    ),
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '${te} ',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),

                    ],
                  ),
                  ExpansionTile(
                    expandedAlignment: Alignment.centerRight,
                    title: Text(
                      ' الأسباب التي تمنعك من التبرع؟',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(color: Colors.red),
                    ),
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '1-جميع أنواع الأنيميا عدا أنيميا نقص الحديد',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      const Divider(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '2- الأمراض الصدرية المزمنة',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      const Divider(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '3-إرتفاع الضغط المزمن ',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      const Divider(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '4-الإتهاب الكبدي الفيروسي',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      const Divider(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '6-حالات الفشل الكلوي',
                          style: Theme.of(context).textTheme.subtitle1,

                        ),
                      ),
                      const Divider(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '7-حالات تضخم الكبد',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),const Divider(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '8-حالات الصرع والإغماء المتكرر',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),const Divider(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '9-زيادة او نقص إفرازات الغدة الدرقية',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),const Divider(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '10-الحمل',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),const Divider(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '11-أمراض نزيف الدم',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),const Divider(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '12-الأمراض الوراثية',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),const Divider(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '13-الأمراض النفسية',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),const Divider(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '14-أي عمليات خلال فترة ثلاثة أشهر',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),const Divider(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '15-فقدان غير متوقع للوزن والشهية',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),const Divider(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '16-عرق ليلي',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),const Divider(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '17-سخونية ليلية ',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),

                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  ExpansionTile(
                    expandedAlignment: Alignment.centerRight,
                    title: Text(
                      ' متي يمكنني معاودة التبرع؟',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(color: Colors.red),
                    ),
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '${reDon} ',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),

                    ],
                  ),
                  ExpansionTile(
                    expandedAlignment: Alignment.centerRight,
                    title: Text(
                      'كميةالدم التي يتم أخذها في المرة الواحدة',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(color: Colors.red),
                    ),
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '${quen} ',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),

                    ],
                  ),





                ],
              ),
            ),
          ),
        ),
      ),
    );

  }

  String te='عن طريق جمع الدم في كيس يحتوي على مادة مانعة للتجلط متصل بأبرة معقمة تستعمل لمرة واحدة فقط توصل من الوريد في الذراع، وتتم عملية التبرع بالدم في فترة زمنية تقريباً 5 - 10 دقائق في هذه الفترة يكون المتبرع تحت الرعاية الطبية المباشرة، ولكن تستغرق الزيارة بأكملها مدة تتراوح بين 15-20 دقيقة.';
  String quen='يتم أخذ من 400 إلى 450 مليلترا، وهو ما يمثل حوالي 1/12 من حجم الدم الموجود داخل جسم كل إنسان، والذي يتراوح بين 5 إلى 6 لترات.';
  String reDon=' ينصح بالتبرع بالدم بعد مرور 6 أشهر من اخر تبرع بالدم في حين أنه لتكرار التبرع يمكن التبرع بالدم قبل ذلك في الفترة من 3-4 أشهر، ولكن يجب أن يكون المتبرع لائق طبيا.';
  String featur='يحتوي التطبيق علي الكثير من الميزات التي تجعل عملية التبرع اكثر سهولة من اهما انه يتيح عملية التواصل بين المتبرع والمريض كما يوفر للمتبرع فحص بعد كل عملية تبرع للاطمئنان علي صحتة الجسدية ';
}
