import 'package:flutter/material.dart';
import 'package:plantdisease_new/hastalikDetay.dart';

class Bilgi extends StatefulWidget {
  @override
  _BilgiState createState() => _BilgiState();
}

class _BilgiState extends State<Bilgi> {
  late List<Widget> gosterilecekListe;

  hastalikKarti(
      String isim, String resimUrl, String symptoms, String treatment) {
    final double genislik = MediaQuery.of(context).size.width;
    final double yukseklik = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HastalikDetay(
                      isim: isim,
                      resimYolu: resimUrl,
                      symptoms: symptoms,
                      treatment: treatment,
                    )));
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: genislik * 0.3,
              height: yukseklik * 0.15,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(resimUrl),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(genislik * 0.03)),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              isim,
              style: TextStyle(
                  fontSize: genislik * 0.03, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(genislik * 0.02),
            color: Colors.white38,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 4,
                  spreadRadius: 2)
            ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var capsules;
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      padding: EdgeInsets.all(10),
      childAspectRatio: 1,
      children: [
        hastalikKarti(
            "Acne",
            "assets/images/acne.jpeg",
            "Whiteheads (closed plugged pores), Blackheads (open plugged pores), Small red, tender bumps (papules),Pimples (pustules), which are papules with pus at their tips,Large, solid, painful lumps under the skin (nodules),Painful, pus-filled lumps under the skin (cystic lesions)",
            "If self-care remedies don't clear your acne, see your primary care doctor. He or she can prescribe stronger medications. If acne persists or is severe, you may want to seek medical treatment from a doctor who specializes in the skin (dermatologist or pediatric dermatologist)."),
        hastalikKarti(
            "Acne or Rosacea",
            "assets/images/acneorrosacea.jpeg",
            "Burning and stinging sensations,permanent redness,spots (papules and pustules),small blood vessels in the skin becoming visible",
            "Avoiding known triggers – for example, avoiding drinks containing alcohol or caffeine,creams and gels – medications applied directly to the skin to reduce spots and redness,oral medications – tablets or capsules that can help clear up more severe spots, such as oral antibiotics"),
        hastalikKarti(
            "Acnitic Keratosis",
            "assets/images/Actinic_keratosis.jpeg",
            "Rough, dry or scaly patch of skin, usually less than 1 inch (2.5 centimeters) in diameter,Flat to slightly raised patch or bump on the top layer of skin,In some cases, a hard, wartlike surface,Color variations, including pink, red or brown,Itching, burning, bleeding or crusting,New patches or bumps on sun-exposed areas of the head, neck, hands and forearms",
            "Limit your time in the sun. Especially avoid time in the sun between 10 a.m. and 2 p.m. And avoid staying in the sun so long that you get a sunburn or a suntan.Use sunscreen. Before spending time outdoors, even on cloud days, apply a broad-spectrum water-resistant sunscreen with a sun protection factor (SPF) of at least 30, as the American Academy of Dermatology recommends."),
        // hastalikKarti(
        //     "Atopic Dermatisis",
        //     "assets/images/atopicdermatitis.jpg",
        //     "Dry skin,Itching, which may be severe, especially at night,Red to brownish-gray patches, especially on the hands, feet, ankles, wrists, neck, upper chest, eyelids, inside the bend of the elbows and knees, and in infants, the face and scalp,Small, raised bumps, which may leak fluid and crust over when scratched",
        //     "Moisturize your skin at least twice a day, Try to identify and avoid triggers that worsen the condition,Take shorter baths or showers,Take a bleach bath,Use only gentle soaps"),
        hastalikKarti(
            "Basal Cell Carcinoma",
            "assets/images/Basal_Cell_Carcinoma.jpeg",
            "A pearly white, skin-colored or pink bump ,A brown, black or blue lesion,A flat, scaly, reddish patch,A white, waxy, scar-like lesion",
            "Avoid the sun during the middle of the day, Wear sunscreen year-round, Wear protective clothing,Avoid tanning beds,Check your skin regularly and report changes to your doctor"),
        // hastalikKarti(
        //     "Bullous Pemphigoid",
        //     "assets/images/bullous.jpeg",
        //     "Itching skin, weeks or months before blisters form,Large blisters that don't easily rupture when touched, often along creases or folds in the skin,Skin around the blisters that is normal, reddish or darker than normal,Eczema or a hive-like rash,Small blisters or sores in the mouth or other mucous membranes (benign mucous membrane pemphigoid)",
        //     "Corticosteroids, Steroid-sparing drugs,Other drugs that fight inflammation "),
        // hastalikKarti(
        //     "Cellulitis Impetigo",
        //     "assets/images/cellu.jpeg",
        //     "The main symptom of impetigo is reddish sores, often around the nose and mouth. The sores quickly rupture, ooze for a few days and then form a honey-colored crust. Sores can spread to other areas of the body through touch, clothing and towels. Itching and soreness are generally mild.",
        //     "Gently wash the affected areas with mild soap and running water and then cover lightly with gauze, Wash an infected person's clothes, linens and towels every day with hot water and don't share them with anyone else in your family, Wear gloves when applying antibiotic ointment and wash your hands thoroughly afterward,Cut an infected child's nails short to prevent damage from scratching"),
        // hastalikKarti(
        //     "Dermatofibroma",
        //     "assets/images/Dermatofibroma.jpeg",
        //     "A round bump that is mostly under the skin, usually harmless and painless, but occasionally may be itchy, tender, painful, or feel inflamed.",
        //     "Most dermatofibromas do not require treatment. They can be safely left alone and will usually cause no symptoms aside from their appearance on the skin. However, some people still choose to remove them. Removal is especially common if the growth is unsightly or in an embarrassing place."),
        // hastalikKarti(
        //     "Exanthems of Drug",
        //     "assets/images/Exanthems_or_Drug.jpeg",
        //     "Skin rash, Hives, Itching, Fever, Shortness of breath, Wheezing",
        //     "nform health care workers, Wear a medical alert bracelet that identifies your drug allergy. This information can ensure proper treatment in an emergency."),
        hastalikKarti(
            "Hair Loss",
            "assets/images/hair.jpeg",
            "Gradual thinning on top of head,Circular or patchy bald spots, Sudden loosening of hair, Full-body hair loss ",
            "Ask your doctor about medications and supplements you take that might cause hair loss, Protect your hair from sunlight and other sources of ultraviolet light, Stop smoking. Some studies show an association between smoking and baldness in men, If you're being treated with chemotherapy, ask your doctor about a cooling cap. This cap can reduce your risk of losing hair during chemotherapy."),
        hastalikKarti(
            "Eczama",
            "assets/images/eczama.jpg",
            "Itching. This is the worst aspect because it can be upsetting for a young child with eczema. It also makes the child scratch causing further rawness of the skin and possible infections to develop. Redness caused by extra blood flowing through the blood vessels in the skin in the affected area. A grainy appearance to the skin, caused by tiny fluid-filled blisters just under the skin called “vesicles.” Weeping when the blisters burst, either by themselves or because of scratching, and the fluid oozes on to the surface of the skin. Crusts or scabs that form when the fluid dries. Children with eczema often have dry, scaly skin. This may be the result of the eczema or it may also be the natural skin type of the family. Dry skin can be a predisposing factor to developing eczema. ",
            "Avoiding likely sources of irritation (triggers). Using emollients such as special bath oils and moisturisers. "),
        // hastalikKarti(
        //     "Herpes or HPV",
        //     "assets/images/Herpes_HPV.jpeg",
        //     "Genital warts, sores around the mouth or genitals, flu-like symptoms",
        //     "Medication for genital warts, health checks for high-risk HPV"),
        // hastalikKarti(
        //     "Light Skin (Vitiligo)",
        //     "assets/images/Light_Diseases.jpeg",
        //     "Patchy loss of skin color, which usually first appears on the hands, face, and areas around body openings and the genitals, Premature whitening or graying of the hair on your scalp, eyelashes, eyebrows or beard, Loss of color in the tissues that line the inside of your mouth and nose (mucous membranes)",
        //     "See your doctor if areas of your skin, hair or mucous membranes lose coloring. Vitiligo has no cure. But treatment might stop or slow the discoloring process and return some color to your skin.Request an Appointment at Mayo Clinic Causes"),
        // hastalikKarti("Lupus", "assets/images/Lupus.jpeg",
        //     "Fatigue, Joint pain, stiffness and swelling", ""),
        hastalikKarti(
            "Melanoma",
            "assets/images/melanoma.jpeg",
            "A change in an existing mole, the development of a new pigmented or unusual-looking growth on your skin",
            "Avoid the sun during the middle of the day, wear sunscreen year-round, avoid tanning lamps and beds."),
        hastalikKarti(
            "Nail Fungus",
            "assets/images/Nail_Fungus.jpeg",
            "Thickened,Whitish to yellow-brown discoloration,Brittle, crumbly or ragged,Distorted in shape,A dark color, caused by debris building up under your nail,Smelling slightly foul",
            "Wash your hands and feet regularly. Wash your hands after touching an infected nail. Moisturize your nails after washing, Trim nails straight across, smooth the edges with a file and file down thickened areas. Disinfect your nail clippers after each use, Choose shoes made of materials that breathe, Discard old shoes or treat them with disinfectants or antifungal powders, Give up nail polish and artificial nails."),
        // hastalikKarti(
        //     "Poison Lvy",
        //     "assets/images/Poison_Lvy.jpeg",
        //     "Redness,Itching,Swelling,Blisters,Difficulty breathing, if you've inhaled the smoke from burning poison ivy",
        //     "Avoid the plants, Wear protective clothing, Remove or kill the plants, Wash your skin or your pet's fur."),
        // hastalikKarti(
        //     "Psoriasis Lichen",
        //     "assets/images/Psoriasis_Lichen.jpeg",
        //     "Bumps that are raised, flat-topped, firm, shiny, and reddish or purple, bumps that may have a white line through them, bumps that are sometimes itchy (in mild to severe cases), often affects the wrists, lower back, or ankles, unclear what triggers flare-ups",
        //     "Treatment options for psoriasis include: topical treatments, oral treatments, light therapy,systemic treatments, which are drugs that work throughout the body,biologic drug therapy"),
        // hastalikKarti(
        //     "Scabies Lyme",
        //     "assets/images/Scabies_Lyme.jpeg",
        //     "The most common symptoms of scabies, itching and a skin rash, are caused by sensitization (a type of “allergic” reaction) to the proteins and feces of the parasite. Severe itching (pruritus), especially at night, is the earliest and most common symptom of scabies. A pimple-like (papular) itchy (pruritic) “scabies rash” is also common. Itching and rash may affect much of the body or be limited to common sites such as: Between the fingers, Wrist, Elbow,Armpit, Penis, Nipple, Waist, Buttocks, Shoulder blades",
        //     "Bedding, clothing, and towels used by infested persons or their household, sexual, and close contacts (as defined above) anytime during the three days before treatment should be decontaminated by washing in hot water and drying in a hot dryer, by dry-cleaning, or by sealing in a plastic bag for at least 72 hours. Scabies mites generally do not survive more than 2 to 3 days away from human skin."),
        // hastalikKarti(
        //     "Seborrheic Keratoses",
        //     "assets/images/Seborrheic_Keratoses.jpeg",
        //     "The growths can: Be slightly raised from the surrounding skin, Be white or light tan in appearance, which may darken to brown or black, Have a waxy, pasted-on look, Look scaly or like a wart, Be well-defined from the surrounding skin",
        //     ""),
        hastalikKarti(
            "Skin  Allergy ",
            "assets/images/Ski_ Allergy.jpeg",
            "Itchy, red or dry skin. It may “weep” or leak fluid that crusts over when scratched, which means that it is also infected. In infants, eczema often appears on the face. Children are prone to have the rash at the bends of the elbow joint, wrists, behind the knees and behind the ears. Adolescents and young adults typically have the rash in the same locations as children, as well as on the hands and feet",
            "Contact dermatitis and eczema are generally not medical emergencies. Prescription medications used to treat skin allergy include topical corticosteroids to reduce inflammation and relieve itching. These drugs, which come as ointments or creams, include: Cordran (flurandrenolide), Psorcon (diflorasone diacetate), Topicort (desoximetasone), Lidex (fluocinonide)"),
        // hastalikKarti(
        //     "Squamous Cell",
        //     "assets/images/Squamous_Cel.jpeg",
        //     "SCC often occurs in areas exposed to UV radiation, such as the face, ears, and hands. However, it can also appear in the mouth, in the anal area, and on the genitals. In its early stages, SCC often presents itself as a scaly, reddish patch of skin. As it progresses, it can turn into a raised bump that continues to grow. The growth may also crust or bleed. In the mouth, this cancer will take on the appearance of a mouth ulcer or a white patch",
        //     "Mohs micrographic surgery, Excisional surgery, Electrosurgery, Cryosurgery"),
        // hastalikKarti(
        //     "Systemic Disease",
        //     "assets/images/Systemic_Disease.jpeg",
        //     "Systemic Disease The hands, being composed of many types of tissue, including blood vessels, nerves, skin and skin-related tissues, bones, and muscles/tendons/ligaments, may show changes that reflect a disease that affects other parts of, or even the whole body (systemic disease). The hands may show changes noticed by the patient or his/her hand surgeon even before the systemic disease is detected",
        //     "Lifestyle modifications through proper and regular exercise, Medications, Surgery"),
        // hastalikKarti(
        //     "Urticaria Hives",
        //     "assets/images/Urticaria_Hives.jpeg",
        //     "Batches of red or skin-colored welts (wheals), which can appear anywhere on the body, Welts that vary in size, change shape, and appear and fade repeatedly as the reaction runs its course, Itching, which may be severe, Painful swelling (angioedema) of the lips, eyelids and inside the throat",
        //     "Avoid known triggers, See an allergist, who is specially trained to look for triggers to your hives and may recommend medications to prevent the hives or reduce the severity of symptoms. Whether your allergist suggests a treatment available only by prescription or an over the counter treatment will depend on several factors, including how uncomfortable the hives are making you."),
        hastalikKarti(
            "Vascular Lesion",
            "assets/images/Vascular_Lesion.jpeg",
            "A vascular malformation is an abnormal development of blood vessels. They might be found in the large arteries and veins, in smaller vessels called arterioles and venules, in microscopic capillaries, and/or in the lymphatic channels that carry lymphatic fluid and white blood cells outside of the arteries and veins.",
            "Catheter-based techniques such as embolization, a procedure to close off a problematic blood vessel; and sclerotherapy, the injection of a chemical to cause a vessel to close, Laser therapy, Simple observation with regular follow-up visits, Surgery, sometimes followed by reconstruction, which may be used in conjunction with other treatments. If there are widespread, deep lesions, multiple treatments are often necessary"),
        hastalikKarti(
            "Tinea Ringworm",
            "assets/images/tina.jpg",
            "The main symptom of ringworm is a rash. It may look red, silver or darker than surrounding skin, depending on your skin tone. The rash may be scaly, dry, swollen or itchy.",
            "You may need to use an antifungal medicine every day for up to 4 weeks. It's important to use it for the right amount of time, even if the rash has gone away."),
        hastalikKarti(
            "Vasculitis ",
            "assets/images/Vasculitis.jpeg",
            "Vasculitis can have general symptoms like fever, loss of appetite, weight loss, and fatigue.It can also cause specific problems, depending on the body part that’s involved. If it’s your skin, you might have a rash. If your nerves aren’t getting enough blood, you could have numbness and weakness.",
            "Your doctor will probably give you corticosteroid medications, also known as steroids, to fight inflammation. You might need to take them for a long time. Your doctor will watch you closely for side effects like high blood pressure, high blood sugar, and bone problems."),
        hastalikKarti(
            "Warts Molluscum ",
            "assets/images/wart.jpeg",
            "very small, shiny, and smooth in appearance, flesh-colored, white, or pink, firm and shaped like a dome with a dent or dimple in the middle, filled with a central core of waxy material, between 2 to 5 millimeters in diameter, or between the size of the head of a pin and the size of an eraser on the top of a pencil",
            "The most effective treatments for molluscum contagiosum are performed by a doctor. These include cryotherapy, curettage, laser therapy, and topical therapy."),
      ],
    );
  }
}
